package Model;


import Model.Enum.ERole;

public class Login {
    private Long id;

    private String email;

    private String password;

    private ERole role;

    public Login(Long id, String email, String password) {
        this.id = id;
        this.email = email;
        this.password = password;
    }

    public Login() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public ERole getRole() {
        return role;
    }

    public void setRole(ERole role) {
        this.role = role;
    }
}