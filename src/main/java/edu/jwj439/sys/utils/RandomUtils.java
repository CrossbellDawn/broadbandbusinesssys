package edu.jwj439.sys.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * 随机工具类
 * @author JWJ439
 *
 */
public class RandomUtils {

	private static SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat sdf2=new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private static SimpleDateFormat sdf3=new SimpleDateFormat("yyyyMMdd_HHmmss_SSS");
	private static Random random=new Random();
	
	/**
	 * 得到当前日期
	 */
	public static String getCurrentDateForString() {
		return sdf1.format(new Date());
	}

	/**
	 * 生成文件名使用时间+4位随机数
	 * @param fileName 文件名称
	 */
	public static String createFileNameUseTime(String fileName) {
		String fileSuffix=fileName.substring(fileName.lastIndexOf("."),fileName.length());
		String time=sdf2.format(new Date());
		Integer num=random.nextInt(9000)+1000;
		return time+num+fileSuffix;
	}

	/**
	 * 生成文件名使用时间+4位随机数
	 * @param fileName 文件名称
	 * @param suffix  临时文件的后缀
	 */
	public static String createFileNameUseTime(String fileName,String suffix) {
		String fileSuffix=fileName.substring(fileName.lastIndexOf("."),fileName.length());
		String time=sdf2.format(new Date());
		Integer num=random.nextInt(9000)+1000;
		return time+num+fileSuffix+suffix;
	}
	
	/**
	 * 生成文件名使用UUID
	 * @param fileName 文件名称
	 */
	public static String createFileNameUseUUID(String fileName) {
		String fileSuffix=fileName.substring(fileName.lastIndexOf("."),fileName.length());
		return UUID.randomUUID().toString().replace("-", "").toUpperCase()+fileSuffix;
	}

	/**
	 * 根据时间+五位随机数生成字符串
	 * @param preffx
	 * @return
	 */
    public static String createRandomStringUseTime(String preffx) {

    	return preffx+"_"+sdf3.format(new Date())+"_"+(random.nextInt(90000)+10000);
    }
    
    /**
     * 计算入参的下个月第一天
     * @param date
     * @return
     */
    public static Date firstDateOfNextMonth(Date date) {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        cd.add(Calendar.MONTH, 1);
        cd.set(Calendar.DAY_OF_MONTH,1);
        /*
                    * cd.set(Calendar.HOUR_OF_DAY, 0); cd.set(Calendar.MINUTE, 0);
                    * cd.set(Calendar.SECOND,0); cd.set(Calendar.MILLISECOND, 0);
                    */
        return cd.getTime();
    }
    /**
     * 获取入参包月的结束时间
     * @param date
     * @return
     */
    public static Date FeetypeOfMonthly(Date date) {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        cd.add(Calendar.MONTH, 1);
        //cd.set(Calendar.DAY_OF_MONTH,1);
        /*
         * cd.set(Calendar.HOUR_OF_DAY, 0); cd.set(Calendar.MINUTE, 0); cd.set(Calendar.SECOND,0);
         * cd.set(Calendar.MILLISECOND, 0);
         */
        return cd.getTime();
    }
    /**
     * 获取入参包年的结束时间
     * @param date
     * @return
     */
    public static Date FeetypeOfYearly(Date date) {
        Calendar cd = Calendar.getInstance();
        cd.setTime(date);
        cd.add(Calendar.YEAR, 1);
        //cd.set(Calendar.DAY_OF_MONTH,1);
        /*
         * cd.set(Calendar.HOUR_OF_DAY, 0); cd.set(Calendar.MINUTE, 0); cd.set(Calendar.SECOND,0);
         * cd.set(Calendar.MILLISECOND, 0);
         */
        return cd.getTime();
        
    }
}
