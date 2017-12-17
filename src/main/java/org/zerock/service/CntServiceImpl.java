package org.zerock.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.zerock.domain.GoodCntVO;
import org.zerock.domain.UserVO;
import org.zerock.persistence.CntDAO;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

/**
 * Created by Emiya on 2017-10-01 오후 2:04
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

@Service
public class CntServiceImpl implements CntService {

    private static final Logger logger = LoggerFactory.getLogger(CntServiceImpl.class);

    @Inject
    private CntDAO cntDAO;

    @Override
    public void goodCntPush(GoodCntVO goodCntVO, HttpSession httpSession) throws Exception {

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            goodCntVO.setUsercolor(loginUserVO.getUday());   // 유저의 칼라 숫자에 따라서 저장되는 좋아요에 칼라숫자 저장됨
        }

        cntDAO.goodCntPush(goodCntVO);
    }

    @Override
    public String goodCntVOGet(String loginUserID, int bno) throws Exception {
        return cntDAO.goodCntVOGet(loginUserID, bno);
    }

    // -----------------------------------------------------------------


    @Override
    public void badCntPush(GoodCntVO badCntVO, HttpSession httpSession) throws Exception {

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            badCntVO.setUsercolor(loginUserVO.getUday());   // 유저의 칼라 숫자에 따라서 저장되는 좋아요에 칼라숫자 저장됨
        }

        cntDAO.badCntPush(badCntVO);
    }

    @Override
    public String badCntVOGet(String loginUserID, int bno) throws Exception {
        return cntDAO.badCntVOGet(loginUserID, bno);
    }

    // -----------------------------------------------------------------

    @Override
    public int getGoodCntGet(int goodcntbno) throws Exception {
        return cntDAO.getGoodCntGet(goodcntbno);
    }

    @Override
    public int getBadCntGet(int badcntbno) throws Exception {
        return cntDAO.getBadCntGet(badcntbno);
    }

    @Override
    public void changeGBPut(int gbbno, double gbRate) throws Exception {
        cntDAO.changeGBPut(gbbno, gbRate);
    }

    // -----------------------------------------------------------------

    @Override
    public void spamCntPush(GoodCntVO spamCntVO, HttpSession httpSession) throws Exception {

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            spamCntVO.setUsercolor(loginUserVO.getUday());   // 유저의 칼라 숫자에 따라서 저장되는 좋아요에 칼라숫자 저장됨
        }

        cntDAO.spamCntPush(spamCntVO);
    }

    @Override
    public String spamCntVOGet(String loginUserID, int bno) throws Exception {
        return cntDAO.spamCntVOGet(loginUserID, bno);
    }
}