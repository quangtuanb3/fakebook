package Model;
import Model.Enum.ELimit;

//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
public class Share {
    private Integer id;
    private Profile user;
    private Post post;
    private ELimit limit;

    public Share(Integer id, Profile user, Post post, ELimit limit) {
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

    public Profile getUser() {
        return user;
    }

    public void setUser(Profile user) {
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

