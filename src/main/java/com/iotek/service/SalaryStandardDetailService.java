package com.iotek.service;

import com.iotek.entity.SalaryStandardDetail;

import java.util.List;

public interface SalaryStandardDetailService {
    public abstract List<SalaryStandardDetail> querySalaryStandardDetailById(String standardId);


}
