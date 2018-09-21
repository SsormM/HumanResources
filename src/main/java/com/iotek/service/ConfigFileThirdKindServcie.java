package com.iotek.service;

import com.iotek.entity.ConfigFileThirdKind;

import java.util.List;

public interface ConfigFileThirdKindServcie {
    public abstract List<ConfigFileThirdKind> showFileByFirstKindIdAndSecondId(Integer firstKindId,Integer secondKindId);
}