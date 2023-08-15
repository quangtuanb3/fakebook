

package services;

import DAO.PostDAO;

import Model.Post;
import Model.Profile;
import Utils.AppConstant;
import services.dto.PageableRequest;

import java.util.ArrayList;
import java.util.List;

public class PostService {
    public static List<Post> postList = new ArrayList<>();
    public static Long currentID=0L;

    private static PostService postService;

    private PostDAO postDAO = new PostDAO();

    static {
        postList = new ArrayList<>();

        postService = new PostService();
    }

    public List<Post> getPostList(PageableRequest request){
        return postDAO.findAll(request);
    }
    public List<Post> getMatchesPost(PageableRequest request){
        return postDAO.findMatchesAll(request);
    }
    public Post findById(Integer id){
        return postDAO.findById(id)
                .orElseThrow(() ->  new RuntimeException(String.format(AppConstant.ID_NOT_FOUND, "Post")));

    }
    public void create(Post post){
        postDAO.insertPost(post);
    }

    public static PostService getPostService() {
        return postService;
    }
    private PostService(){}

    public void edit(Post post) {
        postDAO.updatePost(post);
    }


    public void delete(Integer postId) {
        postDAO.deleteById(postId);

    }

    public Integer insertAndGetId(Post post) {
        return postDAO.insertAndGetId(post);
    }

    public List<Post> getSelfPost(PageableRequest request) {
      return  postDAO.findSelfPost(request);
    }
}


