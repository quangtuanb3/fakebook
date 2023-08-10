package DAO;


import Model.Login;
import Model.User;
import Utils.AppConstant;
import Utils.AppUtil;
import services.UserService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;

public class AuthDAO extends DatabaseConnection {
    private static AuthDAO authDAO = new AuthDAO();

    static {
        authDAO = new AuthDAO();
    }
    public static AuthDAO getAuthDAO() {
        return authDAO;
    }
    public void register(User user){
        try (Connection connection = getConnection();
             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(AppUtil.buildInsertSql(AppConstant.USERS_TBL, user))) {
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Optional<Login> findByEmail(String email) {
        final String FIND_BY_EMAIL = "SELECT * FROM `users` WHERE `email` = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return Optional.ofNullable(AppUtil.getObjectFromResultSet(rs, Login.class));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Optional.empty();
    }
}
