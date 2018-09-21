package com.iotek.service.Impl;

import com.iotek.dao.SalaryStandardDetailDao;
import com.iotek.entity.SalaryStandardDetail;
import com.iotek.service.SalaryStandardDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SalaryStandardDetailServiceImpl implements SalaryStandardDetailService {

    @Autowired
    private SalaryStandardDetailDao salaryStandardDetailDao;

    @Override
    public List<SalaryStandardDetail> querySalaryStandardDetailById(String standardId) {
        List<SalaryStandardDetail> salaryStandardDetails = salaryStandardDetailDao.querySalaryStandardDetailById(standardId);
        return salaryStandardDetails;
    }
}