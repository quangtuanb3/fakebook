package modals;

import lombok.*;

import java.sql.Timestamp;

import Enum.ELimit;

//@Builder
//@Getter
//@Setter
//@NoArgsConstructor
//@AllArgsConstructor
public class Post {
    private Integer id;
    private User user;
    private String data;
    Timestamp timestamp;
    String location;
    Share share;
    private ELimit eLimit;

    public Post() {
    }

    public Post(Integer id, User user, String data, Timestamp timestamp, String location, Share share, ELimit eLimit) {
        this.id = id;
        this.user = user;
        this.data = data;
        this.timestamp = timestamp;
        this.location = location;
        this.share = share;
        this.eLimit = eLimit;
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

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Share getShare() {
        return share;
    }

    public void setShare(Share share) {
        this.share = share;
    }

    public ELimit geteLimit() {
        return eLimit;
    }

    public void seteLimit(ELimit eLimit) {
        this.eLimit = eLimit;
    }
}
