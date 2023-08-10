//package services;
//
//import Utils.AppConstant;
//import Model.Content;
//import Model.LikeNumber;
//import Model.Post;
//import Model.Share;
//
//import java.sql.Timestamp;
//import java.time.LocalDateTime;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//import java.util.Objects;
//import java.util.stream.Collectors;
//
//import Model.Enum.ELimit;
//
//public class PostService {
//    private static List<Post> postList = new ArrayList<>();
//
//    private static PostService postService;
//
//    static {
//        postService = new PostService();
//        Post post1 = new Post(++Post.currentId, ProfileService.currentUser, new Content("No caption"),
//                Timestamp.valueOf(LocalDateTime.now()), "Hue", new Share(),
//                ELimit.PUBLIC, new ArrayList<>(Arrays.asList("hashTag1", "hashTag2")));
//        post1.setContent(new Content("Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta\n" +
//                "laborum nihil accusantium odit laboriosam, sed sit autem!"));
//        post1.setLikeNumber(new LikeNumber(120L, 130L, 105L, 230L, 261L));
//        post1.setCommentNumber(10L);
//        post1.setShareNumber(15L);
//
//        Post post2 = new Post(++Post.currentId, ProfileService.currentUser, new Content("No caption"),
//                Timestamp.valueOf(LocalDateTime.now()), "Hue", new Share(),
//                ELimit.PUBLIC, new ArrayList<>(Arrays.asList("hashTag1", "hashTag2")));
//        post2.setContent(new Content("Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta\n" +
//                "laborum nihil accusantium odit laboriosam, sed sit autem!"));
//        post2.setLikeNumber(new LikeNumber(120L, 130L, 105L, 230L, 261L));
//        post2.setCommentNumber(10L);
//        post2.setShareNumber(15L);
//
//        Post post3 = new Post(++Post.currentId, ProfileService.currentUser, new Content("No caption"),
//                Timestamp.valueOf(LocalDateTime.now()), "Hue", new Share(),
//                ELimit.PUBLIC, new ArrayList<>(Arrays.asList("hashTag1", "hashTag2")));
//        post3.setContent(new Content("Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta\n" +
//                "laborum nihil accusantium odit laboriosam, sed sit autem!"));
//        post3.setLikeNumber(new LikeNumber(120L, 130L, 105L, 230L, 261L));
//        post3.setCommentNumber(10L);
//        post3.setShareNumber(15L);
//
//        Post post4 = new Post(++Post.currentId, ProfileService.currentUser, new Content("No caption"),
//                Timestamp.valueOf(LocalDateTime.now()), "Hue", new Share(),
//                ELimit.PUBLIC, new ArrayList<>(Arrays.asList("hashTag1", "hashTag2")));
//        post4.setContent(new Content("Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis dolores praesentium dicta\n" +
//                "laborum nihil accusantium odit laboriosam, sed sit autem!"));
//        post4.setLikeNumber(new LikeNumber(120L, 130L, 105L, 230L, 261L));
//        post4.setCommentNumber(10L);
//        post4.setShareNumber(15L);
//
//        postList.add(post1);
//        postList.add(post2);
//        postList.add(post3);
//        postList.add(post4);
//    }
//
//    public List<Post> findAll() {
//        return postList.stream().filter(e -> Objects.equals(e.getUser(), ProfileService.currentUser)).collect(Collectors.toList());
//    }
//
//    public void delete(Integer id) {
//        postList = postList
//                .stream()
//                .filter(post -> !Objects.equals(post.getId(), id))
//                .toList();
//    }
//
//    private PostService() {
//    }
//
//    public static PostService getPostService() {
//        return postService;
//    }
//
//    public Post findById(Integer id) {
//        return postList.stream()
//                .filter(post -> Objects.equals(post.getId(), id)) // lọc qua list users với điều kiện là user id == id truyền vào
//                .findFirst() // lấy phần tử tìm thấy đầu tiên
//                .orElseThrow(() -> new RuntimeException(String.format(AppConstant.ID_NOT_FOUND, "Post")));
//        //nếu không tìm thấy thì trả ra lỗi
//    }
//
//    public void create(Post post) {
//        post.setId(++Post.currentId);
//        postList.add(post);
//    }
//
//
//    public void edit(Post post) {
//        for (var item : postList) {
//            if (item.getId().equals(post.getId())) {
//                item.setContent(post.getContent());
//                item.setTimestamp(post.getTimestamp());
//                item.setLocation(post.getLocation());
//                item.setShare(post.getShare());
//                item.seteLimit(post.geteLimit());
//                item.setHashTag(post.getHashTag());
//            }
//        }
//    }
//
//    public boolean existById(Integer id) {
//        for (var post : postList) {
//            if (Objects.equals(id, post.getId())) {
//                return true;
//            }
//        }
//        return false;
//    }
//
//}
