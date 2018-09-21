package com.iotek.dao;

import com.iotek.entity.ConfigFileFirstKind;

import java.util.List;

public interface ConfigFileFirstKindDao {
    public abstract List<ConfigFileFirstKind> queryAll();
    public abstract ConfigFileFirstKind queryByFirstId(Integer firstKindId);
}