package com.iotek.service.Impl;

import com.iotek.dao.*;
import com.iotek.entity.HumanFile;
import com.iotek.entity.MajorChange;
import com.iotek.entity.SalaryStandard;
import com.iotek.pojo.DataGridResult;
import com.iotek.service.MajorChangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;


@Service
public class MajorChangeServiceImpl implements MajorChangeService {
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
    @Autowired
    private MajorChangeDao majorChangeDao;
    @Autowired
    private HumanFileDao humanFileDao;
    @Autowired
    private HumanFileDigDao humanFileDigDao;

    @Override
    public Integer addMajorChange(MajorChange majorChange) {
        Integer firstKindId = majorChange.getNewFirstKindId();
        Integer secondKindId = majorChange.getNewSecondKindId();
        Integer thirdKindId = majorChange.getNewThirdKindId();
        Integer humanMajorKindId = majorChange.getNewMajorKindId();
        Integer humanMajorId = majorChange.getNewMajorId();
        String salaryStandardId = majorChange.getNewSalaryStandardId();

        String firstKindName = configFileFirstKindDao.queryByFirstId(firstKindId).getFirstKindName();
        String secondKindName = configFileSecondKindDao.queryByFirstIdAndSecondId(firstKindId, secondKindId).getSecondKindName();
        String thirdKindName = configFileThirdKindDao.queryByThirdId(firstKindId, secondKindId, thirdKindId).getThirdKindName();
        String majorKindName = configMajorKindDao.queryById(humanMajorKindId).getMajorKindName();
        String majorName = configMajorDao.queryByKindIdAndId(humanMajorKindId, humanMajorId).getMajorName();
        SalaryStandard salaryStandard = salaryStandardDao.querySalaryStandardById(salaryStandardId);
        majorChange.setNewFirstKindName(firstKindName);
        majorChange.setNewSecondKindName(secondKindName);
        majorChange.setNewThirdKindName(thirdKindName);
        majorChange.setNewMajorKindName(majorKindName);
        majorChange.setNewMajorName(majorName);
        majorChange.setNewSalaryStandardName(salaryStandard.getStandardName());
        majorChange.setNewSalarySum(salaryStandard.getSalarySum());

        majorChange.setCheckStatus(0);
        majorChange.setRegistTime(new Date());

        Integer integer = majorChangeDao.addMajorChangeDao(majorChange);
        return integer;
    }

    @Override
    public DataGridResult<MajorChange> showAllMajorChange(Integer page, Integer rows) {
        Integer beginIndex = (page - 1) * rows;
        DataGridResult<MajorChange> gridResult = new DataGridResult<>();
        gridResult.setCurrentPage(page);
        gridResult.setTotal(majorChangeDao.countRows());
        gridResult.setPageCount((majorChangeDao.countRows() + rows - 1) / rows);
        gridResult.setRows(majorChangeDao.queryAll(beginIndex, rows));
        return gridResult;
    }

    @Override
    public MajorChange showMajorChange(Integer mchId) {
        MajorChange majorChange = majorChangeDao.queryById(mchId);
        return majorChange;
    }

    @Override
    public Integer updateMajorChange(MajorChange newMajorChange) {
        Integer result = 0;

        Integer firstKindId = newMajorChange.getNewFirstKindId();
        Integer secondKindId = newMajorChange.getNewSecondKindId();
        Integer thirdKindId = newMajorChange.getNewThirdKindId();
        Integer humanMajorKindId = newMajorChange.getNewMajorKindId();
        Integer humanMajorId = newMajorChange.getNewMajorId();
        String salaryStandardId = newMajorChange.getNewSalaryStandardId();
        String humanId = newMajorChange.getHumanId();

        String firstKindName = configFileFirstKindDao.queryByFirstId(firstKindId).getFirstKindName();
        String secondKindName = configFileSecondKindDao.queryByFirstIdAndSecondId(firstKindId, secondKindId).getSecondKindName();
        String thirdKindName = configFileThirdKindDao.queryByThirdId(firstKindId, secondKindId, thirdKindId).getThirdKindName();
        String majorKindName = configMajorKindDao.queryById(humanMajorKindId).getMajorKindName();
        String majorName = configMajorDao.queryByKindIdAndId(humanMajorKindId, humanMajorId).getMajorName();
        SalaryStandard salaryStandard = salaryStandardDao.querySalaryStandardById(salaryStandardId);

        newMajorChange.setNewFirstKindName(firstKindName);
        newMajorChange.setNewSecondKindName(secondKindName);
        newMajorChange.setNewThirdKindName(thirdKindName);
        newMajorChange.setNewMajorKindName(majorKindName);
        newMajorChange.setNewMajorName(majorName);
        newMajorChange.setNewSalaryStandardName(salaryStandard.getStandardName());
        newMajorChange.setNewSalarySum(salaryStandard.getSalarySum());
        newMajorChange.setCheckTime(new Date());
        //更新majorChange 状态改为通过
        result = majorChangeDao.updateMajorChange(newMajorChange);

        if (newMajorChange.getCheckStatus()==1){
            HumanFile oldHumanFile = humanFileDao.queryByHumanId(humanId);
            oldHumanFile.setFirstKindId(firstKindId);
            oldHumanFile.setFirstKindName(firstKindName);
            oldHumanFile.setSecondKindId(secondKindId);
            oldHumanFile.setSecondKindName(secondKindName);
            oldHumanFile.setThirdKindId(thirdKindId);
            oldHumanFile.setThirdKindName(thirdKindName);
            oldHumanFile.setHumanMajorKindId(humanMajorKindId);
            oldHumanFile.setHumanMajorKindName(majorKindName);
            oldHumanFile.setHumanMajorId(humanMajorId);
            oldHumanFile.setHunmaMajorName(majorName);
            oldHumanFile.setSalaryStandardId(salaryStandardId);
            oldHumanFile.setSalaryStandardName(salaryStandard.getStandardName());
            oldHumanFile.setSalarySum(salaryStandard.getSalarySum());
            //更新humanFile
            result = humanFileDao.updateByHufId(oldHumanFile);
            if (result==1){
                //将humanFile记录状态 修改为4：职位调动
                oldHumanFile.setCheckStatus(4);
                //添加humanFileDig记录
                result = humanFileDigDao.addHumanFileDig(oldHumanFile);
            }
        }
        return result;
    }


}