package com.iotek.entity;

public class ConfigFileThirdKind {
    private Integer ftkId;
    private Integer firstKindId;
    private String firstKindName;
    private Integer secondKindId;
    private String secondKindName;
    private Integer thirdKindId;
    private String thirdKindName;
    private Integer thirdKindSaleId;
    private String thirdKindIsRetail;

    @Override
    public String toString() {
        return "ConfigFileThirdKind{" +
                "ftkId=" + ftkId +
                ", firstKindId=" + firstKindId +
                ", firstKindName='" + firstKindName + '\'' +
                ", secondKindId=" + secondKindId +
                ", secondKindName='" + secondKindName + '\'' +
                ", thirdKindId=" + thirdKindId +
                ", thirdKindName='" + thirdKindName + '\'' +
                ", thirdKindSaleId=" + thirdKindSaleId +
                ", thirdKindIsRetail='" + thirdKindIsRetail + '\'' +
                '}';
    }

    public Integer getFtkId() {
        return ftkId;
    }

    public void setFtkId(Integer ftkId) {
        this.ftkId = ftkId;
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

    public Integer getThirdKindId() {
        return thirdKindId;
    }

    public void setThirdKindId(Integer thirdKindId) {
        this.thirdKindId = thirdKindId;
    }

    public String getThirdKindName() {
        return thirdKindName;
    }

    public void setThirdKindName(String thirdKindName) {
        this.thirdKindName = thirdKindName;
    }

    public Integer getThirdKindSaleId() {
        return thirdKindSaleId;
    }

    public void setThirdKindSaleId(Integer thirdKindSaleId) {
        this.thirdKindSaleId = thirdKindSaleId;
    }

    public String getThirdKindIsRetail() {
        return thirdKindIsRetail;
    }

    public void setThirdKindIsRetail(String thirdKindIsRetail) {
        this.thirdKindIsRetail = thirdKindIsRetail;
    }
}