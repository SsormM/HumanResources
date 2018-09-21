package com.iotek.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public  class ServletUtil {

    public static HttpServletRequest getRequest(){
        System.out.println("取得getRequest");
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return requestAttributes.getRequest();
    }
    public static HttpServletResponse getResponse(){
        System.out.println("取得getResponse");
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return requestAttributes.getResponse();
    }

    public static HttpSession getSession(){
        System.out.println("取得getSession");
        return getRequest().getSession();
    }


    public static Cookie[] getCookise(){
        System.out.println("取得getCookise");
        return getRequest().getCookies();
    }

}
