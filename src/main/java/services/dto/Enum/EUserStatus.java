package services.dto.Enum;

public enum EUserStatus {
    ACTIVE("active"),
    OFFLINE("offline"),
    BUSY("busy"),
    LOCK("lock"),
    OTHER("other");;

    private final String status;

    EUserStatus(String gender) {
        this.status = gender;
    }

    String getStatus() {
        return this.status;
    }

    public static EUserStatus setStatus(String status) {
        for (EUserStatus eUserStatus : EUserStatus.values()) {
            if (eUserStatus.status.equalsIgnoreCase(status)) {
                return eUserStatus;
            }
        }
        return OTHER;
    }
}
