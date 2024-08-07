public class Quote1 {
    private int id;
    private int userId;
    private String fullName;
    private String email;
    private String phoneNumber;
    private String services;
    private String works;
    private String room;
    private String purpose;
    private int squareFeet;
    private String message;

    public Quote1(int id, int userId, String fullName, String email, String phoneNumber, String services, String works, String room, String purpose, int squareFeet, String message) {
        this.id = id;
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.services = services;
        this.works = works;
        this.room = room;
        this.purpose = purpose;
        this.squareFeet = squareFeet;
        this.message = message;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public String getFullName() {
        return fullName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getServices() {
        return services;
    }

    public String getWorks() {
        return works;
    }

    public String getRoom() {
        return room;
    }

    public String getPurpose() {
        return purpose;
    }

    public int getSquareFeet() {
        return squareFeet;
    }

    public String getMessage() {
        return message;
    }
}