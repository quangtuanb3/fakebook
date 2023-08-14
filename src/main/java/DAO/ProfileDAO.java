package DAO;

import Model.Enum.EGender;
import Model.Enum.EStatus;
import Model.Profile;
import Model.User;
import Utils.AppUtil;
import services.dto.Enum.ESortType;
import services.dto.PageableRequest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProfileDAO extends DatabaseConnection {
    private final String TABLE_PROFILES = "profiles";
    private final String SELECT_ALL_PROFILES = "SELECT p.*,u.email `user.email`,u.role `user.role`,  u.id `user.id`, u.password `user.password`, u.status `user.status`  FROM `profiles` p LEFT JOIN " +
            "`users` u on p.user_id = u.id  WHERE p.`name` like  '%s' OR p.`dob` like '%s' OR p.`cover` like '%s' OR p.`gender` like '%s' OR p.`user_id` like '%s'  Order BY %s %s LIMIT %s OFFSET %s";
    private final String SELECT_TOTAL_RECORDS = "SELECT COUNT(1) as cnt  FROM `profiles` p LEFT JOIN " +
            "`users` u on p.user_id = u.id  WHERE p.`name` like '%s' OR p.`dob` like '%s' OR p.`cover` like '%s' OR p.`gender` like '%s' OR p.`user_id` like '%s'";
    private final String INSERT_PROFILES = "INSERT INTO `profiles` (`name`,`avatar`, `user_id`, `dob`,`gender`, `phone`, `cover`, ) VALUES ( ?,?,?, ?, ?, ?, ?)";
//
//    private final String UPDATE_TEACHERS = "UPDATE `teachers` SET `name` = ?, `dob` = ?, `hobie` = ?, `gender` = ?, `category_id` = ? WHERE (`id` = ?)";

private final String FIND_PROFILE_ID_BY_EMAIL = "select id from (select p.*, u.email from `profiles` p Left join `users` u\n" +
        "on p.user_id = u.id) as temp \n" +
        "where email = ?;";
private final String FIND_PROFILE_BY_EMAIL =
        """
                select temp.id, temp.name, temp.phone, temp.avatar, temp.dob, temp.gender, temp.cover, temp.user_id as `user.id`, temp.email as `user.email` \s
                from\s
                (select  profiles.*, users.email\s
                from `profiles`\s
                left join `users`\s
                on profiles.user_id = users.id ) as temp\s
                where temp.email = ?
                """;
    private final String FIND_BY_ID = "SELECT p.*, u.email `user.email`, u.password `user.password`, u.id as `user.id`, u.role as `user.role`  FROM " +

            "`profiles` p LEFT JOIN `users` u on p.user_id = u.id WHERE p.`id` = ?";
    private final String EXIST_BY_ID = "SELECT count(*) as `cnt` FROM `profiles` WHERE `id` = ? group by id limit 1";
    private final String DELETE_BY_ID = "DELETE FROM `profiles` WHERE (`id` = ?)";

    public List<Profile> findAll(PageableRequest request) {
        List<Profile> profiles = new ArrayList<>();
        String search = request.getSearch();
        if (request.getSortField() == null) {
            request.setSortField("id");
        }
        if (request.getSortType() == null) {
            request.setSortType(ESortType.DESC);
        }
        if (search == null) {
            search = "%%";
        } else {
            search = "%" + search + "%";
        }
        var offset = (request.getPage() - 1) * request.getLimit();
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(String.format(SELECT_ALL_PROFILES, search, search, search, search, search,
                             request.getSortField(), request.getSortType(), request.getLimit(), offset))) {

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                profiles.add(AppUtil.getObjectFromResultSet(rs, Profile.class));
            }
            PreparedStatement statementTotalRecords = connection
                    .prepareStatement(String.format(SELECT_TOTAL_RECORDS, search, search, search, search, search));
            ResultSet resultSetOfTotalRecords = statementTotalRecords.executeQuery();
            if (resultSetOfTotalRecords.next()) {
                int totalPage =
                        (int) Math.ceil(resultSetOfTotalRecords.getDouble("cnt") / request.getLimit());
                request.setTotalPage(totalPage);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return profiles;
    }

    public void insertProfile(Profile profile) {
        try (Connection connection = getConnection();

             PreparedStatement preparedStatement = connection
                     .prepareStatement(AppUtil.buildInsertSql(TABLE_PROFILES, profile))) {
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateProfile(Profile profile) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(AppUtil.buildUpdateSql(TABLE_PROFILES, profile))) {
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Profile findById(Integer id) {
        Profile profile = new Profile();
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_ID)) {
            preparedStatement.setLong(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return getProfileFromResultSet(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return profile;
    }

    public Boolean existByID(Integer id) {
        try (Connection connection = getConnection();
             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(EXIST_BY_ID)) {
            System.out.println(preparedStatement);
            preparedStatement.setLong(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                long count = rs.getLong("cnt");
                if (count > 0) return true;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public Integer findProfileIdByEmail(String email) {
        int profile_Id = 0;
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_PROFILE_ID_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                profile_Id = rs.getInt("id");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return profile_Id;
    }
    public Profile findProfileByEmail(String email) {
     Profile profile = new Profile();
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_PROFILE_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                 profile = getProfileFromResultSet(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return profile;
    }

    private Profile getProfileFromResultSet(ResultSet rs) throws SQLException {
        Profile profile = new Profile();
        profile.setId(rs.getInt("id"));
        profile.setAvatar(rs.getString("avatar"));
        profile.setCover(rs.getString("cover"));
        profile.setName(rs.getString("name"));
        profile.setDob(rs.getDate("dob"));
        profile.setGender(EGender.valueOf(rs.getString("gender")));
        profile.setUser(new User(rs.getInt("user.id"), rs.getString("user.email")));
        return profile;
    }


}
