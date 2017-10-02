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

    private Integer goodcntseq;

    private int goodcntbno;
    private String goodcntuid;
//    private String badcntuid;
//    private String spamcntuid;

    public Integer getGoodcntseq() {
        return goodcntseq;
    }

    public void setGoodcntseq(Integer goodcntseq) {
        this.goodcntseq = goodcntseq;
    }

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

    @Override
    public String toString() {
        return "GoodCntVO{" +
                "goodcntseq=" + goodcntseq +
                ", goodcntbno=" + goodcntbno +
                ", goodcntuid='" + goodcntuid + '\'' +
                '}';
    }
}