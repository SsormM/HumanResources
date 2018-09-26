package com.iotek.controller;

import com.iotek.dao.HumanFileDao;
import com.iotek.entity.HumanFile;
import com.iotek.pojo.DataGridResult;
import com.iotek.service.HumanFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Date;


@Controller
public class HumanFileController {

    @Autowired
    private HumanFileService humanFileService;


    @RequestMapping("/register")
    public @ResponseBody
    Integer register(HumanFile humanFile,HttpServletResponse response) {
        System.out.println("----register----");
        System.out.println("humanFile:" + humanFile);

        Integer register = humanFileService.register(humanFile);

        System.out.println("----register----");

        return register;
    }


    @RequestMapping("/HumanResourceList")
    public @ResponseBody
    DataGridResult<HumanFile>
    HumanResourceList(Integer page, Integer rows) {
        System.out.println("page"+page);
        System.out.println("rows"+rows);
        DataGridResult<HumanFile> gridResult = humanFileService.showAllHumanFile(page, rows);
        return gridResult;
    }

    @RequestMapping("/search")
    public @ResponseBody
    DataGridResult<HumanFile>
    search(HumanFile humanFile, Integer page, Integer rows, Date beginTime ,Date endTime) {
        System.out.println("page"+page);
        System.out.println("rows"+rows);
        System.out.println("beginTime"+beginTime);
        System.out.println("endTime"+endTime);
        System.out.println(humanFile);

        DataGridResult<HumanFile> gridResult = humanFileService.search(humanFile,page, rows,beginTime,endTime);
        return gridResult;
    }
    @RequestMapping("/showHumanResource")
    public String showHumanResource(Integer hufId, String target, ModelMap modelMap) {
        System.out.println("hufId:" + hufId);
        HumanFile humanFile = humanFileService.showHumanFileByHufId(hufId);
        System.out.println(humanFile);
        modelMap.addAttribute("humanFile", humanFile);
        return "view/" + target;
    }

    @RequestMapping("/complete")
    public String complete(HumanFile humanFile, String checker,ModelMap modelMap) {
        System.out.println("----complete----");
        System.out.println("HumanFile:" + humanFile);
        Integer result = humanFileService.complete(humanFile, checker);
        System.out.println("----complete----");
        if (result>0){
            modelMap.addAttribute("mess","¸´ºË³É¹¦");
        }else {
            modelMap.addAttribute("mess","¸´ºËÊ§°Ü");
        }
        return "view/HumanResource/list_human_resource";
    }

    @RequestMapping("/uncomplete")
    public String uncomplete(Integer hufId) {
        System.out.println("----uncomplete----");
        System.out.println("hufId:" + hufId);
        humanFileService.uncomplete(hufId, -1);
        System.out.println("----uncomplete----");
        return "view/HumanResource/list_human_resource";
    }

    @RequestMapping("/update_human_resource")
    public String update(HumanFile humanFile,String changer,ModelMap modelMap) {
        System.out.println("----update_human_resource----");
        System.out.println("humanFile:" + humanFile);
        System.out.println("changer:"+changer);
        Integer update = humanFileService.update(humanFile, changer);
        if (update>0){
            modelMap.addAttribute("mess","ÐÞ¸Ä³É¹¦");
        }else {
            modelMap.addAttribute("mess","ÐÞ¸ÄÊ§°Ü");
        }
        System.out.println("----update_human_resource----");
        return "view/HumanResource/select_human_resource";
    }

    @RequestMapping("/delete_human_resource")
    public String delete(HumanFile humanFile,ModelMap modelMap) {
        System.out.println("----delete_human_resource----");
        System.out.println("humanFile:" + humanFile);
        Integer delete = humanFileService.delete(humanFile);
        if (delete>0){
            modelMap.addAttribute("mess","É¾³ý³É¹¦");
        }else {
            modelMap.addAttribute("mess","É¾³ýÊ§°Ü");
        }
        System.out.println("----delete_human_resource----");
        return "view/HumanResource/select_human_resource";
    }

    @RequestMapping("/recovery_human_resource")
    public String recovery(HumanFile humanFile,ModelMap modelMap) {
        System.out.println("----recovery_human_resource----");
        System.out.println("humanFile:" + humanFile);
        Integer recovery = humanFileService.recovery(humanFile);
        if (recovery>0){
            modelMap.addAttribute("mess","»Ö¸´³É¹¦");
        }else {
            modelMap.addAttribute("mess","»Ö¸´Ê§°Ü");
        }
        System.out.println("----recovery_human_resource----");
        return "view/HumanResource/deleted_human_resource";
    }

}