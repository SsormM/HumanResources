package com.iotek.dao;

import com.iotek.entity.ConfigMajorKind;

import java.util.List;

public interface ConfigMajorKindDao {
    public abstract List<ConfigMajorKind> queryAll();
    public abstract ConfigMajorKind queryById(Integer majorKindId);
}