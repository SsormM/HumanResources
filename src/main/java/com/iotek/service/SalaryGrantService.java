package com.iotek.service;
import com.iotek.entity.SalaryGrant;
import com.iotek.entity.SalaryGrantDetail;
import com.iotek.pojo.DataGridResult;
import com.iotek.pojo.SalaryGrantPojo;

import java.util.Date;
import java.util.List;

public interface SalaryGrantService {

    public abstract SalaryGrantPojo createSalaryGrant();

    public abstract SalaryGrant queryLast(String firstKindName, String secondKindName);

    public abstract Integer queryAllCount();

    public abstract Integer addSalaryGrantDetail(SalaryGrantDetail salaryGrantDetail);

    public abstract SalaryGrantDetail querySalaryGrantDetailByHumanId(String humanId);

    public abstract Integer updateSalaryGrantDetailById(SalaryGrantDetail salaryGrantDetail);

    public abstract Integer queryPaidSum(String salaryGrantId);

    public abstract Integer addSalaryGrant(SalaryGrant salaryGrant,List<SalaryGrantDetail> salaryGrantDetails);

    public abstract DataGridResult<SalaryGrant> queryAll(Integer page, Integer rows);

    public abstract Integer updateSalaryGrant(SalaryGrant salaryGrant, List<SalaryGrantDetail> salaryGrantDetails);

    public abstract SalaryGrant queryBySalaryGrantId(String salaryGrantId);

    public abstract DataGridResult<SalaryGrant> searchSalaryGrant(String salaryGrantId, String keyword, Date beginTime, Date endTime, Integer page, Integer rows);

}