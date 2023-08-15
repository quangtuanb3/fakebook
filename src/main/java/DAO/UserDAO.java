package DAO;

import Model.Enum.ERole;
import Model.Enum.EStatus;
import Model.Profile;
import Model.User;
import Utils.AppConstant;
import Utils.AppUtil;
import services.dto.PageableRequest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static Utils.AppConstant.USERS_TBL;

public class UserDAO extends DatabaseConnection {
    private static UserDAO userDAO = new UserDAO();

    static {
        userDAO = new UserDAO();
    }
    public static UserDAO getUserDAO() {
        return userDAO;
    }
    private final String SELECT_USERS = "SELECT * FROM `users`";
    private final String SELECT_USERS_ID = "SELECT MAX(id) as max_id FROM `users`";
    private final String EXISTED_EMAIL = "SELECT COUNT(1) as cnt  FROM `users` u   WHERE u.`email`= ? group by email limit 1 ";
    private final String EXISTED_ID ="SELECT COUNT(1) as cnt from `users` u WHERE u.`id` =?";
    private final String UPDATE_STATUS = "UPDATE `users` SET `status` = ? WHERE (`id` = ?);";

    private final String INSERT_USERS = "INSERT INTO `users` (`email`, `password`,`status`, `role`) \n" +
            "VALUES (?, ?, ?,?)";
    private final String FIND_BY_EMAIL = "SELECT *  FROM `users` u  WHERE u.`email` = ?"; // show Edit

    private final String DELETE_BY_ID = "DELETE FROM `users` WHERE (`id` = ?)";
    private final String SELECT_BY_ID = "SELECT * FROM `users` where id =?";

    public User getUserByEmail(String email) {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                user = AppUtil.getObjectFromResultSet(rs, User.class);
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }


    public List<User> findAll(PageableRequest request) {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(String.format(SELECT_USERS))) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                users.add(getUserByResultSet(rs));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return users;
    }


    public void deleteById(Integer id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(DELETE_BY_ID)) {
            preparedStatement.setLong(1, id);
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

//    public List<User> getUsers(){
//        List<User> users = new ArrayList<>();
//        try (Connection connection = getConnection();
//
//             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
//             PreparedStatement preparedStatement = connection
//                     .prepareStatement(SELECT_USERS)) {
//            System.out.println(preparedStatement);
//
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//
//                users.add(new User(rs.getLong("id"), rs.getString("email"),rs.getString("password")));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return users;
//    }

    public Boolean existByID(Integer id) {
        try (Connection connection = getConnection();
             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(EXISTED_ID)) {
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

    public void insertUser(User user) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(AppUtil.buildInsertSql(AppConstant.USERS_TBL, user))) {
            System.out.println(preparedStatement);


//            preparedStatement.setString(1, user.getEmail());
//            preparedStatement.setString(2, user.getPassword());
//            preparedStatement.setString(3, user.getStatus().toString());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private User getUserByResultSet(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("id");
        String email = rs.getString("email");
        String password = rs.getString("password");
        String status = rs.getString("status");
        String role = rs.getString("role");
        return new User(id, email, password, EStatus.valueOf(status), ERole.valueOf(role));
    }

    public void lock(Integer id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(preparedStatement);
            User user = new User();
            while (rs.next()) {
                user = AppUtil.getObjectFromResultSet(rs, User.class);
            }

            assert user != null;
            if (user.getStatus() == EStatus.ACTIVE) {
                user.setStatus(EStatus.LOCK);
            } else {
                user.setStatus(EStatus.ACTIVE);
            }
            updateUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateUser(User user) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(AppUtil.buildUpdateSql(USERS_TBL, user))) {
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean existByEmail(String email) {
        try (Connection connection = getConnection();
             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(EXISTED_EMAIL)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, email);
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

}