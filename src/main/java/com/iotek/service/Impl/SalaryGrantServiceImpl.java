package com.iotek.service.Impl;

import com.iotek.dao.HumanFileDao;
import com.iotek.dao.SalaryGrantDao;
import com.iotek.dao.SalaryGrantDetailDao;
import com.iotek.dao.SalaryStandardDao;
import com.iotek.entity.HumanFile;
import com.iotek.entity.SalaryGrant;
import com.iotek.entity.SalaryGrantDetail;
import com.iotek.pojo.DataGridResult;
import com.iotek.pojo.SalaryGrantPojo;
import com.iotek.service.SalaryGrantService;
import com.iotek.util.IdCreaterUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class SalaryGrantServiceImpl implements SalaryGrantService {
    @Autowired
    private HumanFileDao humanFileDao;
    @Autowired
    private SalaryGrantDao salaryGrantDao;
    @Autowired
    private SalaryGrantDetailDao salaryGrantDetailDao;

    @Override
    public SalaryGrantPojo createSalaryGrant() {
        SalaryGrantPojo salaryGrantPojo = new SalaryGrantPojo();
        //1.生成salaryGrantId
        //查询最后一条记录salaryGrantId
        SalaryGrant oldSalaryGrant = salaryGrantDao.querySalaryGrantId();
        String salaryGrantId = null;
        if (oldSalaryGrant != null) {
            salaryGrantId = oldSalaryGrant.getSalaryGrantId();
        }
        String head = "SGR";
        salaryGrantId = IdCreaterUtil.createrId(salaryGrantId, head);
        salaryGrantPojo.setSalaryGrantId(salaryGrantId);
        //2.生成内容
        List<HumanFile> query = humanFileDao.query();
        salaryGrantPojo.setHumanFiles(query);
        return salaryGrantPojo;
    }

    @Override
    public SalaryGrant queryLast(String firstKindName, String secondKindName) {
        SalaryGrant last = salaryGrantDao.queryLast(firstKindName, secondKindName);
        return last;
    }


    @Override
    public Integer queryAllCount() {
        Integer integer = salaryGrantDao.queryAllCount();
        return integer;
    }

    @Override
    public Integer addSalaryGrantDetail(SalaryGrantDetail salaryGrantDetail) {
        Float salaryStandardSum = salaryGrantDetail.getSalaryStandardSum();
        Float bounsSum = salaryGrantDetail.getBounsSum();
        Float saleSum = salaryGrantDetail.getSaleSum();
        Float deductSum = salaryGrantDetail.getDeductSum();
        salaryGrantDetail.setSalaryPaidSum(salaryStandardSum + bounsSum + saleSum - deductSum);
        Integer integer = salaryGrantDetailDao.addSalaryGrantDetail(salaryGrantDetail);
        return integer;
    }

    @Override
    public Integer updateSalaryGrantDetailById(SalaryGrantDetail salaryGrantDetail) {
        Float salaryStandardSum = salaryGrantDetail.getSalaryStandardSum();
        Float bounsSum = salaryGrantDetail.getBounsSum();
        Float saleSum = salaryGrantDetail.getSaleSum();
        Float deductSum = salaryGrantDetail.getDeductSum();
        salaryGrantDetail.setSalaryPaidSum(salaryStandardSum + bounsSum + saleSum - deductSum);
        Integer update = salaryGrantDetailDao.update(salaryGrantDetail);
        return update;
    }

    @Override
    public SalaryGrantDetail querySalaryGrantDetailByHumanId(String humanId) {
        SalaryGrantDetail salaryGrantDetail = salaryGrantDetailDao.queryByHumanId(humanId);
        return salaryGrantDetail;
    }


    @Override
    public Integer queryPaidSum(String salaryGrantId) {
        Integer integer = salaryGrantDetailDao.queryPaidSum(salaryGrantId);
        System.out.println(integer);
        return integer;
    }

    @Override
    public Integer addSalaryGrant(SalaryGrant salaryGrant, List<SalaryGrantDetail> salaryGrantDetails) {
        salaryGrant.setCheckStatus(0);
        salaryGrant.setRegistTime(new Date());
        Integer result = 0;
        SalaryGrant queryBySalaryGrantId = salaryGrantDao.queryBySalaryGrantId(salaryGrant);
        if (queryBySalaryGrantId == null) {
            result = salaryGrantDao.add(salaryGrant);
        } else {
            salaryGrant.setSgrId(queryBySalaryGrantId.getSgrId());
            result = salaryGrantDao.update(salaryGrant);
        }
        String salaryGrantId = salaryGrant.getSalaryGrantId();
        List<SalaryGrantDetail> s = salaryGrantDetailDao.queryBySalaryGrantId(salaryGrantId);

        for (SalaryGrantDetail salaryGrantDetail : salaryGrantDetails) {
            if (s.size() > 0) {
                result = updateSalaryGrantDetailById(salaryGrantDetail);
            } else {
                result = addSalaryGrantDetail(salaryGrantDetail);
            }

            if (result != 1) {
                break;
            }
        }
        return result;
    }

    @Override
    public DataGridResult<SalaryGrant> queryAll(Integer page, Integer rows) {
        Integer beginIndex = (page - 1) * rows;
        DataGridResult<SalaryGrant> gridResult = new DataGridResult<>();
        gridResult.setCurrentPage(page);
        gridResult.setTotal(salaryGrantDao.countRows());
        gridResult.setPageCount((salaryGrantDao.countRows() + rows - 1) / rows);
        gridResult.setRows(salaryGrantDao.queryALLSalaryGrant(beginIndex, rows));
        return gridResult;

    }

    @Override
    public Integer updateSalaryGrant(SalaryGrant salaryGrant, List<SalaryGrantDetail> salaryGrantDetails) {
        salaryGrant.setCheckTime(new Date());
        Integer result = 0;
        result = salaryGrantDao.update(salaryGrant);
        for (SalaryGrantDetail salaryGrantDetail : salaryGrantDetails) {
            result = updateSalaryGrantDetailById(salaryGrantDetail);
            if (result != 1) {
                break;
            }
        }
        return result;
    }

    @Override
    public SalaryGrant queryBySalaryGrantId(String salaryGrantId) {
        SalaryGrant salaryGrant = new SalaryGrant();
        salaryGrant.setSalaryGrantId(salaryGrantId);
        SalaryGrant queryBySalaryGrantId = salaryGrantDao.queryBySalaryGrantId(salaryGrant);
        return queryBySalaryGrantId;
    }

    @Override
    public DataGridResult<SalaryGrant> searchSalaryGrant(String salaryGrantId, String keyword, Date beginTime, Date endTime, Integer page, Integer rows) {
        Integer beginIndex = (page - 1) * rows;
        DataGridResult<SalaryGrant> gridResult = new DataGridResult<>();
        gridResult.setCurrentPage(page);
        gridResult.setTotal(salaryGrantDao.countRowsByCondition(salaryGrantId, keyword, beginTime, endTime));
        gridResult.setPageCount((salaryGrantDao.countRowsByCondition(salaryGrantId, keyword, beginTime, endTime) + rows - 1) / rows);
        gridResult.setRows(salaryGrantDao.queryByCondition(salaryGrantId, keyword, beginTime, endTime, beginIndex, rows));
        return gridResult;
    }


}