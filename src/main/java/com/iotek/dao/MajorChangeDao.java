package com.iotek.dao;

import com.iotek.entity.MajorChange;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MajorChangeDao {
    public abstract Integer addMajorChangeDao(MajorChange majorChange);

    public abstract Integer countRows();

    public abstract List<MajorChange> queryAll(@Param("beginIndex") Integer beginIndex, @Param("rows") Integer rows);

    public abstract MajorChange queryById(Integer mchId);

    public abstract Integer updateMajorChange(MajorChange newMajorChange);
}