package com.iotek.controller;

import com.iotek.entity.ConfigMajorKind;
import com.iotek.service.ConfigMajorKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ConfigMajorKindController {
    @Autowired
    private ConfigMajorKindService configMajorKindService;

    @RequestMapping("/showAllMajorKind")
    public @ResponseBody
    List<ConfigMajorKind> showAllMajorKind(){
        System.out.println("----showAllMajorKind----");
        List<ConfigMajorKind> configMajorKinds = configMajorKindService.showAllMajorKind();
        for (ConfigMajorKind configMajorKind : configMajorKinds) {
            System.out.println(configMajorKind);
        }
        System.out.println("----showAllMajorKind----");
        return configMajorKinds;
    }
}