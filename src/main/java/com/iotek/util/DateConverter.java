package com.iotek.util;

import org.springframework.core.convert.converter.Converter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        SimpleDateFormat simpleDateFormat=null;
        if (s.length()>10){
            simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        }else {
            simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        }
        Date date = null;
        try {
            if (s!=null&&!s.equals("")){
                date = simpleDateFormat.parse(s);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
