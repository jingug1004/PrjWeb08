package org.zerock.service;

import org.zerock.domain.GoodCntVO;

import javax.servlet.http.HttpSession;

/**
 * Created by Emiya on 2017-10-01 오후 2:01
 * untitled / org.zerock.service
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


public interface CntService {

    void goodCntPush(GoodCntVO goodCntVO, HttpSession httpSession) throws Exception;

    String goodCntVOGet(String loginUserID, int bno) throws Exception;

    // ---------------------------------------------------------------

    void badCntPush(GoodCntVO badCntVO, HttpSession httpSession) throws Exception;

    String badCntVOGet(String loginUserID, int bno) throws Exception;

    // ---------------------------------------------------------------

    int getGoodCntGet(int goodcntbno) throws Exception;

    int getBadCntGet(int badcntbno) throws Exception;

    void changeGBPut(int gbbno, double gbRate) throws Exception;

    // ---------------------------------------------------------------

    void spamCntPush(GoodCntVO spamCntVO, HttpSession httpSession) throws Exception;

    String spamCntVOGet(String loginUserID, int bno) throws Exception;

}