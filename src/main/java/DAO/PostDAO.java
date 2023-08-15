

package DAO;

import Model.Content;
import Model.Enum.ELimit;
import Model.Enum.EMedia;
import Model.Media;
import Model.Post;
import Model.Profile;
import Utils.AppUtil;
import services.AuthService;
import services.PostService;
import services.ProfileService;
import services.dto.PageableRequest;
import services.dto.Enum.ESortType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PostDAO extends DatabaseConnection {
    private static final String SELECT_ALL_SELF_POSTS =
            """
                    select temp.*, pro.name as `profile.name`, pro.avatar  as `profile.avatar`, m.type as `media.type`, m.data as `media.data`, m.id as `media.id` from
                    (SELECT
                        p.id,
                        MAX(p.time) AS time,
                        MAX(p.location) AS location,
                         MAX(c.id) AS `content.id`,
                        MAX(c.data) AS `content.data`,
                        MAX(p.post_limit) AS `post_limit`,
                        MAX(p.profile_id) AS `profile.id`
                    FROM posts p
                    JOIN friends f ON p.profile_id = f.accepter_id OR p.profile_id = f.requester_id
                    JOIN contents c ON c.id = p.content_id
                    WHERE p.profile_id = %s
                    GROUP BY p.id
                    ORDER BY p.id DESC) as temp
                    JOIN `profiles` pro
                    ON temp.`profile.id` = pro.id
                    Left JOIN `media` m
                    ON m.post_id = temp.id
                    Where
                    temp.`content.data` LIKE "%%"
                    OR pro.`name` LIKE "%%"
                    OR temp.`location` LIKE "%%"
                    """;
    private final String GET_LAST_INDEX = "SELECT LAST_INSERT_ID() as id;";
    //    private final String SELECT_ALL_POSTS = "SELECT p.*,c.name `category.name`, c.id as `category.id`  FROM `Teachers` t LEFT JOIN " +
//            "`categories` c on t.category_id = c.id  WHERE t.`name` like '%s' OR t.`hobby` LIKE '%s' OR t.`gender` LIKE '%s' Order BY %s %s LIMIT %s OFFSET %s";
    private final String SELECT_ALL_POSTS = "SELECT p.*,u.email `user.email`, pr.name `profile.name`,pr.id as `profile.id`,ct.id `content.id`,ct.data `content.data` FROM `posts` p LEFT JOIN `profiles` pr ON p.profile_id = pr.id left JOIN `contents` ct ON p.content_id = ct.id left join `users` u on pr.user_id = u.id " +
            "WHERE p.`location` like '%s' OR p.`post_limit` LIKE '%s' OR pr.name LIKE '%s' Order BY %s %s LIMIT %s OFFSET %s";
    //    private final String SELECT_TOTAL_RECORDS = "SELECT COUNT(1) as cnt  FROM `teachers` t LEFT JOIN " +
//            "`categories` c on t.category_id = c.id  WHERE t.`name` like '%s' OR t.`hobby` LIKE '%s'";
    private final String SELECT_ALL_MATCHES_POSTS =
            """
                    select temp.*, pro.name as `profile.name`, pro.avatar  as `profile.avatar`, m.type as `media.type`, m.data as `media.data`, m.id as `media.id` from
                    (SELECT
                        p.id,
                        MAX(p.time) AS time,
                        MAX(p.location) AS location,
                         MAX(c.id) AS `content.id`,
                        MAX(c.data) AS `content.data`,
                        MAX(p.post_limit) AS `post_limit`,
                        MAX(p.profile_id) AS `profile.id`
                    FROM posts p
                    JOIN friends f ON p.profile_id = f.accepter_id OR p.profile_id = f.requester_id
                    JOIN contents c ON c.id = p.content_id
                    WHERE p.profile_id = %s
                        OR (f.accepter_id = %s AND f.status = 'ACCEPTED')
                        OR (f.requester_id = %s AND f.status = 'ACCEPTED')
                    GROUP BY p.id
                    ORDER BY p.id DESC) as temp
                    JOIN `profiles` pro\s
                    ON temp.`profile.id` = pro.id
                    Left JOIN `media` m\s
                    ON m.post_id = temp.id
                    Where\s
                    temp.`content.data` LIKE "%s"
                    OR pro.`name` LIKE "%s"
                    OR temp.`location` LIKE "%s"
                    """;
    private final String SELECT_TOTAL_RECORDS = "SELECT COUNT(1) as cnt  FROM `posts` p  WHERE p.`location` like '%s' OR p.`post_limit` LIKE '%s'";
    private final String UPDATE_POSTS = "UPDATE `posts` SET  `location` = ?, `post_limit` = ?, `content_id` = ? WHERE (`id` = ?);";

    private final String INSERT_POSTS = "INSERT INTO `posts` (`profile_id`, `location`, `post_limit`,`content_id`) VALUES(?, ?, ?, ?)";
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
                     .prepareStatement(String.format(SELECT_ALL_POSTS, search, search, search,
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
            preparedStatement.setString(3, post.getPostLimit().toString());
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
//            preparedStatement.setString(1, post.getProfile().getName());
            preparedStatement.setString(1, post.getLocation());
            preparedStatement.setString(2, post.getPostLimit().toString());
            preparedStatement.setInt(3, post.getContent().getId());
            preparedStatement.setLong(4, post.getId());
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
        String contentData = rs.getString("content.data");
        String postLimit = rs.getString("post_limit");
        Integer content_id = rs.getInt("content_id");
        Profile profile = new Profile(profileName);
        Content content1 = new Content(content_id, contentData);
        return new Post(id, profile, location, content1, ELimit.valueOf(postLimit));
    }

    private Profile getProfileOfPoster(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("id");
        return ProfileService.getProfileService().findById(id);
    }

    public List<Post> findMatchesAll(PageableRequest request) {
        List<Post> posts = new ArrayList<>();
        String search = request.getSearch();
        Integer profileId = request.getProfile().getId();
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
        var offset = 0;
        int limit = 100;
        try (Connection connection = getConnection();
             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(String.format(SELECT_ALL_MATCHES_POSTS, profileId, profileId, profileId, search, search, search
                     ))) {

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            //
            while (rs.next()) {
                posts.add(getUserPostByResultSet(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return posts;
    }
    public List<Post> findSelfPost(PageableRequest request) {
        List<Post> posts = new ArrayList<>();
        String search = request.getSearch();
        Integer profileId = request.getProfile().getId();
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
        var offset = 0;
        int limit = 100;
        try (Connection connection = getConnection();
             // Step 2: truyền câu lênh mình muốn chạy nằm ở trong này (SELECT_USERS)
             PreparedStatement preparedStatement = connection
                     .prepareStatement(String.format(SELECT_ALL_SELF_POSTS, profileId))) {

            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            //
            while (rs.next()) {
                posts.add(getUserPostByResultSet(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return posts;
    }
    private Post getUserPostByResultSet(ResultSet rs) throws SQLException {
        Integer id = rs.getInt("id");
        Integer profileId = rs.getInt("profile.id");

        Timestamp timestamp = rs.getTimestamp("time");
        String location = rs.getString("location");
        String contentData = rs.getString("content.data");
        String postLimit = rs.getString("post_limit");
        Integer content_id = rs.getInt("content.id");

        Integer media_id = rs.getInt("media.id");
        EMedia media_type = EMedia.valueOf(rs.getString("media.type"));
        String media_data = rs.getString("media.data");

        Media media = new Media(media_id, media_data, media_type);

        Profile profile = ProfileService.getProfileService().findById(profileId);
        Content content1 = new Content(content_id, contentData);
        Post post = new Post(id, profile, location, content1, ELimit.valueOf(postLimit));
        post.setTime(timestamp);
        post.setMedia(media);
        return post;
    }

    public Integer insertAndGetId(Post post) {
        int post_id = -1;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(INSERT_POSTS)) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, post.getProfile().getId());
            preparedStatement.setString(2, post.getLocation());
            preparedStatement.setString(3, post.getPostLimit().toString());
            preparedStatement.setInt(4, post.getContent().getId());
            preparedStatement.executeUpdate();
            try (
                    PreparedStatement preparedStatement2 = connection
                            .prepareStatement(GET_LAST_INDEX)) {
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement2.executeQuery();
                while (rs.next()) {
                    post_id = rs.getInt("id");
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return post_id;
    }
}
