package Model;

public class User {

    private Integer id;
    private String email;
    private String password;

    public User(Integer id) {
        this.id = id;
    }

    public User() {
    }

    public User(String email) {
        this.email = email;
    }

    public User(Integer id, String email, String password) {
        this.id = id;
        this.email = email;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
