package com.rideshare;

import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class DateFormatter {
    private final SimpleDateFormat sdf = new SimpleDateFormat();

    Date strToDate(String date, String time) throws ParseException {
        sdf.applyPattern("yyyy-MM-dd a KK:mm");
        return sdf.parse(date + " " + time);
    }

    String dateToDateStr(Date date) {
        sdf.applyPattern("yyyy-MM-dd");
        return sdf.format(date);
    }

    String dateToTimeStr(Date date) {
        sdf.applyPattern("a KK:mm");
        return sdf.format(date);
    }

}
