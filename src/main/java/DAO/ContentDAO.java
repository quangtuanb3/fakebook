package DAO;

import Model.Content;
import Model.Profile;
import Model.User;
import Utils.AppUtil;
import services.dto.Enum.ESortType;
import services.dto.PageableRequest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ContentDAO extends DatabaseConnection {
    public List<Content> getContent(){
        List<Content> contents = new ArrayList<>();
        String SELECT_CONTENTS = "SELECT * FROM `contents`";
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(SELECT_CONTENTS)) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {

                contents.add(new Content(rs.getInt("id"), rs.getString("data")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return contents;
    }
}
