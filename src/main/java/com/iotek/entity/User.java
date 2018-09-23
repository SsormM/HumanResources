package com.iotek.entity;

public class User {
    private Integer uId;
    private String uName;
    private String uTrueName;
    private String uPassword;
    private Role role;

    @Override
    public String toString() {
        return "User{" +
                "uId=" + uId +
                ", uName='" + uName + '\'' +
                ", uTrueName='" + uTrueName + '\'' +
                ", uPassword='" + uPassword + '\'' +
                ", role=" + role +
                '}';
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuTrueName() {
        return uTrueName;
    }

    public void setuTrueName(String uTrueName) {
        this.uTrueName = uTrueName;
    }

    public String getuPassword() {
        return uPassword;
    }

    public void setuPassword(String uPassword) {
        this.uPassword = uPassword;
    }
}