package Model;

import java.sql.Date;

import services.dto.Enum.EGender;

//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
//@Builder
public class Profile {
//    public static Long currentID = 0;
    private Long id;
    private String name;
    private String phone;
    private String avatar;
    private Date dob;
    private EGender gender;
    private String cover;
    private User user;

    public Profile(Long id) {
        this.id = id;
    }

    public Profile() {
    }

    public Profile(Long id, String name, String phone, String avatar, Date dob, EGender gender, String cover, User user) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.avatar = avatar;
        this.dob = dob;
        this.gender = gender;
        this.cover = cover;
        this.user = user;
    }

//    public static Long getCurrentID() {
//        return currentID;
//    }
//
//    public static void setCurrentID(Long currentID) {
//        Profile.currentID = currentID;
//    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDob() {
        if(dob == null) return "";
        return dob.toString();
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

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
