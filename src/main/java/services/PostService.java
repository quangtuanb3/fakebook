package services;

import modals.Post;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class PostService {
    private static List<Post> postList = new ArrayList<>();

    private static PostService postService;

    static {
        postList.add(new Post());
        postList.add(new Post());
        postList.add(new Post());
        postList.add(new Post());
    }

    public List<Post> findAll() {
        return postList;
    }

    public void delete(Long id) {
        postList = postList
                .stream()
                .filter(post -> !Objects.equals(post.getId(), id))
                .toList();
    }

    public boolean existById(Long postId) {
        var postOptional = postList
                .stream()
                .filter(customer -> Objects.equals(customer.getId(), postId))
                .findFirst().orElse(null);
        return postOptional != null;
    }

    public static PostService getInstance() {
        if (postService == null) {
            postService = new PostService();
        }
        return postService;
    }

    private PostService() {
    }
}
