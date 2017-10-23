package org.zerock.web;

import java.io.File;
import java.text.ChoiceFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.SimpleTimeZone;

/**
 * Created by Emiya on 2017-10-23 오후 3:26
 * untitled / org.zerock.web
 * No pain, No gain!
 * What :
 * Why :
 * How :
 * << 개정이력(Modification Information) >>
 * 수정일         수정자          수정내용
 * -------       --------       ---------------------------
 * 2017/04/21     김진국          최초 생성
 * 2017/05/27     이몽룡          인증이 필요없는 URL을 패스하는 로직 추가
 *
 * @author 개발팀 김진국
 * @version 1.0
 * @see
 * @since 2017/04/10
 */


public class DatePrepareClass {

    private void todayPlus3Format() {

        /*
        3개월을 초과하지 않는 기준일의 3개월 이상을 만드려면
        cal.set(DATE, 1);   // 일을 1일로 변경
        주석 해제
        */

        int YEAR = 1;
        int MONTH = 2;
        int DATE = 5;

        String input_dt = "2017-02-23";                            // 입력되는 날짜
        String output_dt = "";                                    // 출력 될 날짜
        String sp_dt[] = input_dt.split("-");            // - 문자를 자름.

        for (int i = 0; i < sp_dt.length; i++) {
            System.out.println("lllll~~~~~ sp_dt : " + sp_dt[i]);
        }

        Calendar cal = Calendar.getInstance();                  // Calendar 객체 생성
        cal.set(YEAR, Integer.parseInt(sp_dt[0]));                // 입력되는 년 셋팅
        cal.set(MONTH, Integer.parseInt(sp_dt[1]) - 1);            // 입력되는 달 셋팅
        cal.set(DATE, Integer.parseInt(sp_dt[2]));                // 입력되는 일 셋팅

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 포맷 설정
        System.out.println("lllll~~~~~ formatter.format(cal.getTime()) : " + formatter.format(cal.getTime()));

        cal.add(MONTH, 3);                                // 설정한("2014-01-01")+3개월
        // cal.set(DATE, 1);	                                // 일을 1일로 변경
        System.out.println("lllll~~~~~ formatter.format(cal.getTime()) : " + formatter.format(cal.getTime()));

        cal.add(DATE, -1);                                // 하루 전으로 변경

        output_dt = formatter.format(cal.getTime());

        System.out.println(output_dt);

    }

    private void todayFormat() {
        Calendar calendar = Calendar.getInstance();
        String yearPath = File.separator + calendar.get(Calendar.YEAR);
        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(calendar.get(Calendar.MONTH) + 1);
        String datePath = monthPath + File.separator + new DecimalFormat("00").format(calendar.get(Calendar.DATE));

        String temp = datePath.substring(3, 5);
        String temp2 = datePath.substring(6, 8);
        String temp3 = datePath.substring(9, 11);

        String te = temp + temp2 + temp3;

        // \2017\10\11

        System.out.println("llll~~~~ datePath : " + temp);
        System.out.println("llll~~~~ datePath : " + temp2);
        System.out.println("llll~~~~ datePath : " + temp3);
        System.out.println("llll~~~~ datePath : " + te);

    }

    public static long diffOfDate(String begin, String end)
            throws Exception {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        Date beginDate = formatter.parse(begin);
        Date endDate = formatter.parse(end);
        long diff = endDate.getTime() - beginDate.getTime();
        long diffDays = diff / 0x5265c00L;
        return diffDays;
    }

    public static String addDay(int day) {
        Calendar cal = Calendar.getInstance();
        cal.add(5, day);
        return (new SimpleDateFormat("yyyyMMdd")).format(cal.getTime());
    }

    public static String addMonth(int month) {
        Calendar cal = Calendar.getInstance();
        cal.add(2, month);
        return (new SimpleDateFormat("yyyyMMdd")).format(cal.getTime());
    }

