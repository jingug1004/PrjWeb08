package org.zerock.domain;

import java.util.Date;

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


public class BoardGBVO {

    private int gbno;
    private String goodcntuid;
    private String badcntuid;
    private String spamcntuid;

    private Date createdate;
    private Date updatedate;


    public int getGbno() {
        return gbno;
    }

    public void setGbno(int gbno) {
        this.gbno = gbno;
    }

    public String getGoodcntuid() {
        return goodcntuid;
    }

    public void setGoodcntuid(String goodcntuid) {
        this.goodcntuid = goodcntuid;
    }

    public String getBadcntuid() {
        return badcntuid;
    }

    public void setBadcntuid(String badcntuid) {
        this.badcntuid = badcntuid;
    }

    public String getSpamcntuid() {
        return spamcntuid;
    }

    public void setSpamcntuid(String spamcntuid) {
        this.spamcntuid = spamcntuid;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(Date updatedate) {
        this.updatedate = updatedate;
    }

    @Override
    public String toString() {
        return "BoardGBVO{" +
                "gbno=" + gbno +
                ", goodcntuid='" + goodcntuid + '\'' +
                ", badcntuid='" + badcntuid + '\'' +
                ", spamcntuid='" + spamcntuid + '\'' +
                ", createdate=" + createdate +
                ", updatedate=" + updatedate +
                '}';
    }
}