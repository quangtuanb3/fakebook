package DAO;

import Model.User;
import Utils.AppUtil;
import services.dto.PageableRequest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DatabaseConnection {
    private final String SELECT_USERS = "SELECT * FROM `users`";
    private final String SELECT_USERS_ID = "SELECT MAX(id) as max_id FROM `users`";
    private final String EXISTED_EMAIL = "SELECT COUNT(1) as cnt  FROM `users` u   WHERE u.`email`= ? group by email limit 1 ";

    private final String UPDATE_USER = "UPDATE `users` SET `email` = ? WHERE (`id` = ?);";

    private final String INSERT_USERS = "INSERT INTO `users` (`email`, `password`) \n" +
            "VALUES (?, ?)";
    private final String FIND_BY_EMAIL = "SELECT *  FROM `users` u  WHERE u.`email` = ?"; // show Edit

    private final String DELETE_BY_ID = "DELETE FROM `users` WHERE (`id` = ?)";

    public User getUserByEmail(String email) {
 User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
//
            while (rs.next()) {
                user= AppUtil.getObjectFromResultSet(rs, User.class);
                // Now you can access the data without errors
//                Integer id = rs.getInt("id");
//                String emailDB = rs.getString("email");
//                String password = rs.getString("password");
//                user = new User(id, emailDB, password);
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
                     .prepareStatement(EXISTED_EMAIL)) {
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
                     .prepareStatement(INSERT_USERS)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private User getUserByResultSet(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("id");
        String email = rs.getString("email");
        String password = rs.getString("email");
        return new User(id, email, password);
    }
}