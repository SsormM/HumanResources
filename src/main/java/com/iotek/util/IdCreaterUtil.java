package com.iotek.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class IdCreaterUtil {

    public static String createrId(String id,String head){
        if (id == null) {
            SimpleDateFormat formatter = new SimpleDateFormat("HHmmss");
            String datestr = formatter.format(new Date());
            String end = "0001";
            id = head + datestr + end;
        } else {
            String s = id.replaceAll(head, "");
            Integer i = Integer.parseInt(s);
            id = head + (i + 1);
        }
        return id;
    }
}