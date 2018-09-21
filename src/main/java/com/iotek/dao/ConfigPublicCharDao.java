package com.iotek.dao;

import com.iotek.entity.ConfigPublicChar;

import java.util.List;

public interface ConfigPublicCharDao {
    public abstract List<ConfigPublicChar> queryByAttributeKind(String attributeKind);
}