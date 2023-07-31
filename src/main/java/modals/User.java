package modals;

import java.sql.Date;

import Enum.EGender;
import Enum.EUserStatus;
import Enum.ERole;

//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
public class User {
    public static Integer currentID = 0;
    private Integer id;
    private String name;
    private String phone;
    private String email;
    private String password;
    private ERole roll;
    private Date dob;
    private EGender gender;
    private String avatar;
    private String cover;
    private EUserStatus status;

    public User(Integer id, String name, String phone, String email, String password, ERole roll, Date dob, EGender gender, String avatar, String cover, EUserStatus status) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.roll = roll;
        this.dob = dob;
        this.gender = gender;
        this.avatar = avatar;
        this.cover = cover;
        this.status = status;
    }

    public User() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public EGender getGender() {
        return gender;
    }

    public void setGender(EGender gender) {
        this.gender = gender;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public EUserStatus getStatus() {
        return status;
    }

    public void setStatus(EUserStatus status) {
        this.status = status;
    }
}
