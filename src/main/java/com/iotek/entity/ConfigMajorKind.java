package com.iotek.entity;

public class ConfigMajorKind {
    private Integer mfkId;
    private Integer majorKindId;
    private String majorKindName;

    @Override
    public String toString() {
        return "ConfigMajorKind{" +
                "mfkId=" + mfkId +
                ", majorKindId=" + majorKindId +
                ", majorKindName='" + majorKindName + '\'' +
                '}';
    }

    public Integer getMfkId() {
        return mfkId;
    }

    public void setMfkId(Integer mfkId) {
        this.mfkId = mfkId;
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
}