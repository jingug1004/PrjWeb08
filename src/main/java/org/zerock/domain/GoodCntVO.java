package org.zerock.domain;

/**
 * Created by Emiya on 2017-09-27 오후 2:20
 * untitled / org.zerock.domain
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


public class GoodCntVO {

    private int goodcntbno;

    private String goodcntuid;
    private String goodcnttemp;

    private String badcntuid;
    private String badcnttemp;

    private String spamcntuid;
    private String spamcnttemp;

    private String usercolor;

    public int getGoodcntbno() {
        return goodcntbno;
    }

    public void setGoodcntbno(int goodcntbno) {
        this.goodcntbno = goodcntbno;
    }

    public String getGoodcntuid() {
        return goodcntuid;
    }

    public void setGoodcntuid(String goodcntuid) {
        this.goodcntuid = goodcntuid;
    }

    public String getGoodcnttemp() {
        return goodcnttemp;
    }

    public void setGoodcnttemp(String goodcnttemp) {
        this.goodcnttemp = goodcnttemp;
    }

    public String getBadcntuid() {
        return badcntuid;
    }

    public void setBadcntuid(String badcntuid) {
        this.badcntuid = badcntuid;
    }

    public String getBadcnttemp() {
        return badcnttemp;
    }

    public void setBadcnttemp(String badcnttemp) {
        this.badcnttemp = badcnttemp;
    }

    public String getSpamcntuid() {
        return spamcntuid;
    }

    public void setSpamcntuid(String spamcntuid) {
        this.spamcntuid = spamcntuid;
    }

    public String getSpamcnttemp() {
        return spamcnttemp;
    }

    public void setSpamcnttemp(String spamcnttemp) {
        this.spamcnttemp = spamcnttemp;
    }

    public String getUsercolor() {
        return usercolor;
    }

    public void setUsercolor(String usercolor) {
        this.usercolor = usercolor;
    }

    @Override
    public String toString() {
        return "GoodCntVO{" +
                "goodcntbno=" + goodcntbno +
                ", goodcntuid='" + goodcntuid + '\'' +
                ", goodcnttemp='" + goodcnttemp + '\'' +
                ", badcntuid='" + badcntuid + '\'' +
                ", badcnttemp='" + badcnttemp + '\'' +
                ", spamcntuid='" + spamcntuid + '\'' +
                ", spamcnttemp='" + spamcnttemp + '\'' +
                ", usercolor='" + usercolor + '\'' +
                '}';
    }
}