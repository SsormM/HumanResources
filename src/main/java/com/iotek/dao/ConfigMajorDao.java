package com.iotek.dao;

import com.iotek.entity.ConfigMajor;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ConfigMajorDao {
    public abstract List<ConfigMajor> queryById(Integer kindId);

    public abstract ConfigMajor queryByKindIdAndId(@Param("kindId") Integer kindId,
                                                   @Param("majorId") Integer majorId);
}