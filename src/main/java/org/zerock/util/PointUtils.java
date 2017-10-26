package org.zerock.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by Emiya on 2017-10-23 오후 1:35
 * untitled / org.zerock.util
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


public class PointUtils {

    public static final Logger logger =
            LoggerFactory.getLogger(PointUtils.class);

    private String loginId;                         // 고객키

    private Date savingDate;                        // 적립일
    private int savingPoint;                        // 적립 포인트
    private Date deleteScheduleDate;                // 소멸 예정일(insert, delete에도)
    private String savingPointContent;              // 적립 내용

    private Date usePointDate;                      // 사용일
    private int usePoint;                           // 사용 포인트
    private String usePointContent;                 // 사용 내용

    private int extinctPoint;                       // 소멸 포인트
    private String extinctPointContent;             // 소멸 내용

    private String reason;                          // 적립, 사용, 소멸 이유

    private Integer bnoParam;                       // 글번호, 전달되는 파라미터값

    private int balancePoint;                       // tbl_user의 포인트 잔액

    public PointUtils(){}; // 기본 생성자

    // insert 회원가입시 100 포인트(+) 생성자
    public PointUtils(String loginId, String reason, int savingPoint) {
        this.loginId = loginId;
        this.reason = reason;
        this.savingPoint = savingPoint;

        logger.info("lllll~~~~~ loginId, reason, savingPoint : " + loginId + reason + savingPoint);

        deleteScheduleDatePointUtils();
        savingPointContentPointUtils(loginId, reason, savingPoint);
    }

    // insert 글작성시 50 포인트(+) 생성자
    public PointUtils(String loginId, Integer bnoParam, String reason, int savingPoint) {
        this.loginId = loginId;
        this.bnoParam = bnoParam;
        this.reason = reason;
        this.savingPoint = savingPoint;

        deleteScheduleDatePointUtils();
        savingPointContentPointUtils(loginId, bnoParam, reason, savingPoint);
    }

    // update 사용 - 글삭제시 49 포인트(-) 생성자
    public PointUtils(String loginId, int usePoint, String reason, Integer bnoParam) {
        this.loginId = loginId;
        this.usePoint = usePoint;
        this.reason = reason;
        this.bnoParam = bnoParam;

        exploitPointContentPointUtils(loginId, usePoint, reason, bnoParam);
        extinctPointContentPointUtils(loginId, usePoint, reason, bnoParam);
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public Date getSavingDate() {
        return savingDate;
    }

    public void setSavingDate(Date savingDate) {
        this.savingDate = savingDate;
    }

    public int getSavingPoint() {
        return savingPoint;
    }

    public void setSavingPoint(int savingPoint) {
        this.savingPoint = savingPoint;
    }

    public Date getDeleteScheduleDate() {
        return deleteScheduleDate;
    }

    public void setDeleteScheduleDate(Date deleteScheduleDate) {
        this.deleteScheduleDate = deleteScheduleDate;
    }

    public String getSavingPointContent() {
        return savingPointContent;
    }

    public void setSavingPointContent(String savingPointContent) {
        this.savingPointContent = savingPointContent;
    }

    public Date getUsePointDate() {
        return usePointDate;
    }

    public void setUsePointDate(Date usePointDate) {
        this.usePointDate = usePointDate;
    }

    public int getUsePoint() {
        return usePoint;
    }

    public void setUsePoint(int usePoint) {
        this.usePoint = usePoint;
    }

    public String getUsePointContent() {
        return usePointContent;
    }

    public void setUsePointContent(String usePointContent) {
        this.usePointContent = usePointContent;
    }

    public int getExtinctPoint() {
        return extinctPoint;
    }

    public void setExtinctPoint(int extinctPoint) {
        this.extinctPoint = extinctPoint;
    }

    public String getExtinctPointContent() {
        return extinctPointContent;
    }

    public void setExtinctPointContent(String extinctPointContent) {
        this.extinctPointContent = extinctPointContent;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getBnoParam() {
        return bnoParam;
    }

    public void setBnoParam(Integer bnoParam) {
        this.bnoParam = bnoParam;
    }

    public int getBalancePoint() {
        return balancePoint;
    }

    public void setBalancePoint(int balancePoint) {
        this.balancePoint = balancePoint;

        balancePointUtils();
    }

    // tbl_user의 남은 포인트 = B테이블(적립) - C테이블(사용)
    private void balancePointUtils() {
        this.balancePoint = balancePoint + this.savingPoint - this.usePoint;
    }

    // insert시 소멸 예정일 구하는 내부 메소드
    private void deleteScheduleDatePointUtils() {

        Date date = new Date();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        String te = simpleDateFormat.format(date);

        int YEAR = 1;
        int MONTH = 2;
        int DATE = 5;

        String input_dt = te;	// 입력되는 날짜
        String output_dt = "";	// 출력 될 날짜
        String sp_dt[] = input_dt.split("-");	// - 문자를 자름.

        Calendar cal = Calendar.getInstance(); // Calendar 객체 생성
        cal.set(YEAR, Integer.parseInt(sp_dt[0]));	//입력되는 년 셋팅
        cal.set(MONTH, Integer.parseInt(sp_dt[1])-1);	//입력되는 달 셋팅
        cal.set(DATE, Integer.parseInt(sp_dt[2]));	//입력되는 일 셋팅

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");	// 날짜 포맷 설정
        //	System.out.println(formatter.format(cal.getTime()));
        cal.add(MONTH, 3);	// 설정한("2014-01-01")+3개월
        // cal.set(DATE, 1);	// 일을 1일로 변경
        //	System.out.println(formatter.format(cal.getTime()));
        cal.add(DATE, -1);	// 하루 전으로 변경
        output_dt = formatter.format(cal.getTime());
        System.out.println(output_dt);

        logger.info("lllll~~~~~ formatter : " + formatter);
        logger.info("lllll~~~~~ output_dt : " + output_dt);

        try {
            Date dateFromString = formatter.parse(output_dt);

            this.deleteScheduleDate = dateFromString;

        } catch(ParseException e) {
            e.printStackTrace();
        }
    }

    private void savingPointContentPointUtils (String loginId, String savingReason, int pointAmount) {
        String ment = loginId + "님 " + savingReason + "으로 " + pointAmount + " 포인트 적립 (+) ";
        this.savingPointContent = ment;
    }

    private void savingPointContentPointUtils (String loginId, Integer bnoParam, String savingReason, int pointAmount) {
        String ment = loginId + "님 " + bnoParam + savingReason + "으로 " + pointAmount + " 포인트 적립 (+) ";
        this.savingPointContent = ment;
    }

    private void exploitPointContentPointUtils (String loginId, int pointAmount, String reason, Integer bnoParam) {
        String ment = loginId + "님 " + bnoParam + reason + "로 " + pointAmount + " 포인트 사용 (-) ";
        this.usePointContent = ment;
    }

    private void extinctPointContentPointUtils (String loginId, int pointAmount, String reason, Integer bnoParam) {
        String ment = loginId + "님 " + bnoParam + reason + "로 " + pointAmount + " 포인트 소멸 (-) ";
        this.extinctPointContent = ment;
    }

}