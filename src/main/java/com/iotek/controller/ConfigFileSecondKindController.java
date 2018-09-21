package com.iotek.controller;

import com.iotek.entity.ConfigFileSecondKind;
import com.iotek.service.ConfigFileSecondKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ConfigFileSecondKindController {
    @Autowired
    private ConfigFileSecondKindService configFileSecondKindService;

    @RequestMapping("/showAllConfigFileSecondKind")
    public @ResponseBody
    List<ConfigFileSecondKind> showAllConfigFileSecondKind() {
        System.out.println("----showAllConfigFileSecondKind----");
        List<ConfigFileSecondKind> configFileSecondKinds = configFileSecondKindService.showFileByFirstKindId(1);
        for (ConfigFileSecondKind configFileSecondKind : configFileSecondKinds) {
            System.out.println(configFileSecondKind);
        }
        System.out.println("----showAllConfigFileSecondKind----");
        return configFileSecondKinds;
    }


    @RequestMapping("/showConfigFileFirstKindByFirstId")
    public @ResponseBody
    List<ConfigFileSecondKind> showConfigFileFirstKindByFirstId(Integer firstKindId) {
        System.out.println("----showConfigFileFirstKindByFirstId----");
        System.out.println("firstKindId:"+firstKindId);
        List<ConfigFileSecondKind> configFileSecondKinds = configFileSecondKindService.showFileByFirstKindId(firstKindId);
        for (ConfigFileSecondKind configFileSecondKind : configFileSecondKinds) {
            System.out.println(configFileSecondKind);
        }
        System.out.println("----showConfigFileFirstKindByFirstId----");
        return configFileSecondKinds;
    }
}