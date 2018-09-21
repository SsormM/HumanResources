package com.iotek.dao;

import com.iotek.entity.SalaryStandard;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SalaryStandardDao {
    public abstract Integer addSalaryStandard(SalaryStandard salaryStandard);

    public abstract SalaryStandard queryStandardId();

    public abstract List<SalaryStandard> queryAllList();

    public abstract List<SalaryStandard> queryAll(@Param("beginIndex") Integer beginIndex, @Param("rows") Integer rows);

    public abstract Integer countRows();

    public abstract SalaryStandard querySalaryStandardById(String standardId);

    public abstract Integer update(SalaryStandard salaryStandard);

    public abstract List<SalaryStandard> queryByCondition(@Param("standardId") String standardId,
                                                          @Param("keyword") String keyword,
                                                          @Param("beginTime") Date beginTime,
                                                          @Param("endTime") Date endTime,
                                                          @Param("beginIndex") Integer beginIndex,
                                                          @Param("rows") Integer rows);

    public abstract Integer countRowsByCondition(@Param("standardId") String standardId,
                                                 @Param("keyword") String keyword,
                                                 @Param("beginTime") Date beginTime,
                                                 @Param("endTime") Date endTime);
}