package com.iotek.entity;

public class ConfigFileSecondKind {
    private Integer fskId;
    private Integer firstKindId;
    private String firstKindName;
    private Integer secondKindId;
    private String secondKindName;
    private Integer secondSalaryId;
    private Integer secondSaleId;

    @Override
    public String toString() {
        return "ConfigFileSecondKind{" +
                "fskId=" + fskId +
                ", firstKindId=" + firstKindId +
                ", firstKindName='" + firstKindName + '\'' +
                ", secondKindId=" + secondKindId +
                ", secondKindName='" + secondKindName + '\'' +
                ", secondSalaryId=" + secondSalaryId +
                ", secondSaleId='" + secondSaleId + '\'' +
                '}';
    }

    public Integer getFskId() {
        return fskId;
    }

    public void setFskId(Integer fskId) {
        this.fskId = fskId;
    }

    public Integer getFirstKindId() {
        return firstKindId;
    }

    public void setFirstKindId(Integer firstKindId) {
        this.firstKindId = firstKindId;
    }

    public String getFirstKindName() {
        return firstKindName;
    }

    public void setFirstKindName(String firstKindName) {
        this.firstKindName = firstKindName;
    }

    public Integer getSecondKindId() {
        return secondKindId;
    }

    public void setSecondKindId(Integer secondKindId) {
        this.secondKindId = secondKindId;
    }

    public String getSecondKindName() {
        return secondKindName;
    }

    public void setSecondKindName(String secondKindName) {
        this.secondKindName = secondKindName;
    }

    public Integer getSecondSalaryId() {
        return secondSalaryId;
    }

    public void setSecondSalaryId(Integer secondSalaryId) {
        this.secondSalaryId = secondSalaryId;
    }

    public Integer getSecondSaleId() {
        return secondSaleId;
    }

    public void setSecondSaleId(Integer secondSaleId) {
        this.secondSaleId = secondSaleId;
    }
}