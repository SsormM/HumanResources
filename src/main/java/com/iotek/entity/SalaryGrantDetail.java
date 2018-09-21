package com.iotek.entity;

public class SalaryGrantDetail {
    private Integer grdId;
    private String salaryGrantId;
    private String humanId;
    private String humanName;
    private Float bounsSum;
    private Float saleSum;
    private Float deductSum;
    private Float salaryStandardSum;
    private Float salaryPaidSum;

    @Override
    public String toString() {
        return "SalaryGrantDetail{" +
                "grdId=" + grdId +
                ", salaryGrantId='" + salaryGrantId + '\'' +
                ", humanId='" + humanId + '\'' +
                ", humanName='" + humanName + '\'' +
                ", bounsSum=" + bounsSum +
                ", saleSum=" + saleSum +
                ", deductSum=" + deductSum +
                ", salaryStandardSum=" + salaryStandardSum +
                ", salaryPaidSum=" + salaryPaidSum +
                '}';
    }

    public Integer getGrdId() {
        return grdId;
    }

    public void setGrdId(Integer grdId) {
        this.grdId = grdId;
    }

    public String getSalaryGrantId() {
        return salaryGrantId;
    }

    public void setSalaryGrantId(String salaryGrantId) {
        this.salaryGrantId = salaryGrantId;
    }

    public String getHumanId() {
        return humanId;
    }

    public void setHumanId(String humanId) {
        this.humanId = humanId;
    }

    public String getHumanName() {
        return humanName;
    }

    public void setHumanName(String humanName) {
        this.humanName = humanName;
    }

    public Float getBounsSum() {
        return bounsSum;
    }

    public void setBounsSum(Float bounsSum) {
        this.bounsSum = bounsSum;
    }

    public Float getSaleSum() {
        return saleSum;
    }

    public void setSaleSum(Float saleSum) {
        this.saleSum = saleSum;
    }

    public Float getDeductSum() {
        return deductSum;
    }

    public void setDeductSum(Float deductSum) {
        this.deductSum = deductSum;
    }

    public Float getSalaryStandardSum() {
        return salaryStandardSum;
    }

    public void setSalaryStandardSum(Float salaryStandardSum) {
        this.salaryStandardSum = salaryStandardSum;
    }

    public Float getSalaryPaidSum() {
        return salaryPaidSum;
    }

    public void setSalaryPaidSum(Float salaryPaidSum) {
        this.salaryPaidSum = salaryPaidSum;
    }
}