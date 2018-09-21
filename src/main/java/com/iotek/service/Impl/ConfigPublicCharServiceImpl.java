package com.iotek.service.Impl;

import com.iotek.dao.ConfigPublicCharDao;
import com.iotek.entity.ConfigPublicChar;
import com.iotek.service.ConfigPublicCharService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ConfigPublicCharServiceImpl implements ConfigPublicCharService {
    @Autowired
    private ConfigPublicCharDao configPublicCharDao;
    @Override
    public List<ConfigPublicChar> showConfigPublicCharByKind(String attributeKind) {
        List<ConfigPublicChar> configPublicChars = configPublicCharDao.queryByAttributeKind(attributeKind);
        return configPublicChars;
    }
}