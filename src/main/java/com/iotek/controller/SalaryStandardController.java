package com.iotek.controller;

import com.iotek.dao.SalaryStandardDetailDao;
import com.iotek.entity.SalaryStandard;
import com.iotek.entity.SalaryStandardDetail;
import com.iotek.entity.User;
import com.iotek.pojo.DataGridResult;
import com.iotek.service.SalaryStandardDetailService;
import com.iotek.service.SalaryStandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes("user")
public class SalaryStandardController {
    @Autowired
    private SalaryStandardService salaryStandardService;
    @Autowired
    private SalaryStandardDetailService salaryStandardDetailService;

    @RequestMapping("/addSalaryStandard")
    public String addSalaryStandard(SalaryStandard salaryStandard,
                                    String[] itemName, Float[] salary,
                                    ModelMap modelMap) {
        System.out.println("----addSalaryStandard----");
        System.out.println(salaryStandard);
        for (String s : itemName) {
            System.out.println(s);
        }
        for (Float aFloat : salary) {
            System.out.println(aFloat);
        }
        salaryStandardService.addSalaryStandard(salaryStandard, itemName, salary);

        System.out.println("----addSalaryStandard----");
        return "view/SalaryStandard/add_salary_standard";
    }

    @RequestMapping("/createStandardId")
    public @ResponseBody
    String createStandardId() {
        System.out.println("----createStandardId----");
        String s = salaryStandardService.queryStandardId();
        System.out.println(s);
        System.out.println("----createStandardId----");
        return s;
    }

    @RequestMapping("/showAllSalaryStandard")
    public @ResponseBody
    List<SalaryStandard> showAllSalaryStandard() {
        System.out.println("----showAllSalaryStandard----");
        List<SalaryStandard> salaryStandards = salaryStandardService.showAllSalaryStandard();
        for (SalaryStandard salaryStandard : salaryStandards) {
            System.out.println(salaryStandard);
        }
        System.out.println("----showAllSalaryStandard----");
        return salaryStandards;
    }

    @RequestMapping("/salaryStandardList")
    public @ResponseBody
    DataGridResult<SalaryStandard> salaryStandardList(Integer page, Integer rows) {
        System.out.println("----salaryStandardList----");
        System.out.println("page" + page);
        System.out.println("rows" + rows);
        DataGridResult<SalaryStandard> gridResult = salaryStandardService.showSalaryStandardList(page, rows);
        System.out.println("----salaryStandardList----");
        return gridResult;
    }

    @RequestMapping("/showSalaryStandard")
    public String showHumanResource(String standardId, String target, ModelMap modelMap) {
        System.out.println("----showSalaryStandard----");
        System.out.println("standardId:" + standardId);
        System.out.println("target:" + target);
        SalaryStandard salaryStandard = salaryStandardService.querySalaryStandardById(standardId);
        List<SalaryStandardDetail> salaryStandardDetails = salaryStandardDetailService.querySalaryStandardDetailById(standardId);
        modelMap.addAttribute("salaryStandard", salaryStandard);
        modelMap.addAttribute("salaryStandardDetails", salaryStandardDetails);
        System.out.println("----showSalaryStandard----");
        return "view/SalaryStandard/" + target;
    }

    @RequestMapping("/completeSalaryStandard")
    public String complete(SalaryStandard salaryStandard, String[] itemName, Float[] salary, Integer[] sdtId) {
        System.out.println("----completeSalaryStandard----");
        System.out.println("salaryStandard:" + salaryStandard);
        salaryStandard.setCheckStatus(1);
        salaryStandard.setCheckTime(new Date());
        salaryStandard.setChangeStatus(0);
        Integer result = salaryStandardService.updateSalaryStandard(salaryStandard, itemName, salary, sdtId);
        System.out.println("----completeSalaryStandard----");
        return "view/SalaryStandard/list_salary_standard";
    }

    @RequestMapping("/uncompleteSalaryStandard")
    public String uncomplete(SalaryStandard salaryStandard) {
        System.out.println("----uncompleteSalaryStandard----");
        System.out.println("salaryStandard:" + salaryStandard);
        Integer result = salaryStandardService.uncompleted(salaryStandard);
        System.out.println("----uncompleteSalaryStandard----");
        return "view/SalaryStandard/list_salary_standard";
    }

    @RequestMapping("/searchSalaryStandard")
    public @ResponseBody
    DataGridResult<SalaryStandard> searchSalaryStandard(String standardId, String keyword, Date beginTime, Date endTime,
                                                        Integer page, Integer rows) {
        System.out.println("----searchSalaryStandard----");
        System.out.println("standardId：" + standardId);
        System.out.println("keyword：" + keyword);
        System.out.println("beginTime：" + beginTime);
        System.out.println("endTime：" + endTime);
        System.out.println("page：" + page);
        System.out.println("rows：" + rows);
        DataGridResult<SalaryStandard> gridResult = salaryStandardService.searchSalaryStandard(standardId, keyword, beginTime, endTime, page, rows);
        System.out.println("----searchSalaryStandard----");
        return gridResult;
    }

    @RequestMapping("/updateSalaryStandard")
    public String updateSalaryStandard(SalaryStandard salaryStandard, String[] itemName, Float[] salary, Integer[] sdtId) {
        System.out.println("----updateSalaryStandard----");
        System.out.println("salaryStandard:" + salaryStandard);
        salaryStandard.setCheckStatus(0);
        salaryStandard.setChangeTime(new Date());
        salaryStandard.setChangeStatus(1);
        Integer result = salaryStandardService.updateSalaryStandard(salaryStandard, itemName, salary, sdtId);
        System.out.println("----updateSalaryStandard----");
        return "view/SalaryStandard/select_salary_standard";
    }

}