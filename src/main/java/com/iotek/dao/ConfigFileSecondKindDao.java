package com.iotek.dao;

import com.iotek.entity.ConfigFileSecondKind;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ConfigFileSecondKindDao {
    public abstract List<ConfigFileSecondKind> queryAll();

    public abstract List<ConfigFileSecondKind> queryByFirstId(Integer firstKindId);

    public abstract ConfigFileSecondKind queryByFirstIdAndSecondId(@Param("firstKindId") Integer firstKindId,
                                                                   @Param("secondKindId") Integer secondKindId);
}