package com.iotek.controller;

import com.iotek.entity.HumanFile;
import com.iotek.entity.SalaryGrant;
import com.iotek.entity.SalaryGrantDetail;
import com.iotek.pojo.DataGridResult;
import com.iotek.pojo.SalaryGrantDetailPojo;
import com.iotek.pojo.SalaryGrantPojo;
import com.iotek.service.HumanFileService;
import com.iotek.service.SalaryGrantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.Date;
import java.util.List;


@Controller
@SessionAttributes({"salaryGrant", "salaryCount"})
public class SalaryGrantController {
    @Autowired
    private SalaryGrantService salaryGrantService;
    @Autowired
    private HumanFileService humanFileService;

    @RequestMapping("/createSalaryGrant")
    public String createSalaryGrant(ModelMap modelMap) {
        System.out.println("----createSalaryGrant----");

        //搜索salaryGrant记录数量
        Integer integer = salaryGrantService.queryAllCount();
        if (integer != null) {
            modelMap.addAttribute("salaryCount", integer);
        } else {
            modelMap.addAttribute("salaryCount", 0);
        }
        //生成salaryGrant记录
        SalaryGrantPojo salaryGrant = salaryGrantService.createSalaryGrant();
        if (salaryGrant != null) {
            modelMap.addAttribute("salaryGrant", salaryGrant);
        }
        //搜索实际支付总和
        Integer paidSum = salaryGrantService.queryPaidSum(salaryGrant.getSalaryGrantId());
        if (paidSum != null) {
            modelMap.addAttribute("salaryPaidSum", paidSum);
        } else {
            modelMap.addAttribute("salaryPaidSum", 0.0);
        }
        System.out.println("----createSalaryGrant----");
        return "view/SalaryGrant/list_salary_grand";
    }

    @RequestMapping("/showSalaryGrantDetails")
    public String showSalaryGrantDetails(HumanFile humanFile, ModelMap modelMap) {
        System.out.println("----showSalaryGrantDetails----");
        System.out.println(humanFile);
        List<HumanFile> humanFiles = humanFileService.showHumanFileByFisrtIdAndSecId(humanFile);
        int size = humanFiles.size();

        modelMap.addAttribute("size", size);
        modelMap.addAttribute("humanFiles", humanFiles);
        modelMap.addAttribute("firstKindName", humanFile.getFirstKindName());
        modelMap.addAttribute("secondKindName", humanFile.getSecondKindName());
        SalaryGrant last = salaryGrantService.queryLast(humanFile.getFirstKindName(),humanFile.getSecondKindName());
        if (last != null) {
            modelMap.addAttribute("salaryGrantLast", last);
        }
        System.out.println("----showSalaryGrantDetails----");
        return "view/SalaryGrant/list_salary_grand_details";
    }

    @RequestMapping("/addSalaryGrantDetail")
    public String addSalaryGrantDetail(SalaryGrantDetailPojo salaryGrantDetailPojo, ModelMap modelMap) {
        System.out.println("----addSalaryGrantDetail----");

        SalaryGrant salaryGrant = salaryGrantDetailPojo.getSalaryGrant();

        System.out.println(salaryGrant);


        List<SalaryGrantDetail> salaryGrantDetails = salaryGrantDetailPojo.getSalaryGrantDetails();

        Integer integer = salaryGrantService.addSalaryGrant(salaryGrant, salaryGrantDetails);

        System.out.println("----addSalaryGrantDetail----");
        return "forward:/createSalaryGrant";
    }

    @RequestMapping("/showCheckListSalaryGrant")
    public @ResponseBody
    DataGridResult<SalaryGrant>
    showCheckListSalaryGrant(Integer page, Integer rows) {
        System.out.println("----showCheckList----");
        DataGridResult<SalaryGrant> salaryGrantDataGridResult = salaryGrantService.queryAll(page, rows);
        System.out.println("----showCheckList----");
        return salaryGrantDataGridResult;
    }