    public static String addHour(String date, long hour) {
        int millisPerHour = 0x36ee80;
        SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddhhmmss");
        SimpleTimeZone timeZone = new SimpleTimeZone(9 * millisPerHour, "KST");
        fmt.setTimeZone(timeZone);
        int year = Integer.valueOf(date.substring(0, 4)).intValue();
        int month = Integer.valueOf(date.substring(4, 6)).intValue();
        int day = Integer.valueOf(date.substring(6, 8)).intValue();
        int hr = Integer.valueOf(date.substring(8, 10)).intValue();
        int mi = Integer.valueOf(date.substring(10, 12)).intValue();
        int s = Integer.valueOf(date.substring(12, 14)).intValue();
        Date aDay = new Date(year, month, day, hr, mi, s);
        Date bDay = new Date(1970, 1, 1, 0, 0, 0);
        Date cDay = new Date((aDay.getTime() - bDay.getTime()) + hour * (long) millisPerHour);
        return fmt.format(cDay);
    }

    public static String convertDateTimeType(String dateString) {
        if (dateString.length() == 0)
            return "";
        if (dateString.length() != 19) {
            return "";
        } else {
            String year = dateString.substring(0, 4);
            String month = dateString.substring(5, 7);
            String date = dateString.substring(8, 10);
            String hour = dateString.substring(11, 13);
            String min = dateString.substring(14, 16);
            String sec = dateString.substring(17, 19);
            return year + "-" + month + "-" + date + " " + hour + ":" + min + ":" + sec;
        }
    }

    public static String makeDateTimeType(String dateString) {
        if (dateString.length() == 0) {
            return "";
        } else {
            String year = dateString.substring(0, 4);
            String month = dateString.substring(4, 6);
            String date = dateString.substring(6, 8);
            String hour = dateString.substring(8, 10);
            String min = dateString.substring(10, 12);
            String sec = dateString.substring(12, 14);
            return year + "-" + month + "-" + date + " " + hour + ":" + min + ":" + sec;
        }
    }

    public static String makeDateTimeType(String dateString, String delimeter) {
        if (dateString == null)
            return "";
        int strlen = dateString.length();
        if (strlen < 0)
            return "";
        if (strlen <= 4)
            return dateString;
        String year = getSubstring(dateString, 0, 4);
        String month = getSubstring(dateString, 4, 2);
        String date = getSubstring(dateString, 6, 2);
        String hour = getSubstring(dateString, 8, 2);
        String min = getSubstring(dateString, 10, 2);
        String sec = getSubstring(dateString, 12, 2);
        if (strlen <= 6)
            return year + delimeter + month;
        if (strlen <= 8)
            return year + delimeter + month + delimeter + date;
        if (strlen <= 10)
            return year + delimeter + month + delimeter + date + " " + hour;
        if (strlen <= 12)
            return year + delimeter + month + delimeter + date + " " + hour + ":" + min;
        else
            return year + delimeter + month + delimeter + date + " " + hour + ":" + min + ":" + sec;
    }

    public static String Order2monthName(double order) {
        double limits[] = {
                1.0D, 2D, 3D, 4D, 5D, 6D, 7D
        };
        String monthNames[] = {
                "\uC77C", "\uC6D4", "\uD654", "\uC218", "\uBAA9", "\uAE08", "\uD1A0"
        };
        ChoiceFormat form = new ChoiceFormat(limits, monthNames);
        if (order >= 1.0D && order <= 7D)
            return form.format(order);
        else
            return "";
    }

    public static double monthName2Order(String monthName) {
        double limits[] = {
                1.0D, 2D, 3D, 4D, 5D, 6D, 7D
        };
        String monthNames[] = {
                "\uC77C", "\uC6D4", "\uD654", "\uC218", "\uBAA9", "\uAE08", "\uD1A0"
        };
        if (monthName.length() < 1)
            return -1D;
        String Name = monthName.substring(0, 1);
        for (int i = 0; i < 7; i++)
            if (Name.equals(monthNames[i]))
                return limits[i];
        return -1D;
    }

    public static String findWeekOrder(String DateStr) {
        if (DateStr.length() != 8) {
            return "0";
        } else {
            String tDate = makeDateTimeType(DateStr, "-");
            int ord = getDate(tDate).getDay();
            return Integer.toString(ord + 1);
        }
    }

