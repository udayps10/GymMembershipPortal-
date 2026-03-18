package model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class User {

    private int id;
    private String name;
    private int age;
    private String gender;
    private float weight;
    private float height;
    private String email;
    private String password;
    private String trainer;
    private String plan;

    private LocalDate membershipStartDate;
    private LocalDate expiry;

    // ---------- GETTERS AND SETTERS ----------

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTrainer() {
        return trainer;
    }

    public void setTrainer(String trainer) {
        this.trainer = trainer;
    }

    public String getPlan() {
        return plan;
    }

    public void setPlan(String plan) {
        this.plan = plan;
    }

    public LocalDate getMembershipStartDate() {
        return membershipStartDate;
    }

    public void setMembershipStartDate(LocalDate membershipStartDate) {
        this.membershipStartDate = membershipStartDate;
    }

    public LocalDate getExpiry() {
        return expiry;
    }

    public void setExpiry(LocalDate expiry) {
        this.expiry = expiry;
    }


    public long getDaysLeft() {

        if (expiry == null) {
            return 0;
        }

        LocalDate today = LocalDate.now();

        long days = ChronoUnit.DAYS.between(today, expiry);

        if (days < 0) {
            return 0;
        }

        return days;
    }
}