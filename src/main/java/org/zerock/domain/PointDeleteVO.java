package org.zerock.domain;

import java.util.Date;

/**
 * Created by Emiya on 2017-10-23 오전 11:10
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
point 소멸 테이블(D): delete
        고객키     + 소멸일  + 소멸 point + 소멸 내용
    ex) jingug1004 + 180121 + 300        + jingug1004님 1567번 글 삭제로 45포인트 소멸(-)
*/

public class PointDeleteVO {

    private String pdelid;
    private Date pdeldate;
    private int pdelseq;
    private int pdelpoint;
    private String pdelcontent;

    public String getPdelid() {
        return pdelid;
    }

    public void setPdelid(String pdelid) {
        this.pdelid = pdelid;
    }

    public Date getPdeldate() {
        return pdeldate;
    }

    public void setPdeldate(Date pdeldate) {
        this.pdeldate = pdeldate;
    }

    public int getPdelseq() {
        return pdelseq;
    }

    public void setPdelseq(int pdelseq) {
        this.pdelseq = pdelseq;
    }

    public int getPdelpoint() {
        return pdelpoint;
    }

    public void setPdelpoint(int pdelpoint) {
        this.pdelpoint = pdelpoint;
    }

    public String getPdelcontent() {
        return pdelcontent;
    }

    public void setPdelcontent(String pdelcontent) {
        this.pdelcontent = pdelcontent;
    }

    @Override
    public String toString() {
        return "PointDeleteVO{" +
                "pdelid='" + pdelid + '\'' +
                ", pdeldate=" + pdeldate +
                ", pdelseq=" + pdelseq +
                ", pdelpoint=" + pdelpoint +
                ", pdelcontent='" + pdelcontent + '\'' +
                '}';
    }
}