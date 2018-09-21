package com.iotek.dao;

import com.iotek.entity.ConfigFileThirdKind;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ConfigFileThirdKindDao {
    public abstract List<ConfigFileThirdKind> queryByFirstIdAndSecond(@Param("firstKindId") Integer firstKindId,
                                                                      @Param("secondKindId") Integer secondKindId);

    public abstract ConfigFileThirdKind queryByThirdId(@Param("firstKindId") Integer firstKindId,
                                                       @Param("secondKindId") Integer secondKindId,
                                                       @Param("thirdKindId") Integer thirdKindId);
}