package com.iotek.service;


import com.iotek.entity.SalaryStandard;
import com.iotek.pojo.DataGridResult;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface SalaryStandardService {
    public abstract Integer addSalaryStandard(SalaryStandard salaryStandard, String[] itemName, Float[] salary);

    public abstract String queryStandardId();

    public abstract List<SalaryStandard> showAllSalaryStandard();

    public abstract DataGridResult<SalaryStandard> showSalaryStandardList(Integer page, Integer rows);

    public abstract SalaryStandard querySalaryStandardById(String standardId);

    public abstract Integer updateSalaryStandard(SalaryStandard salaryStandard, String[] itemName, Float[] salary, Integer[] sdtId);

    public abstract Integer uncompleted(SalaryStandard salaryStandard);

    public abstract DataGridResult<SalaryStandard> searchSalaryStandard(String standardId, String keyword, Date beginTime, Date endTime,
                                                                        Integer page, Integer rows);
}