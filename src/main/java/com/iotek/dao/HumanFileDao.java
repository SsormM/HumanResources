package com.iotek.dao;

import com.iotek.entity.HumanFile;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface HumanFileDao {
    //登记人事信息
    public abstract Integer addHumanFile(HumanFile humanFile);
    //分页查询所有需要复核的人事信息
    public abstract List<HumanFile> queryAll(@Param("beginIndex") Integer beginIndex, @Param("rows") Integer rows);
    //按条件查询所有状态未正常的人事信息
    public abstract List<HumanFile> queryByCondition(@Param("humanFile") HumanFile humanFile,
                                                     @Param("beginIndex") Integer beginIndex,
                                                     @Param("rows") Integer rows,
                                                     @Param("beginTime") Date beginTime,
                                                     @Param("endTime") Date endTime);
    //按条件查询所有状态为正常的人事信息条数
    public int countRowsByCondition(@Param("humanFile") HumanFile humanFile,
                                    @Param("beginTime") Date beginTime,
                                    @Param("endTime") Date endTime);

    //按条件查询所有未复核的人事信息条数
    public int countRows();
    //按hufid查找人事信息
    public abstract HumanFile queryByHufId(Integer hufId);

    public abstract Integer updateUncomplete(@Param("hufId") Integer hufId,
                                             @Param("humanFileStatus") Integer humanFileStatus);
    //按照hufid更新人事信息
    public abstract Integer updateByHufId(HumanFile humanFile);
    //查询humanId最后一个
    public abstract HumanFile queryHumanId();

    public abstract List<HumanFile> query();

    public abstract List<HumanFile> querybyFisrtIdAndSecId(HumanFile humanFile);

    public abstract Integer updateSalarySum(HumanFile humanFile);

    public abstract List<HumanFile> querybySalaryGrantId(String salaryGrantId);

    public abstract HumanFile queryByHumanId(String humanId);
}