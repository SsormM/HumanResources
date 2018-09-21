package com.iotek.entity;

import java.util.Date;
import java.util.List;

public class HumanFile {
    private Integer hufId;
    private String humanId;
    private Integer firstKindId;
    private String firstKindName;
    private Integer secondKindId;
    private String secondKindName;
    private Integer thirdKindId;
    private String thirdKindName;
    private String humanName;
    private String humanAddress;
    private String humanPostcode;
    private String humanProDesignation;
    private Integer humanMajorKindId;
    private String humanMajorKindName;
    private Integer humanMajorId;
    private String hunmaMajorName;
    private String humanTelephone;
    private String humanMobilephone;
    private String humanBank;
    private String humanAccount;
    private String humanQq;
    private String humanEmail;
    private String humanHobby;
    private String humanSpeciality;
    private String humanSex;
    private String humanReligion;
    private String humanParty;
    private String humanNationality;
    private String humanRace;
    private Date humanBirthday;
    private String humanBirthplace;
    private Integer humanAge;
    private String humanEducatedDegree;
    private Integer humanEducatedYears;
    private String humanEducatedMajor;
    private String humanSocietySecurityId;
    private String humanIdCard;
    private String remark;
    private String salaryStandardId;
    private String salaryStandardName;
    private Float salarySum;
    private Float demandSalaraySum;
    private Float paidSalarySum;
    private Integer majorChangeAmount;
    private Integer bonusAmount;
    private Integer trainingAmount;
    private Integer fileChangAmount;
    private String humanHistroyRecords;
    private String humanFamilyMembership;
    private String humanPicture;
    private String attachmentName;
    private Integer checkStatus;
    private String register;
    private String checker;
    private String changer;
    private Date registTime;
    private Date checkTime;
    private Date changeTime;
    private Date lastlyChangeTime;
    private Date deleteTime;
    private Date recoveryTime;
    private Integer humanFileStatus;//0:提交未复核 2;复核通过
    private List<SalaryStandardDetail> salaryStandardDetails;
    private SalaryGrantDetail salaryGrantDetail;

    public SalaryGrantDetail getSalaryGrantDetail() {
        return salaryGrantDetail;
    }

    public void setSalaryGrantDetail(SalaryGrantDetail salaryGrantDetail) {
        this.salaryGrantDetail = salaryGrantDetail;
    }

    public List<SalaryStandardDetail> getSalaryStandardDetails() {
        return salaryStandardDetails;
    }

    public void setSalaryStandardDetails(List<SalaryStandardDetail> salaryStandardDetails) {
        this.salaryStandardDetails = salaryStandardDetails;
    }


    @Override
    public String toString() {
        return "HumanFile{" +
                "hufId=" + hufId +
                ", humanId='" + humanId + '\'' +
                ", firstKindId=" + firstKindId +
                ", firstKindName='" + firstKindName + '\'' +
                ", secondKindId=" + secondKindId +
                ", secondKindName='" + secondKindName + '\'' +
                ", thirdKindId=" + thirdKindId +
                ", thirdKindName='" + thirdKindName + '\'' +
                ", humanName='" + humanName + '\'' +
                ", humanAddress='" + humanAddress + '\'' +
                ", humanPostcode='" + humanPostcode + '\'' +
                ", humanProDesignation='" + humanProDesignation + '\'' +
                ", humanMajorKindId=" + humanMajorKindId +
                ", humanMajorKindName='" + humanMajorKindName + '\'' +
                ", humanMajorId=" + humanMajorId +
                ", hunmaMajorName='" + hunmaMajorName + '\'' +
                ", humanTelephone='" + humanTelephone + '\'' +
                ", humanMobilephone='" + humanMobilephone + '\'' +
                ", humanBank='" + humanBank + '\'' +
                ", humanAccount='" + humanAccount + '\'' +
                ", humanQq='" + humanQq + '\'' +
                ", humanEmail='" + humanEmail + '\'' +
                ", humanHobby='" + humanHobby + '\'' +
                ", humanSpeciality='" + humanSpeciality + '\'' +
                ", humanSex='" + humanSex + '\'' +
                ", humanReligion='" + humanReligion + '\'' +
                ", humanParty='" + humanParty + '\'' +
                ", humanNationality='" + humanNationality + '\'' +
                ", humanRace='" + humanRace + '\'' +
                ", humanBirthday=" + humanBirthday +
                ", humanBirthplace='" + humanBirthplace + '\'' +
                ", humanAge=" + humanAge +
                ", humanEducatedDegree='" + humanEducatedDegree + '\'' +
                ", humanEducatedYears=" + humanEducatedYears +
                ", humanEducatedMajor='" + humanEducatedMajor + '\'' +
                ", humanSocietySecurityId='" + humanSocietySecurityId + '\'' +
                ", humanIdCard='" + humanIdCard + '\'' +
                ", remark='" + remark + '\'' +
                ", salaryStandardId='" + salaryStandardId + '\'' +
                ", salaryStandardName='" + salaryStandardName + '\'' +
                ", salarySum=" + salarySum +
                ", demandSalaraySum=" + demandSalaraySum +
                ", paidSalarySum=" + paidSalarySum +
                ", majorChangeAmount=" + majorChangeAmount +
                ", bonusAmount=" + bonusAmount +
                ", trainingAmount=" + trainingAmount +
                ", fileChangAmount=" + fileChangAmount +
                ", humanHistroyRecords='" + humanHistroyRecords + '\'' +
                ", humanFamilyMembership='" + humanFamilyMembership + '\'' +
                ", humanPicture='" + humanPicture + '\'' +
                ", attachmentName='" + attachmentName + '\'' +
                ", checkStatus=" + checkStatus +
                ", register='" + register + '\'' +
                ", checker='" + checker + '\'' +
                ", changer='" + changer + '\'' +
                ", registTime=" + registTime +
                ", checkTime=" + checkTime +
                ", changeTime=" + changeTime +
                ", lastlyChangeTime=" + lastlyChangeTime +
                ", deleteTime=" + deleteTime +
                ", recoveryTime=" + recoveryTime +
                ", humanFileStatus=" + humanFileStatus +
                ", salaryStandardDetails=" + salaryStandardDetails +
                ", salaryGrantDetail=" + salaryGrantDetail +
                '}';
    }

