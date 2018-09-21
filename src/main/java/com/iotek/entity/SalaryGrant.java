package com.iotek.entity;

import java.util.Date;

public class SalaryGrant {
    private Integer sgrId;
    private String salaryGrantId;
    private String salaryStandardId;
    private Integer firstKindId;
    private String firstKindName;
    private Integer secondKindId;
    private String secondKindName;
    private Integer thirdKindId;
    private String thirdKindName;
    private Integer humanAmount;
    private Float salaryStandardSum;
    private Float salaryPaidSum;
    private String register;
    private Date registTime;
    private String checker;
    private Date checkTime;
    private Integer checkStatus;

    @Override
    public String toString() {
        return "SalaryGrant{" +
                "sgrId=" + sgrId +
                ", salaryGrantId='" + salaryGrantId + '\'' +
                ", salaryStandardId='" + salaryStandardId + '\'' +
                ", firstKindId=" + firstKindId +
                ", firstKindName='" + firstKindName + '\'' +
                ", secondKindId=" + secondKindId +
                ", secondKindName='" + secondKindName + '\'' +
                ", thirdKindId=" + thirdKindId +
                ", thirdKindName='" + thirdKindName + '\'' +
                ", humanAmount=" + humanAmount +
                ", salaryStandardSum=" + salaryStandardSum +
                ", salaryPaidSum=" + salaryPaidSum +
                ", register='" + register + '\'' +
                ", registTime=" + registTime +
                ", checker='" + checker + '\'' +
                ", checkTime=" + checkTime +
                ", checkStatus=" + checkStatus +
                '}';
    }

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    public String getSalaryStandardId() {
        return salaryStandardId;
    }

    public void setSalaryStandardId(String salaryStandardId) {
        this.salaryStandardId = salaryStandardId;
    }

    public Integer getSgrId() {
        return sgrId;
    }

    public void setSgrId(Integer sgrId) {
        this.sgrId = sgrId;
    }

    public String getSalaryGrantId() {
        return salaryGrantId;
    }

    public void setSalaryGrantId(String salaryGrantId) {
        this.salaryGrantId = salaryGrantId;
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

    public Integer getHumanAmount() {
        return humanAmount;
    }

    public void setHumanAmount(Integer humanAmount) {
        this.humanAmount = humanAmount;
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

    public String getRegister() {
        return register;
    }

    public void setRegister(String register) {
        this.register = register;
    }

    public String getChecker() {
        return checker;
    }

    public void setChecker(String checker) {
        this.checker = checker;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }

    public Integer getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(Integer checkStatus) {
        this.checkStatus = checkStatus;
    }
}