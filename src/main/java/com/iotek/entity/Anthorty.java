package com.iotek.entity;

public class Anthorty {
    private Integer anthortyId;
    private Integer anthortyPid;
    private String anthortyPName;
    private String anthortyName;
    private String anthortyDesc;
    private String anthortyUrl;

    @Override
    public String toString() {
        return "Anthorty{" +
                "anthortyId=" + anthortyId +
                ", anthortyPid=" + anthortyPid +
                ", anthortyPName=" + anthortyPName +
                ", anthortyName='" + anthortyName + '\'' +
                ", anthortyDesc='" + anthortyDesc + '\'' +
                ", anthortyUrl='" + anthortyUrl + '\'' +
                '}';
    }

    public String getAnthortyPName() {
        return anthortyPName;
    }

    public void setAnthortyPName(String  anthortyPName) {
        this.anthortyPName = anthortyPName;
    }

    public Integer getAnthortyId() {
        return anthortyId;
    }

    public void setAnthortyId(Integer anthortyId) {
        this.anthortyId = anthortyId;
    }

    public Integer getAnthortyPid() {
        return anthortyPid;
    }

    public void setAnthortyPid(Integer anthortyPid) {
        this.anthortyPid = anthortyPid;
    }

    public String getAnthortyName() {
        return anthortyName;
    }

    public void setAnthortyName(String anthortyName) {
        this.anthortyName = anthortyName;
    }

    public String getAnthortyDesc() {
        return anthortyDesc;
    }

    public void setAnthortyDesc(String anthortyDesc) {
        this.anthortyDesc = anthortyDesc;
    }

    public String getAnthortyUrl() {
        return anthortyUrl;
    }

    public void setAnthortyUrl(String anthortyUrl) {
        this.anthortyUrl = anthortyUrl;
    }
}