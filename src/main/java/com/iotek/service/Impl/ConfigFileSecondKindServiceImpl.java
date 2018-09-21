package com.iotek.service.Impl;

import com.iotek.dao.ConfigFileSecondKindDao;
import com.iotek.entity.ConfigFileSecondKind;
import com.iotek.service.ConfigFileSecondKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ConfigFileSecondKindServiceImpl implements ConfigFileSecondKindService {
    @Autowired
    private ConfigFileSecondKindDao configFileSecondKindDao;

    @Override
    public List<ConfigFileSecondKind> showAllFileSecondKind() {
        return configFileSecondKindDao.queryAll();
    }

    @Override
    public List<ConfigFileSecondKind> showFileByFirstKindId(Integer firstKindId) {
        return configFileSecondKindDao.queryByFirstId(firstKindId);
    }
}