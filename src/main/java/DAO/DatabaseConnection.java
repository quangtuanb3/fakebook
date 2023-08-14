package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private final String JDBC_URL = "jdbc:mysql://14.225.205.182:1887/c0423i1_ttd_facebook"; // sửa chữ bài tập thành database của mình;
    private final String JDBC_USERNAME = "c0423i1_ttd";
    //                            password của mình
    private final String JDBC_PASSWORD = "Raisingthebar123!!/";


    protected  Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
