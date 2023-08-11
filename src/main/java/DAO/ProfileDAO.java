package DAO;

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

public class ProfileDAO extends DatabaseConnection{
    private final String TABLE_PROFILES = "profiles";
    private final String SELECT_ALL_PROFILES = "SELECT p.*,u.email `user.email`,  u.id `user.id`, u.password `user.password`, u.status `user.status`  FROM `profiles` p LEFT JOIN " +
            "`users` u on p.user_id = u.id  WHERE p.`name` like  '%s' OR p.`dob` like '%s' OR p.`cover` like '%s' OR p.`gender` like '%s' OR p.`user_id` like '%s'  Order BY %s %s LIMIT %s OFFSET %s";
    private final String SELECT_TOTAL_RECORDS = "SELECT COUNT(1) as cnt  FROM `profiles` p LEFT JOIN " +
            "`users` u on p.user_id = u.id  WHERE p.`name` like '%s' OR p.`dob` like '%s' OR p.`cover` like '%s' OR p.`gender` like '%s' OR p.`user_id` like '%s'";
    private final String INSERT_PROFILES ="INSERT INTO `profiles` (`name`,`avatar`, `user_id`, `dob`,`gender`, `phone`, `cover`, ) VALUES ( ?,?,?, ?, ?, ?, ?)";
//
//    private final String UPDATE_TEACHERS = "UPDATE `teachers` SET `name` = ?, `dob` = ?, `hobie` = ?, `gender` = ?, `category_id` = ? WHERE (`id` = ?)";
private final String FIND_PROFILE_ID_BY_EMAIL = "select id from (select p.*, u.email from `profiles` p Left join `users` u\n" +
        "on p.user_id = u.id) as temp \n" +
        "where email = ?;";
    private final String FIND_BY_ID = "SELECT p.*, u.email user_email, u.password user_password  FROM " +
            "`profiles` p LEFT JOIN `users` u on p.user_id = u.id WHERE p.`id` = ?";
    private final String EXIST_BY_ID = "SELECT count(*) as `cnt` FROM `profiles` WHERE `id` = ? group by id limit 1";
    private final String DELETE_BY_ID = "DELETE FROM `profiles` WHERE (`id` = ?)";
    public List<Profile> findAll(PageableRequest request) {
        List<Profile> profiles = new ArrayList<>();
        String search = request.getSearch();
        if(request.getSortField() == null){
            request.setSortField("id");
        }
        if(request.getSortType() == null){
            request.setSortType(ESortType.DESC);
        }
        if(search == null){
            search = "%%";
        }else {
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
                    .prepareStatement(String.format(SELECT_TOTAL_RECORDS, search,  search, search, search, search));
            ResultSet resultSetOfTotalRecords = statementTotalRecords.executeQuery();
            if(resultSetOfTotalRecords.next()){
                int totalPage =
                        (int) Math.ceil(resultSetOfTotalRecords.getDouble("cnt")/request.getLimit());
                request.setTotalPage(totalPage);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return profiles;
    }
    public void insertProfile(Profile profile){
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
    public Optional<Profile> findById(Integer id) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_ID)) {
            preparedStatement.setLong(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return Optional.of(AppUtil.getObjectFromResultSet(rs,Profile.class));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Optional.empty();
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


}