    public static String getLastDay(int year, int month) {
        int lastday = 0;
        if (month == 1)
            lastday = 31;
        else if (month == 2) {
            if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
                lastday = 29;
            else
                lastday = 28;
        } else if (month == 3)
            lastday = 31;
        else if (month == 4)
            lastday = 30;
        else if (month == 5)
            lastday = 31;
        else if (month == 6)
            lastday = 30;
        else if (month == 7)
            lastday = 31;
        else if (month == 8)
            lastday = 31;
        else if (month == 9)
            lastday = 30;
        else if (month == 10)
            lastday = 31;
        else if (month == 11)
            lastday = 30;
        else if (month == 12)
            lastday = 31;
        String syear = (new Integer(year)).toString();
        String smonth = (new Integer(month)).toString();
        String slastDay = (new Integer(lastday)).toString();
        return syear + makeFPading(smonth, 2, "0") + slastDay;
    }

    private static String makeFPading(String Str, int totlen, String pad) {
        String retStr = "";
        if (Str == null)
            return "";
        int slen = Str.length();
        if (totlen < 1 || slen >= totlen)
            return Str;
        for (int i = 0; i < totlen - slen; i++)
            retStr = retStr + pad;
        retStr = retStr + Str;
        return retStr;
    }

    private static java.sql.Date getDate(String in_time) {
        return java.sql.Date.valueOf(in_time);
    }

    private static String getSubstring(String Str, int start, int len) {
        if (Str == null)
            return "";
        int slen = Str.length();
        if (slen < 1 || start < 0 || len < 1)
            return "";
        if (slen - 1 < start)
            return "";
        if (slen < start + len)
            return Str.substring(start, Str.length());
        else
            return Str.substring(start, start + len);
    }

    public static String getDateByWeek(int week) {
        Calendar c1 = Calendar.getInstance();
        String smm = null;
        String sdd = null;
        int idx = 7;
        idx *= week;
        c1.add(5, idx);
        Integer yyyy = new Integer(c1.get(1));
        Integer mm = new Integer(c1.get(2) + 1);
        Integer dd = new Integer(c1.get(5));
        smm = mm.toString().length() >= 2 ? mm.toString() : "0" + mm.toString();
        sdd = dd.toString().length() >= 2 ? dd.toString() : "0" + dd.toString();
        return yyyy.toString() + smm + sdd;
    }

    public static String getDateByWeek(String yyyymmdd, int week) {
        Calendar c1 = Calendar.getInstance();
        String smm = null;
        String sdd = null;
        int idx = 7;
        int tyyyy = Integer.parseInt(yyyymmdd.substring(0, 4));
        int tmm = Integer.parseInt(yyyymmdd.substring(4, 6));
        int tdd = Integer.parseInt(yyyymmdd.substring(6, 8));
        idx *= week;
        c1.set(tyyyy, tmm - 1, tdd);
        c1.add(5, idx);
        Integer yyyy = new Integer(c1.get(1));
        Integer mm = new Integer(c1.get(2) + 1);
        Integer dd = new Integer(c1.get(5));
        smm = mm.toString().length() >= 2 ? mm.toString() : "0" + mm.toString();
        sdd = dd.toString().length() >= 2 ? dd.toString() : "0" + dd.toString();
        return yyyy.toString() + smm + sdd;
    }

