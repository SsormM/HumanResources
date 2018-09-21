package com.iotek.entity;

public class ConfigFileFirstKind {
    private Integer ffkId;
    private Integer firstKindId;
    private String firstKindName;
    private Integer firstKindSalaryId;
    private String firstKindSaleId;

    @Override
    public String toString() {
        return "ConfigFileFirstKind{" +
                "ffkId=" + ffkId +
                ", firstKindId=" + firstKindId +
                ", firstKindName='" + firstKindName + '\'' +
                ", firstKindSalaryId=" + firstKindSalaryId +
                ", firstKindSaleId='" + firstKindSaleId + '\'' +
                '}';
    }

    public Integer getFfkId() {
        return ffkId;
    }

    public void setFfkId(Integer ffkId) {
        this.ffkId = ffkId;
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

    public Integer getFirstKindSalaryId() {
        return firstKindSalaryId;
    }

    public void setFirstKindSalaryId(Integer firstKindSalaryId) {
        this.firstKindSalaryId = firstKindSalaryId;
    }

    public String getFirstKindSaleId() {
        return firstKindSaleId;
    }

    public void setFirstKindSaleId(String firstKindSaleId) {
        this.firstKindSaleId = firstKindSaleId;
    }
}