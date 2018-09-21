package com.iotek.dao;

import com.iotek.entity.SalaryStandardDetail;

import java.util.List;

public interface SalaryStandardDetailDao {
    public abstract Integer addSalaryStandardDetail(SalaryStandardDetail salaryStandardDetail);

    public abstract List<SalaryStandardDetail> querySalaryStandardDetailById(String standardId);

    public abstract Integer update(SalaryStandardDetail salaryStandardDetail);

}