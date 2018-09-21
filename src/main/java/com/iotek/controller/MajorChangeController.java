package com.iotek.controller;

import com.iotek.entity.MajorChange;
import com.iotek.pojo.DataGridResult;
import com.iotek.service.MajorChangeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MajorChangeController {
    @Autowired
    private MajorChangeService majorChangeService;

    @RequestMapping("/addMajorChange")
    public String addMajorChange(MajorChange majorChange, ModelMap modelMap){
        System.out.println("----addMajorChange----");
        System.out.println(majorChange);
        Integer integer = majorChangeService.addMajorChange(majorChange);

        System.out.println("----addMajorChange----");
        return "view/MajorChange/search_human_resource";

    }

    @RequestMapping("/showCheckMajorChange")
    public @ResponseBody
    DataGridResult<MajorChange>
    HumanResourceList(Integer page, Integer rows) {
        System.out.println("page"+page);
        System.out.println("rows"+rows);
        DataGridResult<MajorChange> gridResult = majorChangeService.showAllMajorChange(page, rows);
        return gridResult;
    }

    @RequestMapping("/showMajorChangeById")
    public String showMajorChangeById(Integer mchId, ModelMap modelMap) {
        System.out.println("----showMajorChangeById----");
        System.out.println(mchId);
        MajorChange majorChange = majorChangeService.showMajorChange(mchId);
        modelMap.addAttribute("majorChange", majorChange);

        System.out.println("----showMajorChangeById----");
        return "view/MajorChange/check_major_change";

    }

    @RequestMapping("/completeMajorChange")
    public String completeMajorChange(MajorChange newMajorChange, ModelMap modelMap){
        System.out.println("----completeMajorChange----");
        System.out.println(newMajorChange);
        newMajorChange.setCheckStatus(1);
        majorChangeService.updateMajorChange(newMajorChange);

        System.out.println("----completeMajorChange----");
        return "view/MajorChange/check_list_major_change";

    }

    @RequestMapping("/uncompleteMajorChange")
    public String uncompleteMajorChange(MajorChange newMajorChange, ModelMap modelMap){
        System.out.println("----uncompleteMajorChange----");
        System.out.println(newMajorChange);
        newMajorChange.setCheckStatus(-1);
        majorChangeService.updateMajorChange(newMajorChange);

        System.out.println("----uncompleteMajorChange----");
        return "view/MajorChange/check_list_major_change";

    }
}