package com.iotek.controller;

import com.iotek.entity.ConfigMajor;
import com.iotek.service.ConfigMajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ConfigMajorController {
    @Autowired
    private ConfigMajorService configMajorService;

    @RequestMapping("/showConfigMajor")
    public @ResponseBody
    List<ConfigMajor> showConfigMajor(){
        System.out.println("----showConfigMajor----");
        List<ConfigMajor> configMajors = configMajorService.showConfigMajorById(1);
        for (ConfigMajor configMajor : configMajors) {
            System.out.println(configMajor);
        }
        System.out.println("----showConfigMajor----");
        return configMajors;
    }


    @RequestMapping("/showConfigMajorById")
    public @ResponseBody
    List<ConfigMajor> showConfigMajorById(Integer kindId){
        System.out.println("----showConfigMajorById----");
        System.out.println("kindId:"+kindId);
        List<ConfigMajor> configMajors = configMajorService.showConfigMajorById(kindId);
        for (ConfigMajor configMajor : configMajors) {
            System.out.println(configMajor);
        }
        System.out.println("----showConfigMajorById----");
        return configMajors;
    }
}