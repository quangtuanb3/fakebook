package modals;

public class LikeNumber {
    Long like;
    Long heart;
    Long haha;
    Long angry;
    Long sad;
    Long total;

    public LikeNumber() {
    }

    public LikeNumber(Long like, Long heart, Long haha, Long angry, Long sad) {
        this.like = like;
        this.heart = heart;
        this.haha = haha;
        this.angry = angry;
        this.sad = sad;
        this.total = like+haha+heart+angry+sad;
    }

    public Long getLike() {
        return like;
    }

    public void setLike(Long like) {
        this.like = like;
    }

    public Long getHeart() {
        return heart;
    }

    public void setHeart(Long heart) {
        this.heart = heart;
    }

    public Long getHaha() {
        return haha;
    }

    public void setHaha(Long haha) {
        this.haha = haha;
    }

    public Long getAngry() {
        return angry;
    }

    public void setAngry(Long angry) {
        this.angry = angry;
    }

    public Long getSad() {
        return sad;
    }

    public void setSad(Long sad) {
        this.sad = sad;
    }

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }
}
