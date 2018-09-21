package com.iotek.controller;

import com.iotek.entity.ConfigPublicChar;
import com.iotek.service.ConfigPublicCharService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ConfigPublicCharController {
    @Autowired
    private ConfigPublicCharService configPublicCharService;

    @RequestMapping("/showConfigPublicCharByKind")
    public @ResponseBody
    List<ConfigPublicChar> showConfigPublicCharByKind (String attributeKind){
        System.out.println("----showConfigPublicCharByKind----");
        System.out.println("attributeKind:"+attributeKind);
        List<ConfigPublicChar> configPublicChars = configPublicCharService.showConfigPublicCharByKind(attributeKind);
        for (ConfigPublicChar configPublicChar : configPublicChars) {
            System.out.println(configPublicChar);
        }
        System.out.println("----showConfigPublicCharByKind----");
        return configPublicChars;
    }
}