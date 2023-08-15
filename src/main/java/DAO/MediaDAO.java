package DAO;

import Model.Content;
import Model.Media;
import Utils.AppConstant;
import Utils.AppUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static Utils.AppConstant.CONTENT_TBL;

public class MediaDAO extends DatabaseConnection {
    private final String FIND_BY_ID = "SELECT * from `media` where id = ? ";
    private final String INSERT_MEDIA= "INSERT INTO `media` (`data`, `type`, `post_id`) VALUES (?,?,?);";
    private final String GET_LAST_INDEX = "SELECT LAST_INSERT_ID() as id;";
    private static MediaDAO mediaDAO;

    static {
        mediaDAO = new MediaDAO();
    }

    public static MediaDAO getMediaDAO() {
        return mediaDAO;
    }

//    public List<Content> getContent() {
//        List<Content> contents = new ArrayList<>();
//        String SELECT_CONTENTS = "SELECT * FROM `contents`";
//        try (Connection connection = getConnection();
//
//             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
//             PreparedStatement preparedStatement = connection
//                     .prepareStatement(SELECT_CONTENTS)) {
//            System.out.println(preparedStatement);
//
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//
//                contents.add(new Content(rs.getInt("id"), rs.getString("data")));
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return contents;
//    }

    public void insertMedia(Media media) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(AppUtil.buildInsertSql(AppConstant.MEDIA_TBL, media))) {
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //    public int getLastIndex() {
//        int content_id = -1;
//        try (Connection connection = getConnection();
//             PreparedStatement preparedStatement = connection
//                     .prepareStatement(GET_LAST_INDEX)) {
//            System.out.println(preparedStatement);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()){
//                content_id = rs.getInt("id");
//            }
//
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        return content_id;
//    }
//    public int insertAndGetId(Media media) throws SQLException {
//        int media_id = -1;
//        try (
//                Connection connection = getConnection();
//                PreparedStatement preparedStatement = connection
//                        .prepareStatement(INSERT_MEDIA)) {
//            preparedStatement.setString(1, media.getData());
//            System.out.println(preparedStatement);
//            preparedStatement.executeUpdate();
//
//            try (
//                    PreparedStatement preparedStatement2 = connection
//                            .prepareStatement(GET_LAST_INDEX)) {
//                System.out.println(preparedStatement);
//                ResultSet rs = preparedStatement2.executeQuery();
//                while (rs.next()) {
//                    media_id = rs.getInt("id");
//                }
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        }
//        return media_id;
//    }

    public Content findById(Integer contentId) {
        Content content = new Content();
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_ID)) {
            preparedStatement.setInt(1, contentId);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                content = AppUtil.getObjectFromResultSet(rs, Content.class);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return content;
    }

    public void update(Content content) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(AppUtil.buildUpdateSql(CONTENT_TBL, content))) {
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
