package com.iotek.service.Impl;

import com.iotek.dao.HumanFileDao;
import com.iotek.dao.SalaryStandardDao;
import com.iotek.dao.SalaryStandardDetailDao;
import com.iotek.entity.HumanFile;
import com.iotek.entity.SalaryStandard;
import com.iotek.entity.SalaryStandardDetail;
import com.iotek.pojo.DataGridResult;
import com.iotek.service.SalaryStandardService;
import com.iotek.util.IdCreaterUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class SalaryStandardServiceImpl implements SalaryStandardService {

    @Autowired
    private SalaryStandardDao salaryStandardDao;
    @Autowired
    private SalaryStandardDetailDao salaryStandardDetailDao;
    @Autowired
    private HumanFileDao humanFileDao;

    @Override
    public Integer addSalaryStandard(SalaryStandard salaryStandard, String[] itemName, Float[] salary) {
        salaryStandard.setRegistTime(new Date());
        salaryStandard.setCheckStatus(0);
        Integer integer = salaryStandardDao.addSalaryStandard(salaryStandard);
        Integer detail = null;
        for (int i = 0; i < itemName.length; i++) {
            SalaryStandardDetail salaryStandardDetail = new SalaryStandardDetail();
            salaryStandardDetail.setStandardId(salaryStandard.getStandardId());
            salaryStandardDetail.setStandardName(salaryStandard.getStandardName());
            salaryStandardDetail.setItemName(itemName[i]);
            salaryStandardDetail.setSalary(salary[i]);
            detail = salaryStandardDetailDao.addSalaryStandardDetail(salaryStandardDetail);
            if (detail != 1) {
                break;
            }
        }
        if (integer == 1 && detail == 1) {
            return 1;
        } else {
            return 2;
        }
    }

    @Override
    public String queryStandardId() {
        SalaryStandard salaryStandard = salaryStandardDao.queryStandardId();
        String standardId = null;
        if (salaryStandard != null) {
            standardId = salaryStandard.getStandardId();
        }

        String head = "SSD";
        standardId = IdCreaterUtil.createrId(standardId, head);
        return standardId;
    }

    @Override
    public List<SalaryStandard> showAllSalaryStandard() {
        List<SalaryStandard> salaryStandards = salaryStandardDao.queryAllList();
        return salaryStandards;
    }

    @Override
    public DataGridResult<SalaryStandard> showSalaryStandardList(Integer page, Integer rows) {
        Integer beginIndex = (page - 1) * rows;
        DataGridResult<SalaryStandard> gridResult = new DataGridResult<>();
        gridResult.setCurrentPage(page);
        gridResult.setTotal(salaryStandardDao.countRows());
        gridResult.setPageCount((salaryStandardDao.countRows() + rows - 1) / rows);
        gridResult.setRows(salaryStandardDao.queryAll(beginIndex, rows));
        return gridResult;
    }

    @Override
    public SalaryStandard querySalaryStandardById(String standardId) {
        SalaryStandard salaryStandard = salaryStandardDao.querySalaryStandardById(standardId);
        return salaryStandard;
    }

    @Override
    public Integer updateSalaryStandard(SalaryStandard salaryStandard, String[] itemName, Float[] salary, Integer[] sdtId) {
        salaryStandard.setCheckStatus(salaryStandard.getCheckStatus());
        System.out.println(salaryStandard);
        HumanFile humanFile = new HumanFile();
        humanFile.setSalarySum(salaryStandard.getSalarySum());
        humanFile.setSalaryStandardId(salaryStandard.getStandardId());
        humanFileDao.updateSalarySum(humanFile);
        Integer update = salaryStandardDao.update(salaryStandard);
        Integer detail = null;
        for (int i = 0; i < itemName.length; i++) {
            SalaryStandardDetail salaryStandardDetail = new SalaryStandardDetail();
            salaryStandardDetail.setSdtId(sdtId[i]);
            salaryStandardDetail.setStandardId(salaryStandard.getStandardId());
            salaryStandardDetail.setStandardName(salaryStandard.getStandardName());
            salaryStandardDetail.setItemName(itemName[i]);
            salaryStandardDetail.setSalary(salary[i]);
            detail = salaryStandardDetailDao.update(salaryStandardDetail);
            if (detail != 1) {
                break;
            }
        }
        if (update == 1 && detail == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public Integer uncompleted(SalaryStandard salaryStandard) {
        salaryStandard.setCheckStatus(-1);
        System.out.println(salaryStandard);
        Integer update = salaryStandardDao.update(salaryStandard);
        return update;
    }

    @Override
    public DataGridResult<SalaryStandard> searchSalaryStandard(String standardId, String keyword, Date beginTime, Date endTime, Integer page, Integer rows) {
        Integer beginIndex = (page - 1) * rows;
        DataGridResult<SalaryStandard> gridResult = new DataGridResult<>();
        gridResult.setCurrentPage(page);
        gridResult.setTotal(salaryStandardDao.countRowsByCondition(standardId, keyword, beginTime, endTime));
        gridResult.setPageCount((salaryStandardDao.countRowsByCondition(standardId, keyword, beginTime, endTime) + rows - 1) / rows);
        gridResult.setRows(salaryStandardDao.queryByCondition(standardId, keyword, beginTime, endTime, beginIndex, rows));
        return gridResult;
    }


}