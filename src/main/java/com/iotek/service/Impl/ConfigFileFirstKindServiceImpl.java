package com.iotek.service.Impl;

import com.iotek.dao.ConfigFileFirstKindDao;
import com.iotek.entity.ConfigFileFirstKind;
import com.iotek.service.ConfigFileFirstKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConfigFileFirstKindServiceImpl implements ConfigFileFirstKindService {
    @Autowired
    private ConfigFileFirstKindDao configFileFirstKindDao;

    @Override
    public List<ConfigFileFirstKind> showAllFileFirstKind() {
        List<ConfigFileFirstKind> configFileFirstKinds = configFileFirstKindDao.queryAll();
        return configFileFirstKinds;
    }
}