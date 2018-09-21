package com.iotek.entity;

public class ConfigPublicChar {
    private Integer pbcId;
    private String attributeKind;
    private String attributeName;

    @Override
    public String toString() {
        return "ConfigPublicChar{" +
                "pbcId=" + pbcId +
                ", attributeKind='" + attributeKind + '\'' +
                ", attributeName='" + attributeName + '\'' +
                '}';
    }

    public Integer getPbcId() {
        return pbcId;
    }

    public void setPbcId(Integer pbcId) {
        this.pbcId = pbcId;
    }

    public String getAttributeKind() {
        return attributeKind;
    }

    public void setAttributeKind(String attributeKind) {
        this.attributeKind = attributeKind;
    }

    public String getAttributeName() {
        return attributeName;
    }

    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }
}