

package Model;

import Model.Enum.ELimit;

import java.sql.Timestamp;
import java.util.List;



public class Post {
    private Integer id;
    private Profile profile;
    Timestamp time;
    String location;
    Share share;
    String formattedTime;
    private ELimit postLimit;
    LikeNumber likeNumber;
    List<Profile> tags;
    List<String> hashTag;
    Content content;
    Media media;
    Integer commentNumber;
    Integer shareNumber;



    public Post() {
    }



    public Post(Integer id, Profile user, Timestamp timestamp, String location, Share share, ELimit postLimit, LikeNumber likeNumber, List<Profile> tags, List<String> hashTag, Content content, Media media, Integer commentNumber, Integer shareNumber) {
        this.id = id;
        this.profile = user;
        this.time = timestamp;
        this.location = location;
        this.share = share;
        this.postLimit = postLimit;
        this.likeNumber = likeNumber;
        this.tags = tags;
        this.hashTag = hashTag;
        this.content = content;
        this.media = media;
        this.commentNumber = commentNumber;
        this.shareNumber = shareNumber;
    }

    public Post(Integer id, Profile profile, String location,Content content1, ELimit postLimit) {
        this.id = id;
        this.profile = profile;
        this.location = location;
        this.content =content1;
        this.postLimit = postLimit;
    }

    public Post(String location, ELimit postLimit) {
        this.location = location;
        this.postLimit = postLimit;
    }

    public Post(String location, ELimit postLimit, Content content) {
        this.location = location;
        this.postLimit = postLimit;
        this.content = content;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }


    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
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

    public ELimit getPostLimit() {
        return postLimit;
    }

    public void setPostLimit(ELimit postLimit) {
        this.postLimit = postLimit;
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

    public Media getMedia() {
        return media;
    }

    public void setMedia(Media media) {
        this.media = media;
    }

    public Integer getCommentNumber() {
        return commentNumber;
    }

    public void setCommentNumber(Integer commentNumber) {
        this.commentNumber = commentNumber;
    }

    public Integer getShareNumber() {
        return shareNumber;
    }

    public void setShareNumber(Integer shareNumber) {
        this.shareNumber = shareNumber;
    }

    public String getFormattedTime() {
        return formattedTime;
    }

    public void setFormattedTime(String formattedTime) {
        this.formattedTime = formattedTime;
    }
}

