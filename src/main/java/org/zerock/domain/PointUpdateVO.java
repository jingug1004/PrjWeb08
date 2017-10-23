package org.zerock.domain;

import java.util.Date;

/**
 * Created by Emiya on 2017-10-23 오전 11:08
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
point 사용 테이블(C): update
        고객키      + 사용일 + 사용순번 + 사용 point + 사용 내용
    ex) jingug1004 + 171023 + 48      + 100        + jingug1004님 157번 상품 투자로 50포인트 사용(-)
*/

public class PointUpdateVO {

    private String pupdid;
    private Date pupddate;
    private int pupdseq;
    private int pupdpoint;
    private String pupdcontent;

    public String getPupdid() {
        return pupdid;
    }

    public void setPupdid(String pupdid) {
        this.pupdid = pupdid;
    }

    public Date getPupddate() {
        return pupddate;
    }

    public void setPupddate(Date pupddate) {
        this.pupddate = pupddate;
    }

    public int getPupdseq() {
        return pupdseq;
    }

    public void setPupdseq(int pupdseq) {
        this.pupdseq = pupdseq;
    }

    public int getPupdpoint() {
        return pupdpoint;
    }

    public void setPupdpoint(int pupdpoint) {
        this.pupdpoint = pupdpoint;
    }

    public String getPupdcontent() {
        return pupdcontent;
    }

    public void setPupdcontent(String pupdcontent) {
        this.pupdcontent = pupdcontent;
    }

    @Override
    public String toString() {
        return "PointUpdateVO{" +
                "pupdid='" + pupdid + '\'' +
                ", pupddate=" + pupddate +
                ", pupdseq=" + pupdseq +
                ", pupdpoint=" + pupdpoint +
                ", pupdcontent='" + pupdcontent + '\'' +
                '}';
    }
}