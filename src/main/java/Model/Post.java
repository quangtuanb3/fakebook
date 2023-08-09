package Model;

import java.sql.Timestamp;
import java.util.List;

import services.dto.Enum.ELimit;

public class Post {
    public static Integer currentId = 0;
    private Integer id;
    private Profile user;
    Timestamp timestamp;
    String location;
    Share share;
    private ELimit eLimit;
    LikeNumber likeNumber;
    List<Profile> tags;
    List<String> hashTag;
    Content content;
    List<Media> media;
    Long commentNumber;
    Long shareNumber;


    public Post() {
    }

    public Post(Integer id, Profile user, Content content, Timestamp timestamp, String location, Share share, ELimit eLimit, List<String> hashTag) {
        this.id = id;
        this.user = user;
        this.content = content;
        this.timestamp = timestamp;
        this.location = location;
        this.share = share;
        this.eLimit = eLimit;
        this.hashTag = hashTag;
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

    public LikeNumber getLikeNumber() {
        return likeNumber;
    }

    public void setLikeNumber(LikeNumber likeNumber) {
        this.likeNumber = likeNumber;
    }

    public List<Profile> getTags() {
        return tags;
    }

    public void setTags(List<Profile> tags) {
        this.tags = tags;
    }

    public List<String> getHashTag() {
        return hashTag;
    }

    public void setHashTag(List<String> hashTag) {
        this.hashTag = hashTag;
    }

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
    }

    public List<Media> getMedia() {
        return media;
    }

    public void setMedia(List<Media> media) {
        this.media = media;
    }

    public Long getCommentNumber() {
        return commentNumber;
    }

    public void setCommentNumber(Long commentNumber) {
        this.commentNumber = commentNumber;
    }

    public Long getShareNumber() {
        return shareNumber;
    }

    public void setShareNumber(Long shareNumber) {
        this.shareNumber = shareNumber;
    }
}

