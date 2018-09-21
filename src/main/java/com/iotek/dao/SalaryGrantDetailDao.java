package com.iotek.dao;

import com.iotek.entity.SalaryGrantDetail;

import java.util.List;

public interface SalaryGrantDetailDao {
    public abstract Integer addSalaryGrantDetail(SalaryGrantDetail salaryGrantDetail);

    public abstract SalaryGrantDetail queryByHumanId(String HumanId);

    public abstract Integer update(SalaryGrantDetail salaryGrantDetail);

    public abstract Integer queryPaidSum(String salaryGrantId);

    public abstract List<SalaryGrantDetail> queryBySalaryGrantId(String salaryGrantId);
}