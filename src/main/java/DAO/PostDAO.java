

package DAO;

import Model.Content;
import Model.Enum.ELimit;
import Model.Post;
import Model.Profile;
import Utils.AppUtil;
import services.dto.PageableRequest;
import services.dto.Enum.ESortType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PostDAO extends DatabaseConnection {
    //    private final String SELECT_ALL_POSTS = "SELECT p.*,c.name `category.name`, c.id as `category.id`  FROM `Teachers` t LEFT JOIN " +
//            "`categories` c on t.category_id = c.id  WHERE t.`name` like '%s' OR t.`hobby` LIKE '%s' OR t.`gender` LIKE '%s' Order BY %s %s LIMIT %s OFFSET %s";
    private final String SELECT_ALL_POSTS = "SELECT p.*,u.email `user.email`, pr.name `profile.name`,pr.id as `profile.id`,ct.id `content.id`,ct.data `contents.data` FROM `posts` p LEFT JOIN `profiles` pr ON p.profile_id = pr.id left JOIN `contents` ct ON p.content_id = ct.id left join `users` u on pr.user_id = u.id  WHERE p.`location` like '%s' OR p.`limit` LIKE '%s' Order BY %s %s LIMIT %s OFFSET %s";
    //    private final String SELECT_TOTAL_RECORDS = "SELECT COUNT(1) as cnt  FROM `teachers` t LEFT JOIN " +
//            "`categories` c on t.category_id = c.id  WHERE t.`name` like '%s' OR t.`hobby` LIKE '%s'";
    private final String SELECT_TOTAL_RECORDS = "SELECT COUNT(1) as cnt  FROM `posts` p  WHERE p.`location` like '%s' OR p.`limit` LIKE '%s'";
    private final String UPDATE_POSTS = "UPDATE `posts` SET  `location` = ?, `limit` = ?, `content_id` = ? WHERE (`id` = ?);";

    private final String INSERT_POSTS = "INSERT INTO `posts` (`profile_id`, `location`, `limit`,`content_id`) VALUES(?, ?, ?, ?)";
    //    private final String FIND_BY_ID = "SELECT t.*,c.name category_name  FROM " +
//            "`teachers` t LEFT JOIN `categories` c on t.category_id = c.id WHERE t.`id` = ?"; // show Edit
    private final String FIND_BY_ID = "SELECT p.*,pr.*  FROM `posts` p LEFT JOIN `profiles` pr ON p.profile_id = pr.id WHERE p.`id` = ?";

    private final String DELETE_BY_ID = "DELETE FROM `posts` WHERE (`id` = ?)";


    public List<Post> findAll(PageableRequest request) {
        List<Post> posts = new ArrayList<>();
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
                     .prepareStatement(String.format(SELECT_ALL_POSTS, search, search,
                             request.getSortField(), request.getSortType(), request.getLimit(), offset))) {

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            //
            while (rs.next()) {
                posts.add(getPostByResultSet(rs));
            }
            PreparedStatement statementTotalRecords = connection
                    .prepareStatement(String.format(SELECT_TOTAL_RECORDS, search, search));
            ResultSet resultSetOfTotalRecords = statementTotalRecords.executeQuery();
            if (resultSetOfTotalRecords.next()) {
                int totalPage =
                        (int) Math.ceil(resultSetOfTotalRecords.getDouble("cnt") / request.getLimit());
                request.setTotalPage(totalPage);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return posts;
    }

    public void insertPost(Post post) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(INSERT_POSTS)) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, post.getProfile().getId());
            preparedStatement.setString(2, post.getLocation());
            preparedStatement.setString(3, post.getLimit().toString());
//            preparedStatement.setString(4,teacher.getGender().toString());
            preparedStatement.setInt(4, post.getContent().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updatePost(Post post) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(UPDATE_POSTS)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, post.getProfile().getName());
            preparedStatement.setString(2, post.getLocation());
            preparedStatement.setString(3, post.getLimit().toString());
            preparedStatement.setInt(4, post.getContent().getId());
            preparedStatement.setLong(5, post.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Optional<Post> findById(Integer id) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(FIND_BY_ID)) {
            preparedStatement.setLong(1, id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return Optional.of(AppUtil.getObjectFromResultSet(rs, Post.class));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Optional.empty();
    }

    public void deleteById(Integer id) {
        try (Connection connection = getConnection();

             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(DELETE_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    private Post getPostByResultSet(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("id");
        String profileName = rs.getString("profile.name");
        String location = rs.getString("location");
        String content = rs.getString("contents.data");
        String limit = rs.getString("limit");
        Profile profile = new Profile(profileName);
        Content content1 = new Content(content);
        return new Post(id, profile, location, content1, ELimit.valueOf(limit));
    }

}
