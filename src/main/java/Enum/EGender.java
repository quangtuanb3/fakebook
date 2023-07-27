package Enum;

public enum EGender {
    MALE("male"),
    FEMALE("female"),
    OTHER("other");
    private final String gender;

    EGender(String gender) {
        this.gender = gender;
    }

    String getGender() {
        return this.gender;
    }
}
