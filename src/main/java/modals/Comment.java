package modals;

import java.sql.Timestamp;
import java.util.List;

public class Comment {
    public static Integer currentId = 0;
    private Integer id;
    Post post;
    User user;
    Timestamp time;
    Comment comment;
    List<Like> likes;

    public Comment() {
    }

    public Comment(Integer id, Post post, User user, Timestamp time, Comment comment) {
        this.id = id;
        this.post = post;
        this.user = user;
        this.time = time;
        this.comment = comment;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public List<Like> getLikes() {
        return likes;
    }

    public void setLikes(List<Like> likes) {
        this.likes = likes;
    }
}
