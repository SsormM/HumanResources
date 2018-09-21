package com.iotek.service.Impl;

import com.iotek.dao.ConfigMajorDao;
import com.iotek.entity.ConfigMajor;
import com.iotek.service.ConfigMajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ConfigMajorServiceImpl implements ConfigMajorService {
    @Autowired
    private ConfigMajorDao configMajorDao;

    @Override
    public List<ConfigMajor> showConfigMajorById(Integer kindId) {
        List<ConfigMajor> configMajors = configMajorDao.queryById(kindId);
        return configMajors;
    }

    @Override
    public ConfigMajor showConfigMajorByKindIdAndId(Integer kindId, Integer majorId) {
        ConfigMajor configMajor = configMajorDao.queryByKindIdAndId(kindId, majorId);
        return configMajor;
    }
}