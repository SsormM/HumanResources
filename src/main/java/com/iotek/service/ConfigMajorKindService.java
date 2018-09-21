package com.iotek.service;

import com.iotek.entity.ConfigMajorKind;

import java.util.List;

public interface ConfigMajorKindService {
    public abstract List<ConfigMajorKind> showAllMajorKind();
    public abstract ConfigMajorKind showAllMajorKindById(Integer majorKindId);
}