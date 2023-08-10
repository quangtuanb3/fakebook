package Model.Enum;

public enum ERole {
    USER("user"),
    ADMIN("admin");

    private final String role;

    ERole(String roll) {
        this.role = roll;
    }

    String getGender() {
        return this.role;
    }
    public static ERole setGender(String gender) {
        for (ERole eRoll : ERole.values()) {
            if (eRoll.role.equalsIgnoreCase(gender)) {
                return eRoll;
            }
        }
        return null;
    }
}
