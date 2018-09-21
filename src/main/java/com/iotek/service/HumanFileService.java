package com.iotek.service;

import com.iotek.entity.HumanFile;
import com.iotek.pojo.DataGridResult;

import java.util.Date;
import java.util.List;


public interface HumanFileService {
    public abstract Integer register(HumanFile humanFile);

    public abstract DataGridResult<HumanFile> showAllHumanFile(Integer page, Integer rows);

    public abstract HumanFile showHumanFileByHufId(Integer hufId);

    public abstract Integer uncomplete(Integer hufId, Integer humanFileStatus);

    public abstract Integer complete(HumanFile humanFile, String checker);

    public abstract DataGridResult<HumanFile> search(HumanFile humanFile, Integer page, Integer rows, Date beginTime, Date endTime);

    public abstract Integer update(HumanFile humanFile, String changer);

    public abstract Integer delete(HumanFile humanFile);

    public abstract Integer recovery(HumanFile humanFile);

    public abstract List<HumanFile> showHumanFileByFisrtIdAndSecId(HumanFile humanFile);

    public abstract List<HumanFile> showHumanFileBySalaryGrantId(String salaryGrantId);
}