package org.zerock.domain;

import java.util.Date;

/**
 * Created by Emiya on 2017-10-23 오전 11:03
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

/*
point 적립 테이블(B): insert
        고객키      + 적립일 + 적립순번 + 적립 point + 소멸 예정일 + 적립 내용
    ex) jingug1004 + 171022 + 13      + 500        + 180121     + jingug1004님 회원가입으로 100포인트 적립(+)(jingug1004님 1567번 글 작성으로 50포인트 적립(+))
*/

public class PointInsertVO {

    private String pinsid;
    private Date pinsregdate;       // now()
    private int pinsseq;            // MySQL AutoIcrement
    private int pinspoint;
    private Date pinsdeldate;
    private String pinscontent;

    public String getPinsid() {
        return pinsid;
    }

    public void setPinsid(String pinsid) {
        this.pinsid = pinsid;
    }

    public Date getPinsregdate() {
        return pinsregdate;
    }

    public void setPinsregdate(Date pinsregdate) {
        this.pinsregdate = pinsregdate;
    }

    public int getPinsseq() {
        return pinsseq;
    }

    public void setPinsseq(int pinsseq) {
        this.pinsseq = pinsseq;
    }

    public int getPinspoint() {
        return pinspoint;
    }

    public void setPinspoint(int pinspoint) {
        this.pinspoint = pinspoint;
    }

    public Date getPinsdeldate() {
        return pinsdeldate;
    }

    public void setPinsdeldate(Date pinsdeldate) {
        this.pinsdeldate = pinsdeldate;
    }

    public String getPinscontent() {
        return pinscontent;
    }

    public void setPinscontent(String pinscontent) {
        this.pinscontent = pinscontent;
    }

    @Override
    public String toString() {
        return "PointInsertVO{" +
                "pinsid='" + pinsid + '\'' +
                ", pinsregdate=" + pinsregdate +
                ", pinsseq=" + pinsseq +
                ", pinspoint=" + pinspoint +
                ", pinsdeldate=" + pinsdeldate +
                ", pinscontent='" + pinscontent + '\'' +
                '}';
    }
}