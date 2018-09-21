package com.iotek.pojo;

import com.iotek.entity.SalaryGrant;
import com.iotek.entity.SalaryGrantDetail;
import java.util.List;

public class SalaryGrantDetailPojo {
    private SalaryGrant salaryGrant;
    private List<SalaryGrantDetail> salaryGrantDetails;



    public SalaryGrant getSalaryGrant() {
        return salaryGrant;
    }

    public void setSalaryGrant(SalaryGrant salaryGrant) {
        this.salaryGrant = salaryGrant;
    }

    public List<SalaryGrantDetail> getSalaryGrantDetails() {
        return salaryGrantDetails;
    }

    public void setSalaryGrantDetails(List<SalaryGrantDetail> salaryGrantDetails) {
        this.salaryGrantDetails = salaryGrantDetails;
    }
}