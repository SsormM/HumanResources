package com.iotek.service.Impl;

import com.iotek.dao.*;
import com.iotek.entity.ConfigMajor;
import com.iotek.entity.ConfigMajorKind;
import com.iotek.entity.HumanFile;
import com.iotek.entity.SalaryStandard;
import com.iotek.pojo.DataGridResult;
import com.iotek.service.HumanFileService;
import com.iotek.util.IdCreaterUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class HumanFileServiceImpl implements HumanFileService {
    @Autowired
    private HumanFileDao humanFileDao;
    @Autowired
    private HumanFileDigDao humanFileDigDao;
    @Autowired
    private ConfigFileFirstKindDao configFileFirstKindDao;
    @Autowired
    private ConfigFileSecondKindDao configFileSecondKindDao;
    @Autowired
    private ConfigFileThirdKindDao configFileThirdKindDao;
    @Autowired
    private ConfigMajorDao configMajorDao;
    @Autowired
    private ConfigMajorKindDao configMajorKindDao;
    @Autowired
    private SalaryStandardDao salaryStandardDao;

    @Override
    public Integer register(HumanFile humanFile) {
        Integer firstKindId = humanFile.getFirstKindId();
        Integer secondKindId = humanFile.getSecondKindId();
        Integer thirdKindId = humanFile.getThirdKindId();
        Integer humanMajorKindId = humanFile.getHumanMajorKindId();
        Integer humanMajorId = humanFile.getHumanMajorId();
        String salaryStandardId = humanFile.getSalaryStandardId();

        String firstKindName = configFileFirstKindDao.queryByFirstId(firstKindId).getFirstKindName();
        String secondKindName = configFileSecondKindDao.queryByFirstIdAndSecondId(firstKindId, secondKindId).getSecondKindName();
        String thirdKindName = configFileThirdKindDao.queryByThirdId(firstKindId, secondKindId, thirdKindId).getThirdKindName();
        String majorKindName = configMajorKindDao.queryById(humanMajorKindId).getMajorKindName();
        String majorName = configMajorDao.queryByKindIdAndId(humanMajorKindId, humanMajorId).getMajorName();
        SalaryStandard salaryStandard = salaryStandardDao.querySalaryStandardById(salaryStandardId);
        //生成humanId
        HumanFile queryHumanId = humanFileDao.queryHumanId();
        String humanId = null;
        if (queryHumanId != null) {
            humanId = queryHumanId.getHumanId();
        }
        String head = "HUF";
        humanId = IdCreaterUtil.createrId(humanId, head);
        System.out.println("shengcheng :"+humanId);
        humanFile.setHumanId(humanId);
        humanFile.setFirstKindName(firstKindName);
        humanFile.setSecondKindName(secondKindName);
        humanFile.setThirdKindName(thirdKindName);
        humanFile.setHumanMajorKindName(majorKindName);
        humanFile.setHunmaMajorName(majorName);
        humanFile.setCheckStatus(0);
        humanFile.setHumanFileStatus(1);

        humanFile.setSalaryStandardId(salaryStandard.getStandardId());
        humanFile.setSalaryStandardName(salaryStandard.getStandardName());
        humanFile.setSalarySum(salaryStandard.getSalarySum());

        System.out.println(humanFile);
        Integer addHumanFile = humanFileDao.addHumanFile(humanFile);
        Integer addHumanFileDig = humanFileDigDao.addHumanFileDig(humanFile);
        Integer result = null;
        if (addHumanFile == 1 && addHumanFileDig == 1) {
            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    @Override
    public DataGridResult<HumanFile> showAllHumanFile(Integer page, Integer rows) {
        Integer beginIndex = (page - 1) * rows;
        DataGridResult<HumanFile> gridResult = new DataGridResult<>();
        gridResult.setCurrentPage(page);
        gridResult.setTotal(humanFileDao.countRows());
        gridResult.setPageCount((humanFileDao.countRows() + rows - 1) / rows);
        gridResult.setRows(humanFileDao.queryAll(beginIndex, rows));
        return gridResult;
    }

    @Override
    public HumanFile showHumanFileByHufId(Integer hufId) {
        HumanFile humanFile = humanFileDao.queryByHufId(hufId);
        return humanFile;
    }

    @Override
    public Integer uncomplete(Integer hufId, Integer humanFileStatus) {
        Integer updateHumanFileStatus = humanFileDao.updateUncomplete(hufId, humanFileStatus);
        HumanFile humanFile = humanFileDao.queryByHufId(hufId);
        Integer addHumanFileDig = humanFileDigDao.addHumanFileDig(humanFile);
        if (updateHumanFileStatus == 1 && addHumanFileDig == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public Integer complete(HumanFile humanFile, String checker) {
        SalaryStandard salaryStandard = salaryStandardDao.querySalaryStandardById(humanFile.getSalaryStandardId());
        humanFile.setSalaryStandardName(salaryStandard.getStandardName());
        humanFile.setSalarySum(salaryStandard.getSalarySum());
        humanFile.setCheckStatus(1);
        humanFile.setChecker(checker);
        humanFile.setCheckTime(new Date());
        humanFile.setHumanFileStatus(3);

        Integer integer = humanFileDao.updateByHufId(humanFile);
        HumanFile queryByHufId = humanFileDao.queryByHufId(humanFile.getHufId());
        Integer addHumanFileDig = humanFileDigDao.addHumanFileDig(queryByHufId);
        if (integer == 1 && addHumanFileDig == 1) {
            return 1;
        } else {
            return 0;
        }

    }

    @Override
    public DataGridResult<HumanFile> search(HumanFile humanFile, Integer page, Integer rows, Date beginTime, Date endTime) {
        Integer beginIndex = (page - 1) * rows;
        DataGridResult<HumanFile> gridResult = new DataGridResult<>();
        gridResult.setCurrentPage(page);
        gridResult.setTotal(humanFileDao.countRowsByCondition(humanFile, beginTime, endTime));
        gridResult.setPageCount((humanFileDao.countRowsByCondition(humanFile,beginTime,endTime) + rows - 1) / rows);
        gridResult.setRows(humanFileDao.queryByCondition(humanFile, beginIndex, rows, beginTime, endTime));
        return gridResult;
    }

    @Override
    public Integer update(HumanFile humanFile, String changer) {
        SalaryStandard salaryStandard = salaryStandardDao.querySalaryStandardById(humanFile.getSalaryStandardId());
        humanFile.setSalaryStandardName(salaryStandard.getStandardName());
        humanFile.setSalarySum(salaryStandard.getSalarySum());
        HumanFile old = humanFileDao.queryByHufId(humanFile.getHufId());
        humanFile.setCheckStatus(0);
        humanFile.setHumanFileStatus(2);
        humanFile.setChanger(changer);
        if (old.getFileChangAmount() == null) {
            humanFile.setFileChangAmount(1);
        } else {
            humanFile.setFileChangAmount(old.getFileChangAmount() + 1);
        }
        humanFile.setChangeTime(new Date());
        humanFile.setLastlyChangeTime(new Date());
        Integer updateByHufId = humanFileDao.updateByHufId(humanFile);
        Integer addHumanFileDig = humanFileDigDao.addHumanFileDig(humanFile);
        if (updateByHufId == 1 && addHumanFileDig == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    public Integer delete(HumanFile humanFile) {
        HumanFile queryByHufId = humanFileDao.queryByHufId(humanFile.getHufId());
        if (queryByHufId.getHunmaMajorName() == "系统管理员"
                && queryByHufId.getCheckStatus() == 0
                && queryByHufId.getHumanFileStatus() == -1) {
            return 0;
        }
        queryByHufId.setDeleteTime(new Date());
        queryByHufId.setHumanFileStatus(-1);
        Integer updateByHufId = humanFileDao.updateByHufId(queryByHufId);
        Integer addHumanFileDig = humanFileDigDao.addHumanFileDig(queryByHufId);
        if (updateByHufId == 1 && addHumanFileDig == 1) {
            return 1;
        } else {
            return 0;
        }

    }

    @Override
    public Integer recovery(HumanFile humanFile) {
        HumanFile queryByHufId = humanFileDao.queryByHufId(humanFile.getHufId());
        queryByHufId.setRecoveryTime(new Date());
        queryByHufId.setHumanFileStatus(3);
        Integer updateByHufId = humanFileDao.updateByHufId(queryByHufId);
        Integer addHumanFileDig = humanFileDigDao.addHumanFileDig(queryByHufId);
        if (updateByHufId == 1 && addHumanFileDig == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public List<HumanFile> showHumanFileByFisrtIdAndSecId(HumanFile humanFile) {
        List<HumanFile> humanFiles = humanFileDao.querybyFisrtIdAndSecId(humanFile);
        return humanFiles;
    }

    @Override
    public List<HumanFile> showHumanFileBySalaryGrantId(String salaryGrantId) {
        List<HumanFile> humanFiles = humanFileDao.querybySalaryGrantId(salaryGrantId);
        return humanFiles;
    }
}