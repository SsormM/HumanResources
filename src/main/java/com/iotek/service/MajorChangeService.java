package com.iotek.service;

import com.iotek.entity.MajorChange;
import com.iotek.pojo.DataGridResult;

public interface MajorChangeService {

    public abstract Integer addMajorChange(MajorChange majorChange);

    public abstract DataGridResult<MajorChange> showAllMajorChange(Integer page, Integer rows);

    public abstract MajorChange showMajorChange(Integer mchId);

    public abstract Integer updateMajorChange(MajorChange newMajorChange);
}