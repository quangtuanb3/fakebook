package Model;

import Model.Enum.ERole;
import Model.Enum.EStatus;

public class User {

    private Integer id;
    private String email;
    private String password;
    private EStatus status;
    private ERole role;

    public User(Integer id) {
        this.id = id;
    }

    public User() {
    }

    public User(String email) {
        this.email = email;
    }

//    public User(Integer id, String email, String password) {
//        this.id = id;
//        this.email = email;
//        this.password = password;
//    }

    public User(Integer id, String email, String password, EStatus status, ERole role) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.status = status;
        this.role =role;
    }

    public ERole getRole() {
        return role;
    }

    public void setRole(ERole role) {
        this.role = role;
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

    public EStatus getStatus() {
        return status;
    }

    public void setStatus(EStatus status) {
        this.status = status;
    }
}
