package com.iotek.service;

import com.iotek.entity.ConfigFileSecondKind;

import java.util.List;

public interface ConfigFileSecondKindService {
    public abstract List<ConfigFileSecondKind> showAllFileSecondKind();
    public abstract List<ConfigFileSecondKind> showFileByFirstKindId(Integer firstKindId);

}