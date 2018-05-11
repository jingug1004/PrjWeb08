package org.zerock.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by Emiya on 2017-10-05 오후 1:19
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


public class RateMaker {

    private static final Logger logger = LoggerFactory.getLogger(RateMaker.class);

    private double rategdivb;           // 굿 / 배드 = 굿 비율
    private double rategoodcnt;         // 굿 누른 횟수
    private double ratebadcnt;          // 배드 누른 횟수
    private double temp;

    public double getRategdivb() {
        return rategdivb;
    }

    public void setRategdivb(double rategdivb) {
        this.rategdivb = rategdivb;
    }

    public void setRategb() {
        calcGBData();
    }

    private void calcGBData() {
        if (ratebadcnt == 0) {
            rategdivb = rategoodcnt;
        } else {
            temp = rategoodcnt / ratebadcnt;
            rategdivb = Double.parseDouble(String.format("%.4f", temp));
        }
    }

    public double getRategoodcnt() {
        return rategoodcnt;
    }

    public void setRategoodcnt(double rategoodcnt) {
        this.rategoodcnt = rategoodcnt;
    }

    public double getRatebadcnt() {
        return ratebadcnt;
    }

    public void setRatebadcnt(double ratebadcnt) {
        this.ratebadcnt = ratebadcnt;
    }

    public double getTemp() {
        return temp;
    }

    public void setTemp(double temp) {
        this.temp = temp;
    }

    @Override
    public String toString() {
        return "RateMaker{" +
                "rategdivb=" + rategdivb +
                ", rategoodcnt=" + rategoodcnt +
                ", ratebadcnt=" + ratebadcnt +
                ", temp=" + temp +
                '}';
    }
}