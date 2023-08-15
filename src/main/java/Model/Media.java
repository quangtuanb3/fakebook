package Model;

import Model.Enum.EMedia;

public class Media {
    private Integer id;
    String data;
    String title;
    EMedia type;
    Post post;
    Comment comment;

    public Media(Integer id, String data, EMedia type, Post post, Comment comment, String title) {
        this.id = id;
        this.data = data;
        this.title = title;
        this.type = type;
        this.post = post;
        this.comment = comment;

    }

    public Media() {
    }

    public Media(Integer mediaId, String mediaData, EMedia mediaType) {
        this.id = mediaId;
        this.data = mediaData;
        this.type = mediaType;
    }

    public Media(String type, String imgSrc) {
        this.type = EMedia.valueOf(type);
        this.data = imgSrc;
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

    public EMedia getType() {
        return type;
    }

    public void setType(EMedia type) {
        this.type = type;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
