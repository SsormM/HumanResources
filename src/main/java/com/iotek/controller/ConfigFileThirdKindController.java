package com.iotek.controller;

import com.iotek.entity.ConfigFileThirdKind;
import com.iotek.service.ConfigFileSecondKindService;
import com.iotek.service.ConfigFileThirdKindServcie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ConfigFileThirdKindController {
    @Autowired
    private ConfigFileThirdKindServcie configFileThirdKindServcie;

    @RequestMapping("/showAllConfigFileThirdKind")
    public @ResponseBody
    List<ConfigFileThirdKind> showAllConfigFileThirdKind() {
        System.out.println("----showAllConfigFileThirdKind----");
        List<ConfigFileThirdKind> configFileThirdKinds = configFileThirdKindServcie.showFileByFirstKindIdAndSecondId(1, 1);
        for (ConfigFileThirdKind configFileThirdKind : configFileThirdKinds) {
            System.out.println(configFileThirdKind);
        }
        System.out.println("----showAllConfigFileThirdKind----");
        return configFileThirdKinds;
    }

    @RequestMapping("/showConfigFileThirdKindById")
    public @ResponseBody
    List<ConfigFileThirdKind> showConfigFileThirdKindById(Integer firstKindId, Integer secondKindId) {
        System.out.println("----showConfigFileThirdKindById----");
        System.out.println("firstKindId:"+firstKindId);
        System.out.println("secondKindId"+secondKindId);
        List<ConfigFileThirdKind> configFileThirdKinds =
                configFileThirdKindServcie.showFileByFirstKindIdAndSecondId(firstKindId, secondKindId);
        for (ConfigFileThirdKind configFileThirdKind : configFileThirdKinds) {
            System.out.println(configFileThirdKind);
        }
        System.out.println("----showConfigFileThirdKindById----");
        return configFileThirdKinds;
    }

}