package com.iotek.pojo;

import com.iotek.entity.HumanFile;

import java.util.List;

public class SalaryGrantPojo {
    private String salaryGrantId;
    private List<HumanFile> humanFiles;
    private Integer count;

    public String getSalaryGrantId() {
        return salaryGrantId;
    }

    public void setSalaryGrantId(String salaryGrantId) {
        this.salaryGrantId = salaryGrantId;
    }

    public List<HumanFile> getHumanFiles() {
        return humanFiles;
    }

    public void setHumanFiles(List<HumanFile> humanFiles) {
        this.humanFiles = humanFiles;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "SalaryGrantPojo{" +
                "salaryGrantId='" + salaryGrantId + '\'' +
                ", humanFiles=" + humanFiles +
                ", count=" + count +
                '}';
    }
}