    @RequestMapping("/showSalaryGrantDetailsBySalaryGrantId")
    public String showSalaryGrantDetailsBySalaryGrantId(String salaryGrantId,String target, ModelMap modelMap) {
        System.out.println("----showSalaryGrantDetailsBySalaryGrantId----");
        System.out.println(salaryGrantId);
        List<HumanFile> humanFiles = humanFileService.showHumanFileBySalaryGrantId(salaryGrantId);
        modelMap.addAttribute("humanFiles", humanFiles);
        modelMap.addAttribute("salaryGrantId", salaryGrantId);
        modelMap.addAttribute("size", humanFiles.size());

        Integer paidSum = salaryGrantService.queryPaidSum(salaryGrantId);
        if (paidSum != null) {
            modelMap.addAttribute("salaryPaidSum", paidSum);
        } else {
            modelMap.addAttribute("salaryPaidSum", 0.0);
        }

        SalaryGrant queryBySalaryGrantId = salaryGrantService.queryBySalaryGrantId(salaryGrantId);
        modelMap.addAttribute("sgrId", queryBySalaryGrantId.getSgrId());
        modelMap.addAttribute("register", queryBySalaryGrantId.getRegister());
        modelMap.addAttribute("checkTime", queryBySalaryGrantId.getCheckTime());
        modelMap.addAttribute("firstKindName", queryBySalaryGrantId.getFirstKindName());
        modelMap.addAttribute("secondKindName",queryBySalaryGrantId.getSecondKindName());
        SalaryGrant last = salaryGrantService.queryLast(queryBySalaryGrantId.getFirstKindName(),
                                                        queryBySalaryGrantId.getSecondKindName());

        System.out.println(last);
        if (last != null) {
            modelMap.addAttribute("salaryGrantLast", last);
        }
        System.out.println("----showSalaryGrantDetailsBySalaryGrantId----");
        return "view/SalaryGrant/"+target;
    }

    @RequestMapping("/completeSalaryGrant")
    public String completeSalaryGrant(SalaryGrantDetailPojo salaryGrantDetailPojo, ModelMap modelMap) {
        System.out.println("----completeSalaryGrant----");

        SalaryGrant salaryGrant = salaryGrantDetailPojo.getSalaryGrant();
        salaryGrant.setCheckStatus(1);
        System.out.println(salaryGrant);


        List<SalaryGrantDetail> salaryGrantDetails = salaryGrantDetailPojo.getSalaryGrantDetails();

        Integer integer = salaryGrantService.updateSalaryGrant(salaryGrant, salaryGrantDetails);

        System.out.println("----completeSalaryGrant----");
        return "view/SalaryGrant/check_list_salary_grand";
    }

    @RequestMapping("/uncompleteSalaryGrant")
    public String uncompleteSalaryGrant(SalaryGrantDetailPojo salaryGrantDetailPojo, ModelMap modelMap) {
        System.out.println("----uncompleteSalaryGrant----");

        SalaryGrant salaryGrant = salaryGrantDetailPojo.getSalaryGrant();
        salaryGrant.setCheckStatus(-1);
        System.out.println(salaryGrant);


        List<SalaryGrantDetail> salaryGrantDetails = salaryGrantDetailPojo.getSalaryGrantDetails();

        Integer integer = salaryGrantService.updateSalaryGrant(salaryGrant, salaryGrantDetails);

        System.out.println("----uncompleteSalaryGrant----");
        return "view/SalaryGrant/check_list_salary_grand";
    }

    @RequestMapping("/searchSalaryGrant")
    public @ResponseBody
    DataGridResult<SalaryGrant> searchSalaryStandard(String salaryGrantId, String keyword, Date beginTime, Date endTime,
                                                        Integer page, Integer rows) {
        System.out.println("----searchSalaryGrant----");
        System.out.println("salaryGrantId：" + salaryGrantId);
        System.out.println("keyword：" + keyword);
        System.out.println("beginTime：" + beginTime);
        System.out.println("endTime：" + endTime);
        System.out.println("page：" + page);
        System.out.println("rows：" + rows);
        DataGridResult<SalaryGrant> gridResult = salaryGrantService.searchSalaryGrant(salaryGrantId, keyword, beginTime, endTime, page, rows);
        System.out.println("----searchSalaryGrant----");
        return gridResult;
    }
}