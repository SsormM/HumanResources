package com.iotek.controller;

import com.iotek.entity.ConfigFileFirstKind;
import com.iotek.service.ConfigFileFirstKindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ConfigFileFirstKindController {
    @Autowired
    private ConfigFileFirstKindService configFileFirstKindService;

    @RequestMapping("/showAllConfigFileFirstKind")
    public @ResponseBody
    List<ConfigFileFirstKind> showAllConfigFileFirstKind(){
        System.out.println("----进入showAllConfigFileFirstKind----");
        List<ConfigFileFirstKind> configFileFirstKinds = configFileFirstKindService.showAllFileFirstKind();
        for (ConfigFileFirstKind configFileFirstKind : configFileFirstKinds) {
            System.out.println(configFileFirstKind);
        }
        System.out.println("----进入showAllConfigFileFirstKind----");
        return configFileFirstKinds;
    }

}