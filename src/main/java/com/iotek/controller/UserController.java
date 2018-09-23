package com.iotek.controller;

import com.iotek.entity.Anthorty;
import com.iotek.entity.User;
import com.iotek.service.AnthortyService;
import com.iotek.service.UserService;
import com.iotek.util.ServletUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes(value = {"user", "StaffAnthortyList"})
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private AnthortyService anthortyService;

    @RequestMapping("/login")
    public String login(User user, HttpServletResponse response, ModelMap modelMap) {
        System.out.println("------进入login------");
        System.out.println(user);
        User login = userService.login(user);
        String target = null;
        if (login != null) {
            List<Anthorty> anthortyList = anthortyService.showAnthortyByRoleId(login.getRole().getRoleId());
            modelMap.addAttribute("user", login);
            modelMap.addAttribute("role", login.getRole());
            modelMap.addAttribute("StaffAnthortyList", anthortyList);
            Cookie cookieStaffName = new Cookie("useName", login.getuName());
            Cookie cookieUserPassword = new Cookie("userPassword", login.getuPassword());
            cookieStaffName.setMaxAge(3600 * 24 * 7);
            cookieUserPassword.setMaxAge(3600 * 24 * 7);
            response.addCookie(cookieStaffName);
            response.addCookie(cookieUserPassword);
            target = "view/main";
        } else {
            modelMap.addAttribute("mess", "输入的用户名或密码有误");
            target = "login";
        }
        System.out.println("------进入login------");
        return target;
    }

    @RequestMapping("/user_list")
    public String showUserList(String target, ModelMap modelMap) {
        System.out.println("---------------showUserList---------------");
        System.out.println("target:" + target);
        List<User> users = userService.showUserList();
        modelMap.addAttribute("userPageBean", users);
        System.out.println("---------------showUserList---------------");
        return "view/system/" + target;
    }

    @RequestMapping("/out")
    public String out(SessionStatus sessionStatus) {
        HttpServletResponse response = ServletUtil.getResponse();
        HttpSession session = ServletUtil.getSession();
        Cookie[] cookies = ServletUtil.getCookise();
        session.removeAttribute("user");
        session.invalidate();
        sessionStatus.setComplete();
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(-1);
            response.addCookie(cookie);
        }
        System.out.println("-----------------进入out---------------");
        return "login";
    }
}