    public Integer getHufId() {
        return hufId;
    }

    public void setHufId(Integer hufId) {
        this.hufId = hufId;
    }

    public String getHumanId() {
        return humanId;
    }

    public void setHumanId(String humanId) {
        this.humanId = humanId;
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

    public String getHumanName() {
        return humanName;
    }

    public void setHumanName(String humanName) {
        this.humanName = humanName;
    }

    public String getHumanAddress() {
        return humanAddress;
    }

    public void setHumanAddress(String humanAddress) {
        this.humanAddress = humanAddress;
    }

    public String getHumanPostcode() {
        return humanPostcode;
    }

    public void setHumanPostcode(String humanPostcode) {
        this.humanPostcode = humanPostcode;
    }

    public String getHumanProDesignation() {
        return humanProDesignation;
    }

    public void setHumanProDesignation(String humanProDesignation) {
        this.humanProDesignation = humanProDesignation;
    }

    public Integer getHumanMajorKindId() {
        return humanMajorKindId;
    }

    public void setHumanMajorKindId(Integer humanMajorKindId) {
        this.humanMajorKindId = humanMajorKindId;
    }

    public String getHumanMajorKindName() {
        return humanMajorKindName;
    }

    public void setHumanMajorKindName(String humanMajorKindName) {
        this.humanMajorKindName = humanMajorKindName;
    }

    public Integer getHumanMajorId() {
        return humanMajorId;
    }

    public void setHumanMajorId(Integer humanMajorId) {
        this.humanMajorId = humanMajorId;
    }

    public String getHunmaMajorName() {
        return hunmaMajorName;
    }

    public void setHunmaMajorName(String hunmaMajorName) {
        this.hunmaMajorName = hunmaMajorName;
    }

    public String getHumanTelephone() {
        return humanTelephone;
    }

    public void setHumanTelephone(String humanTelephone) {
        this.humanTelephone = humanTelephone;
    }

    public String getHumanMobilephone() {
        return humanMobilephone;
    }

    public void setHumanMobilephone(String humanMobilephone) {
        this.humanMobilephone = humanMobilephone;
    }

    public String getHumanBank() {
        return humanBank;
    }

    public void setHumanBank(String humanBank) {
        this.humanBank = humanBank;
    }

    public String getHumanAccount() {
        return humanAccount;
    }

    public void setHumanAccount(String humanAccount) {
        this.humanAccount = humanAccount;
    }

    public String getHumanQq() {
        return humanQq;
    }

    public void setHumanQq(String humanQq) {
        this.humanQq = humanQq;
    }

    public String getHumanEmail() {
        return humanEmail;
    }

    public void setHumanEmail(String humanEmail) {
        this.humanEmail = humanEmail;
    }

    public String getHumanHobby() {
        return humanHobby;
    }

    public void setHumanHobby(String humanHobby) {
        this.humanHobby = humanHobby;
    }

    public String getHumanSpeciality() {
        return humanSpeciality;
    }

    public void setHumanSpeciality(String humanSpeciality) {
        this.humanSpeciality = humanSpeciality;
    }

    public String getHumanSex() {
        return humanSex;
    }

    public void setHumanSex(String humanSex) {
        this.humanSex = humanSex;
    }

    public String getHumanReligion() {
        return humanReligion;
    }

    public void setHumanReligion(String humanReligion) {
        this.humanReligion = humanReligion;
    }

    public String getHumanParty() {
        return humanParty;
    }

    public void setHumanParty(String humanParty) {
        this.humanParty = humanParty;
    }

    public String getHumanNationality() {
        return humanNationality;
    }

    public void setHumanNationality(String humanNationality) {
        this.humanNationality = humanNationality;
    }

    public String getHumanRace() {
        return humanRace;
    }

    public void setHumanRace(String humanRace) {
        this.humanRace = humanRace;
    }

    public Date getHumanBirthday() {
        return humanBirthday;
    }

    public void setHumanBirthday(Date humanBirthday) {
        this.humanBirthday = humanBirthday;
    }

    public String getHumanBirthplace() {
        return humanBirthplace;
    }

    public void setHumanBirthplace(String humanBirthplace) {
        this.humanBirthplace = humanBirthplace;
    }

    public Integer getHumanAge() {
        return humanAge;
    }

    public void setHumanAge(Integer humanAge) {
        this.humanAge = humanAge;
    }

    public String getHumanEducatedDegree() {
        return humanEducatedDegree;
    }

    public void setHumanEducatedDegree(String humanEducatedDegree) {
        this.humanEducatedDegree = humanEducatedDegree;
    }

    public Integer getHumanEducatedYears() {
        return humanEducatedYears;
    }

    public void setHumanEducatedYears(Integer humanEducatedYears) {
        this.humanEducatedYears = humanEducatedYears;
    }

    public String getHumanEducatedMajor() {
        return humanEducatedMajor;
    }

    public void setHumanEducatedMajor(String humanEducatedMajor) {
        this.humanEducatedMajor = humanEducatedMajor;
    }

    public String getHumanSocietySecurityId() {
        return humanSocietySecurityId;
    }

    public void setHumanSocietySecurityId(String humanSocietySecurityId) {
        this.humanSocietySecurityId = humanSocietySecurityId;
    }

    public String getHumanIdCard() {
        return humanIdCard;
    }

    public void setHumanIdCard(String humanIdCard) {
        this.humanIdCard = humanIdCard;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    public Float getDemandSalaraySum() {
        return demandSalaraySum;
    }

    public void setDemandSalaraySum(Float demandSalaraySum) {
        this.demandSalaraySum = demandSalaraySum;
    }

    public Float getPaidSalarySum() {
        return paidSalarySum;
    }

    public void setPaidSalarySum(Float paidSalarySum) {
        this.paidSalarySum = paidSalarySum;
    }

    public Integer getMajorChangeAmount() {
        return majorChangeAmount;
    }

    public void setMajorChangeAmount(Integer majorChangeAmount) {
        this.majorChangeAmount = majorChangeAmount;
    }

    public Integer getBonusAmount() {
        return bonusAmount;
    }

    public void setBonusAmount(Integer bonusAmount) {
        this.bonusAmount = bonusAmount;
    }

    public Integer getTrainingAmount() {
        return trainingAmount;
    }

    public void setTrainingAmount(Integer trainingAmount) {
        this.trainingAmount = trainingAmount;
    }

    public Integer getFileChangAmount() {
        return fileChangAmount;
    }

    public void setFileChangAmount(Integer fileChangAmount) {
        this.fileChangAmount = fileChangAmount;
    }

    public String getHumanHistroyRecords() {
        return humanHistroyRecords;
    }

    public void setHumanHistroyRecords(String humanHistroyRecords) {
        this.humanHistroyRecords = humanHistroyRecords;
    }

    public String getHumanFamilyMembership() {
        return humanFamilyMembership;
    }

    public void setHumanFamilyMembership(String humanFamilyMembership) {
        this.humanFamilyMembership = humanFamilyMembership;
    }

    public String getHumanPicture() {
        return humanPicture;
    }

    public void setHumanPicture(String humanPicture) {
        this.humanPicture = humanPicture;
    }

    public String getAttachmentName() {
        return attachmentName;
    }

    public void setAttachmentName(String attachmentName) {
        this.attachmentName = attachmentName;
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

    public Date getLastlyChangeTime() {
        return lastlyChangeTime;
    }

    public void setLastlyChangeTime(Date lastlyChangeTime) {
        this.lastlyChangeTime = lastlyChangeTime;
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    public Date getRecoveryTime() {
        return recoveryTime;
    }

    public void setRecoveryTime(Date recoveryTime) {
        this.recoveryTime = recoveryTime;
    }

    public Integer getHumanFileStatus() {
        return humanFileStatus;
    }

    public void setHumanFileStatus(Integer humanFileStatus) {
        this.humanFileStatus = humanFileStatus;
    }
}