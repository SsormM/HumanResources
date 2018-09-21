package com.iotek.dao;

import com.iotek.entity.SalaryGrant;
import com.iotek.entity.SalaryStandard;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface SalaryGrantDao {
    public abstract SalaryGrant querySalaryGrantId();

    public abstract SalaryGrant queryLast(@Param("firstKindName") String firstKindName, @Param("secondKindName") String secondKindName);

    public abstract Integer queryAllCount();

    public abstract SalaryGrant queryBySalaryGrantId(SalaryGrant salaryGrant);

    public abstract Integer add(SalaryGrant salaryGrant);

    public abstract Integer update(SalaryGrant salaryGrant);

    //分页查找没有审核的SalaryGrant记录
    public abstract List<SalaryGrant> queryALLSalaryGrant(@Param("beginIndex") Integer beginIndex, @Param("rows") Integer rows);

    //搜索没有审核的SalaryGrant记录数量
    public abstract Integer countRows();

    public abstract List<SalaryGrant> queryByCondition(@Param("salaryGrantId") String salaryGrantId,
                                                       @Param("keyword") String keyword,
                                                       @Param("beginTime") Date beginTime,
                                                       @Param("endTime") Date endTime,
                                                       @Param("beginIndex") Integer beginIndex,
                                                       @Param("rows") Integer rows);

    public abstract Integer countRowsByCondition(@Param("salaryGrantId") String salaryGrantId,
                                                 @Param("keyword") String keyword,
                                                 @Param("beginTime") Date beginTime,
                                                 @Param("endTime") Date endTime);

}