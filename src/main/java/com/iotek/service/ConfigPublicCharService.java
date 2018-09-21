package com.iotek.service;


import com.iotek.entity.ConfigPublicChar;

import java.util.List;

public interface ConfigPublicCharService {
    public abstract List<ConfigPublicChar> showConfigPublicCharByKind(String attributeKind);
}