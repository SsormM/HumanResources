package com.iotek.controller;

import com.iotek.entity.User;
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

@Controller
@SessionAttributes("user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login (User user, ModelMap modelMap){
        System.out.println("------����login------");
        System.out.println(user);
        System.out.println("------����login------");
        User login = userService.login(user);
        String target=null;
        if (login!=null){
            modelMap.addAttribute("user",login);
            System.out.println(login);
            target="view/main";
        }else{
            modelMap.addAttribute("mess","������û�������������");
            target="login";
        }
        return target;
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
        System.out.println("-----------------����out---------------");
        return "login";
    }
}