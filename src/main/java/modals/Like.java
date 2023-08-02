package modals;
import Enum.ELike;

public class Like {
    public static Integer currentId = 0;
    private Integer id;
    User user;
    Post post;
    Comment comment;
    ELike like;

    public Like(Integer id, User user, Post post, Comment comment, ELike like) {
        this.id = id;
        this.user = user;
        this.post = post;
        this.comment = comment;
        this.like = like;
    }

    public Like() {
    }

    public static Integer getCurrentId() {
        return currentId;
    }

    public static void setCurrentId(Integer currentId) {
        Like.currentId = currentId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public ELike getLike() {
        return like;
    }

    public void setLike(ELike like) {
        this.like = like;
    }
}
