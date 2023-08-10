package Model.Enum;

public enum ELimit {
    PRIVATE("private"),
    FRIEND("friend"),
    PUBLIC("public");
    private final String limit;

    ELimit(String limit) {
        this.limit = limit;
    }

    String getGender() {
        return this.limit;
    }
}