    public static String getDateWithMillisecond() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return sdf.format(date);
    }

    public static String getDateWithMillisecond(String delimiter) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy" + delimiter + "MM" + delimiter + "dd" + delimiter + "HH" + delimiter + "mm" + delimiter + "ss" + delimiter + "SSS");
        return sdf.format(date);
    }

    public static String getDayInYear() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("D");
        return sdf.format(date);
    }

    public static String getDayOfWeek() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE");
        return sdf.format(date);
    }

    public static String getDayOfWeek(String yyyymmdd) {
        Calendar currentDay = Calendar.getInstance();
        int yyyy = Integer.parseInt(yyyymmdd.substring(0, 4));
        int mm = Integer.parseInt(yyyymmdd.substring(4, 6));
        int dd = Integer.parseInt(yyyymmdd.substring(6, 8));
        currentDay.set(yyyy, mm - 1, dd);
        String ls_day_of_week = "";
        if (currentDay.get(7) == 1)
            ls_day_of_week = "\uC77C";
        if (currentDay.get(7) == 2)
            ls_day_of_week = "\uC6D4";
        if (currentDay.get(7) == 3)
            ls_day_of_week = "\uD654";
        if (currentDay.get(7) == 4)
            ls_day_of_week = "\uC218";
        if (currentDay.get(7) == 5)
            ls_day_of_week = "\uBAA9";
        if (currentDay.get(7) == 6)
            ls_day_of_week = "\uAE08";
        if (currentDay.get(7) == 7)
            ls_day_of_week = "\uD1A0";
        return ls_day_of_week;
    }

    public static String getThisDay(String type) {
        Date date = new Date();
        SimpleDateFormat sdf = null;
        if (type.toLowerCase().equals("yyyymmdd")) {
            sdf = new SimpleDateFormat("yyyyMMdd");
            return sdf.format(date);
        }
        if (type.toLowerCase().equals("yyyymmddhh")) {
            sdf = new SimpleDateFormat("yyyyMMddHH");
            return sdf.format(date);
        }
        if (type.toLowerCase().equals("yyyymmddhhmm")) {
            sdf = new SimpleDateFormat("yyyyMMddHHmm");
            return sdf.format(date);
        }
        if (type.toLowerCase().equals("yyyymmddhhss")) {
            sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            return sdf.format(date);
        }
        if (type.toLowerCase().equals("yyyymmddhhmmssms")) {
            sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            return sdf.format(date);
        } else {
            return "ERR: parameter must be 'YYYYMMDD', 'YYYYMMDDHH', 'YYYYMMDDHHSS'or 'YYYYMMDDHHSSMS'";
        }
    }

    public static String getThisDay(String type, String separater) {
        Date date = new Date();
        SimpleDateFormat sdf = null;
        if (type.toLowerCase().equals("yyyymmdd")) {
            sdf = new SimpleDateFormat("yyyy" + separater + "MM" + separater + "dd");
            return sdf.format(date);
        }
        if (type.toLowerCase().equals("yyyymmddhh")) {
            sdf = new SimpleDateFormat("yyyy" + separater + "MM" + separater + "dd" + separater + "HH");
            return sdf.format(date);
        }
        if (type.toLowerCase().equals("yyyymmddhhmm")) {
            sdf = new SimpleDateFormat("yyyy" + separater + "MM" + separater + "dd" + separater + "HH" + separater + "mm");
            return sdf.format(date);
        }
        if (type.toLowerCase().equals("yyyymmddhhss")) {
            sdf = new SimpleDateFormat("yyyy" + separater + "MM" + separater + "dd" + separater + "HH" + separater + "mm" + separater + "ss");
            return sdf.format(date);
        }
        if (type.toLowerCase().equals("yyyymmddhhmmssms")) {
            sdf = new SimpleDateFormat("yyyy" + separater + "MM" + separater + "dd" + separater + "HH" + separater + "mm" + separater + "ss" + separater + "SSS");
            return sdf.format(date);
        } else {
            return "ERR: parameter must be 'YYYYMMDD', 'YYYYMMDDHH', 'YYYYMMDDHHSS'or 'YYYYMMDDHHSSMS'";
        }
    }

    public static String getWeekInYear() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("ww");
        return sdf.format(date);
    }

    public static String parseDate(String str, String delimiter) {
        if (str == null)
            return "";
        String temp_str = str.trim();
        int t_length = temp_str.length();
        if (t_length < 8)
            return str;
        if (delimiter != null)
            return temp_str.substring(0, 4) + delimiter + temp_str.substring(4, 6) + delimiter + temp_str.substring(6);
        else
            return temp_str.substring(0, 4) + "/" + temp_str.substring(4, 6) + "/" + temp_str.substring(6);
    }

    public static String YYMMDD() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
        return sdf.format(date);
    }

    public static String YYMMDD(String delimiter) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yy" + delimiter + "MM" + delimiter + "dd");
        return sdf.format(date);
    }

    public static String YYYYMMDD() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        return sdf.format(date);
    }

    public static String YYYYMMDD(String delimiter) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy" + delimiter + "MM" + delimiter + "dd");
        return sdf.format(date);
    }

    public static String YYYYMMDDHH() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHH");
        return sdf.format(date);
    }

    public static String YYYYMMDDHH(String delimiter) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy" + delimiter + "MM" + delimiter + "dd" + delimiter + "HH");
        return sdf.format(date);
    }

    public static String YYYYMMDDHHMM(String delimiter) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy" + delimiter + "MM" + delimiter + "dd" + delimiter + "HH" + delimiter + "mm");
        return sdf.format(date);
    }

    public static String YYYYMMDDHHMMSS() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return sdf.format(date);
    }

    public static String YYYYMMDDHHMMSS(String delimiter) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy" + delimiter + "MM" + delimiter + "dd" + delimiter + "HH" + delimiter + "mm" + delimiter + "ss");
        return sdf.format(date);
    }

    public static String getDateByPattern(String pattern) {
        SimpleDateFormat formatter = new SimpleDateFormat(pattern, Locale.KOREA);
        String dateString = formatter.format(new Date());
        return dateString;
    }

    public static String getDay() {
        return getDateByPattern("dd");
    }

    public static String getYear() {
        return getDateByPattern("yyyy");
    }

    public static String getMonth() {
        return getDateByPattern("MM");
    }

    public static String toDateFormat(String str, int len) {
        if (str == null || str.length() < len)
            return "";
        String retstr;
        if (len == 4) {
            retstr = str.substring(0, 2);
            retstr = retstr + ":";
            retstr = retstr + str.substring(2, 4);
            return retstr;
        }
        retstr = str.substring(0, 4);
        retstr = retstr + "-";
        retstr = retstr + str.substring(4, 6);
        if (len == 8) {
            retstr = retstr + "-";
            retstr = retstr + str.substring(6, 8);
        } else if (len == 12) {
            retstr = retstr + "-";
            retstr = retstr + str.substring(6, 8);
            retstr = retstr + " ";
            retstr = retstr + str.substring(8, 10);
            retstr = retstr + ":";
            retstr = retstr + str.substring(10, 12);
        }
        return retstr;
    }

    public static String getMonthFormat(int month) {
        String result = "";
        if (month < 10)
            result = "0" + String.valueOf(month);
        else
            result = String.valueOf(month);
        return result;
    }

    public static String getDaysOfMonth(String date) {
        String result = "";
        int nYear = Integer.parseInt(date.substring(0, 4));
        int nMonth = Integer.parseInt(date.substring(4, 6)) - 1;
        if (nMonth == 0) {
            nYear--;
            nMonth = 12;
        }
        if (nMonth == 2)
            if (nYear % 4 == 0 && (nYear % 100 != 0 || nYear % 400 == 0))
                monthDays[1] = 29;
            else
                monthDays[1] = 28;
        result = String.valueOf(nYear) + getMonthFormat(nMonth) + String.valueOf(monthDays[nMonth - 1]);
        return result;
    }

    public static String getDaysOfCurrentMonth(String date) {
        String result = "";
        int nYear = Integer.parseInt(date.substring(0, 4));
        int nMonth = Integer.parseInt(date.substring(4, 6));
        if (nMonth == 2)
            if (nYear % 4 == 0 && (nYear % 100 != 0 || nYear % 400 == 0))
                monthDays[1] = 29;
            else
                monthDays[1] = 28;
        result = String.valueOf(nYear) + getMonthFormat(nMonth) + String.valueOf(monthDays[nMonth - 1]);
        return result;
    }

    public static String getTwoCharNum(int i) {
        return i >= 10 ? Integer.toString(i) : "0" + Integer.toString(i);
    }

    public static int monthDays[] = {
            31, 28, 31, 30, 31, 30, 31, 31, 30, 31,
            30, 31


    };

}