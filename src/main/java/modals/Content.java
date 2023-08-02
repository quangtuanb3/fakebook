package modals;

public class Content {
    public static Integer currentId = 0;
    private Integer id;
    String data;
    Post post;
    Comment comment;

    public Content() {
    }

    public Content(Integer id, String data, Post post, Comment comment) {
        this.id = id;
        this.data = data;
        this.post = post;
        this.comment = comment;
    }
    public Content(String data) {
        this.id = ++currentId;
        this.data = data;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
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
}
