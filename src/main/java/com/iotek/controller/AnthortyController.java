package com.iotek.controller;

import com.iotek.entity.Anthorty;
import com.iotek.service.AnthortyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class AnthortyController {

    @Autowired
    private AnthortyService anthortyService;

    @RequestMapping("/anthorty_showList")
    public @ResponseBody
    List<Anthorty> showAllAnthorty() {
        System.out.println("------------进入showAllAnthorty-----------------");
        List<Anthorty> anthorties = anthortyService.showAllAnthorty();
        return anthorties;
    }

    @RequestMapping("/anthorty_change_showList")
    public String showAllAnthorty(String target, ModelMap modelMap) {
        System.out.println("------------进入anthorty_change_showList-----------------");
        System.out.println("target" + target);
        List<Anthorty> anthorties = anthortyService.showAllAnthorty();
        modelMap.addAttribute("anthorties", anthorties);
        return "view/system/anthorty/" + target;
    }

    @RequestMapping("/anthorty_show")
    public String showAnthortyById(Integer anthortyId, String target, ModelMap modelMap) {
        System.out.println("---------------进入anthorty_show---------------");
        System.out.println("anthortyId:" + anthortyId);
        System.out.println("target:" + target);
        Anthorty anthorty = anthortyService.showAnthortyById(anthortyId);

        /*List<Anthorty> parents = anthortyService.showAllParent();
        modelMap.addAttribute("parents", parents);*/
        modelMap.addAttribute("anthorty", anthorty);
        return "view/system/anthorty/" + target;
    }

    @RequestMapping("/anthorty_showParent")
    public String showAnthortyParent(String target, ModelMap modelMap) {
        System.out.println("---------------进入anthorty_showParent---------------");
        System.out.println("target:" + target);
        List<Anthorty> parents = anthortyService.showAllParent();
        if (parents != null) {
            modelMap.addAttribute("parents", parents);
        }
        return "view/system/anthorty/" + target;

    }

    @RequestMapping("/anthorty_update")
    public void updateAnthorty(Anthorty anthorty, HttpServletResponse response) throws IOException {
        System.out.println("---------------进入anthorty_update---------------");
        System.out.println("anthorty:" + anthorty);
        Integer integer = anthortyService.updateAnthortyById(anthorty);
        PrintWriter writer = response.getWriter();
        if (integer > 0) {
            writer.print("<script>alert('修改成功！')</script>");
        } else {
            writer.print("<script>alert('修改失败！')</script>");
        }
        writer.print("<script>parent.location.href='view/system/anthorty/anthorty_list.jsp'</script>");
        writer.flush();
        writer.close();

    }


    @RequestMapping("/anthorty_add")
    public void addAnthorty(Anthorty anthorty, HttpServletResponse response) throws IOException {
        System.out.println("---------------进入anthorty_add---------------");
        System.out.println("anthorty:" + anthorty);
        Integer integer = anthortyService.addAnthorty(anthorty);
        PrintWriter writer = response.getWriter();
        if (integer > 0) {
            writer.print("<script>alert('添加成功！')</script>");
        } else {
            writer.print("<script>alert('添加失败！')</script>");
        }
        writer.print("<script>parent.location.href='view/system/anthorty/anthorty_list.jsp'</script>");
        writer.flush();
        writer.close();
    }

    @RequestMapping("/anthorty_delete")
    public void deleteAnthorty(Anthorty anthorty, HttpServletResponse response) throws IOException {
        System.out.println("---------------进入anthorty_delete---------------");
        System.out.println("anthorty:" + anthorty);
        Integer integer = anthortyService.deleteAnthorty(anthorty);
        PrintWriter writer = response.getWriter();
        if (integer > 0) {
            writer.print("<script>alert('删除成功！')</script>");
        } else {
            writer.print("<script>alert('删除失败！')</script>");
        }
        writer.print("<script>parent.location.href='view/system/anthorty/anthorty_list.jsp'</script>");
        writer.flush();
        writer.close();
    }

    @RequestMapping("/anthorty_change")
    public String anthortyChange(Integer roleId, int[] anthortyId, ModelMap modelMap) {
        System.out.println("------------------------进入anthorty_change---------------------");
        System.out.println("roleId:" + roleId);
        Integer result = 0;
        for (int i : anthortyId) {
            System.out.println(i);
        }
        result = anthortyService.addAnthortyAndRole(roleId, anthortyId);
        if (result > 0) {
            modelMap.addAttribute("mess", "修改成功！");
        } else {
            modelMap.addAttribute("mess", "修改失败!");
        }
        return "forward:/roleInfo_list?target=anthotychange/anthorty_changeList";
    }

    @RequestMapping("/forward_anthorty")
    public String forwardAnthorty() {
        return "view/system/anthorty/anthorty_list";
    }

}