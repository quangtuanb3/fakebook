package modals;
import Enum.ELimit;
import lombok.*;

//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
public class Share {
    private Integer id;
    private User user;
    private Post post;
    private ELimit limit;

    public Share(Integer id, User user, Post post, ELimit limit) {
        this.id = id;
        this.user = user;
        this.post = post;
        this.limit = limit;
    }

    public Share() {
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

    public ELimit getLimit() {
        return limit;
    }

    public void setLimit(ELimit limit) {
        this.limit = limit;
    }
}

