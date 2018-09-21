package com.iotek.service.Impl;

import com.iotek.dao.ConfigMajorKindDao;
import com.iotek.entity.ConfigMajorKind;
import com.iotek.service.ConfigMajorKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConfigMajorKindServiceImpl implements ConfigMajorKindService {
    @Autowired
    private ConfigMajorKindDao configMajorKindDao;

    @Override
    public List<ConfigMajorKind> showAllMajorKind() {
        List<ConfigMajorKind> configMajorKinds = configMajorKindDao.queryAll();
        return configMajorKinds;
    }

    @Override
    public ConfigMajorKind showAllMajorKindById(Integer majorKindId) {
        ConfigMajorKind configMajorKind = configMajorKindDao.queryById(majorKindId);
        return configMajorKind;
    }
}