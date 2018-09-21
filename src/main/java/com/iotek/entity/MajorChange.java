package com.iotek.entity;

import java.util.Date;

public class MajorChange {
    private Integer mchId;
    private Integer firstKindId;
    private String firstKindName;
    private Integer secondKindId;
    private String secondKindName;
    private Integer thirdKindId;
    private String thirdKindName;
    private Integer majorKindId;
    private String majorKindName;
    private Integer majorId;
    private String majorName;
    private Integer newFirstKindId;
    private String newFirstKindName;
    private Integer newSecondKindId;
    private String newSecondKindName;
    private Integer newThirdKindId;
    private String newThirdKindName;
    private Integer newMajorKindId;
    private String newMajorKindName;
    private Integer newMajorId;
    private String newMajorName;
    private String humanId;
    private String humanName;
    private String salaryStandardId;
    private String salaryStandardName;
    private Float salarySum;
    private String newSalaryStandardId;
    private String newSalaryStandardName;
    private Float newSalarySum;
    private String changeReason;
    private String checkReason;
    private Integer checkStatus;
    private String register;
    private String checker;
    private Date registTime;
    private Date checkTime;

    @Override
    public String toString() {
        return "MajorChange{" +
                "mchId=" + mchId +
                ", firstKindId=" + firstKindId +
                ", firstKindName='" + firstKindName + '\'' +
                ", secondKindId=" + secondKindId +
                ", secondKindName='" + secondKindName + '\'' +
                ", thirdKindId=" + thirdKindId +
                ", thirdKindName='" + thirdKindName + '\'' +
                ", majorKindId=" + majorKindId +
                ", majorKindName='" + majorKindName + '\'' +
                ", majorId=" + majorId +
                ", majorName='" + majorName + '\'' +
                ", newFirstKindId=" + newFirstKindId +
                ", newFirstKindName='" + newFirstKindName + '\'' +
                ", newSecondKindId=" + newSecondKindId +
                ", newSecondKindName='" + newSecondKindName + '\'' +
                ", newThirdKindId=" + newThirdKindId +
                ", newThirdKindName='" + newThirdKindName + '\'' +
                ", newMajorKindId=" + newMajorKindId +
                ", newMajorKindName='" + newMajorKindName + '\'' +
                ", newMajorId=" + newMajorId +
                ", newMajorName='" + newMajorName + '\'' +
                ", humanId='" + humanId + '\'' +
                ", humanName='" + humanName + '\'' +
                ", salaryStandardId='" + salaryStandardId + '\'' +
                ", salaryStandardName='" + salaryStandardName + '\'' +
                ", salarySum=" + salarySum +
                ", newSalaryStandardId='" + newSalaryStandardId + '\'' +
                ", newSalaryStandardName='" + newSalaryStandardName + '\'' +
                ", newSalarySum=" + newSalarySum +
                ", changeReason='" + changeReason + '\'' +
                ", checkReason='" + checkReason + '\'' +
                ", checkStatus=" + checkStatus +
                ", register='" + register + '\'' +
                ", checker='" + checker + '\'' +
                ", registTime=" + registTime +
                ", checkTime=" + checkTime +
                '}';
    }

    public Integer getMchId() {
        return mchId;
    }

    public void setMchId(Integer mchId) {
        this.mchId = mchId;
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

    public Integer getNewFirstKindId() {
        return newFirstKindId;
    }

    public void setNewFirstKindId(Integer newFirstKindId) {
        this.newFirstKindId = newFirstKindId;
    }

    public String getNewFirstKindName() {
        return newFirstKindName;
    }

    public void setNewFirstKindName(String newFirstKindName) {
        this.newFirstKindName = newFirstKindName;
    }

    public Integer getNewSecondKindId() {
        return newSecondKindId;
    }

    public void setNewSecondKindId(Integer newSecondKindId) {
        this.newSecondKindId = newSecondKindId;
    }

    public String getNewSecondKindName() {
        return newSecondKindName;
    }

    public void setNewSecondKindName(String newSecondKindName) {
        this.newSecondKindName = newSecondKindName;
    }

    public Integer getNewThirdKindId() {
        return newThirdKindId;
    }

    public void setNewThirdKindId(Integer newThirdKindId) {
        this.newThirdKindId = newThirdKindId;
    }

    public String getNewThirdKindName() {
        return newThirdKindName;
    }

    public void setNewThirdKindName(String newThirdKindName) {
        this.newThirdKindName = newThirdKindName;
    }

    public Integer getNewMajorKindId() {
        return newMajorKindId;
    }

    public void setNewMajorKindId(Integer newMajorKindId) {
        this.newMajorKindId = newMajorKindId;
    }

    public String getNewMajorKindName() {
        return newMajorKindName;
    }

    public void setNewMajorKindName(String newMajorKindName) {
        this.newMajorKindName = newMajorKindName;
    }

    public Integer getNewMajorId() {
        return newMajorId;
    }

    public void setNewMajorId(Integer newMajorId) {
        this.newMajorId = newMajorId;
    }

    public String getNewMajorName() {
        return newMajorName;
    }

    public void setNewMajorName(String newMajorName) {
        this.newMajorName = newMajorName;
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

    public String getSalaryStandardId() {
        return salaryStandardId;
    }

    public void setSalaryStandardId(String salaryStandardId) {
        this.salaryStandardId = salaryStandardId;
    }

    public String getSalaryStandardName() {
        return salaryStandardName;
    }

    public void setSalaryStandardName(String salaryStandardName) {
        this.salaryStandardName = salaryStandardName;
    }

    public Float getSalarySum() {
        return salarySum;
    }

    public void setSalarySum(Float salarySum) {
        this.salarySum = salarySum;
    }

    public String getNewSalaryStandardId() {
        return newSalaryStandardId;
    }

    public void setNewSalaryStandardId(String newSalaryStandardId) {
        this.newSalaryStandardId = newSalaryStandardId;
    }

    public String getNewSalaryStandardName() {
        return newSalaryStandardName;
    }

    public void setNewSalaryStandardName(String newSalaryStandardName) {
        this.newSalaryStandardName = newSalaryStandardName;
    }

    public Float getNewSalarySum() {
        return newSalarySum;
    }

    public void setNewSalarySum(Float newSalarySum) {
        this.newSalarySum = newSalarySum;
    }

    public String getChangeReason() {
        return changeReason;
    }

    public void setChangeReason(String changeReason) {
        this.changeReason = changeReason;
    }

    public String getCheckReason() {
        return checkReason;
    }

    public void setCheckReason(String checkReason) {
        this.checkReason = checkReason;
    }

    public Integer getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(Integer checkStatus) {
        this.checkStatus = checkStatus;
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

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }

    public Date getCheckTime() {
        return checkTime;
    }

    public void setCheckTime(Date checkTime) {
        this.checkTime = checkTime;
    }
}