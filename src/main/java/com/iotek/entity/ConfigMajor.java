package com.iotek.entity;

public class ConfigMajor {
    private Integer makId;
    private Integer majorKindId;
    private String majorKindName;
    private Integer majorId;
    private String majorName;
    private Integer testAmount;

    @Override
    public String toString() {
        return "ConfigMajor{" +
                "makId=" + makId +
                ", majorKindId=" + majorKindId +
                ", majorKindName='" + majorKindName + '\'' +
                ", majorId=" + majorId +
                ", majorName='" + majorName + '\'' +
                ", testAmount=" + testAmount +
                '}';
    }

    public Integer getMakId() {
        return makId;
    }

    public void setMakId(Integer makId) {
        this.makId = makId;
    }

    public Integer getMajorKindId() {
        return majorKindId;
    }

    public void setMajorKindId(Integer majorKindId) {
        this.majorKindId = majorKindId;
    }

    public String getMajorKindName() {
        return majorKindName;
    }

    public void setMajorKindName(String majorKindName) {
        this.majorKindName = majorKindName;
    }

    public Integer getMajorId() {
        return majorId;
    }

    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public Integer getTestAmount() {
        return testAmount;
    }

    public void setTestAmount(Integer testAmount) {
        this.testAmount = testAmount;
    }
}