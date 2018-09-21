package com.iotek.entity;

import java.util.Date;

public class SalaryStandard {
    private Integer ssdId;
    private String standardId;
    private String standardName;
    private String designer;
    private String register;
    private String checker;
    private String changer;
    private Date registTime;
    private Date checkTime;
    private Date changeTime;
    private Float salarySum;
    private Integer checkStatus;
    private Integer changeStatus;
    private String checkComment;
    private String remark;

    @Override
    public String toString() {
        return "SalaryStandard{" +
                "ssdId=" + ssdId +
                ", standardId=" + standardId +
                ", standardName='" + standardName + '\'' +
                ", designer='" + designer + '\'' +
                ", register='" + register + '\'' +
                ", checker='" + checker + '\'' +
                ", changer='" + changer + '\'' +
                ", registTime=" + registTime +
                ", checkTime=" + checkTime +
                ", changeTime=" + changeTime +
                ", salarySum=" + salarySum +
                ", checkStatus=" + checkStatus +
                ", changeStatys=" + changeStatus +
                ", checkComment='" + checkComment + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }

    public Integer getSsdId() {
        return ssdId;
    }

    public void setSsdId(Integer ssdId) {
        this.ssdId = ssdId;
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

    public String getDesigner() {
        return designer;
    }

    public void setDesigner(String designer) {
        this.designer = designer;
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

    public String getChanger() {
        return changer;
    }

    public void setChanger(String changer) {
        this.changer = changer;
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

    public Date getChangeTime() {
        return changeTime;
    }

    public void setChangeTime(Date changeTime) {
        this.changeTime = changeTime;
    }

    public Float getSalarySum() {
        return salarySum;
    }

    public void setSalarySum(Float salarySum) {
        this.salarySum = salarySum;
    }

    public Integer getCheckStatus() {
        return checkStatus;
    }

    public void setCheckStatus(Integer checkStatus) {
        this.checkStatus = checkStatus;
    }

    public Integer getChangeStatus() {
        return changeStatus;
    }

    public void setChangeStatus(Integer changeStatus) {
        this.changeStatus = changeStatus;
    }

    public String getCheckComment() {
        return checkComment;
    }

    public void setCheckComment(String checkComment) {
        this.checkComment = checkComment;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}