package com.iotek.entity;

public class SalaryStandardDetail {
    private Integer sdtId;
    private String standardId;
    private String standardName;
    private Integer itemId;
    private String itemName;
    private Float salary;

    @Override
    public String toString() {
        return "SalaryStandardDetail{" +
                "sdtId=" + sdtId +
                ", standardId=" + standardId +
                ", standardName='" + standardName + '\'' +
                ", itemId=" + itemId +
                ", itemName='" + itemName + '\'' +
                ", salary=" + salary +
                '}';
    }

    public Integer getSdtId() {
        return sdtId;
    }

    public void setSdtId(Integer sdtId) {
        this.sdtId = sdtId;
    }

    public String getStandardId() {
        return standardId;
    }

    public void setStandardId(String standardId) {
        this.standardId = standardId;
    }

    public String getStandardName() {
        return standardName;
    }

    public void setStandardName(String standardName) {
        this.standardName = standardName;
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Float getSalary() {
        return salary;
    }

    public void setSalary(Float salary) {
        this.salary = salary;
    }
}