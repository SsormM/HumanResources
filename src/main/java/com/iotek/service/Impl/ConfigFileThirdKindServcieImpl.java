package com.iotek.service.Impl;

import com.iotek.dao.ConfigFileThirdKindDao;
import com.iotek.entity.ConfigFileThirdKind;
import com.iotek.service.ConfigFileThirdKindServcie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConfigFileThirdKindServcieImpl implements ConfigFileThirdKindServcie {
    @Autowired
    private ConfigFileThirdKindDao configFileThirdKindDao;

    @Override
    public List<ConfigFileThirdKind> showFileByFirstKindIdAndSecondId(Integer firstKindId, Integer secondKindId) {
        return configFileThirdKindDao.queryByFirstIdAndSecond(firstKindId,secondKindId);
    }
}