package edu.jwj439.text;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import org.junit.Test;
import org.springframework.format.annotation.DateTimeFormat;

public class TestDate {

    @Test
    public void DateTest() {
        
        Date date = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //获得入参的日期
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        cd.add(Calendar.YEAR, 1);
        cd.add(Calendar.MONTH, 1);
        cd.set(Calendar.DAY_OF_MONTH,1);
        cd.set(Calendar.HOUR_OF_DAY, 0); 
        cd.set(Calendar.MINUTE, 0); 
        cd.set(Calendar.SECOND,0);
        cd.set(Calendar.MILLISECOND, 0);
        System.out.println(sdf1.format(cd.getTime()));
    }
}
