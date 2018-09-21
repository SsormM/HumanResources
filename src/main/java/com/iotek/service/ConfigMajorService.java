package com.iotek.service;

import com.iotek.entity.ConfigMajor;

import java.util.List;

public interface ConfigMajorService {
    public abstract List<ConfigMajor> showConfigMajorById (Integer kindId);
    public abstract ConfigMajor showConfigMajorByKindIdAndId (Integer kindId,Integer majorId);
}