package org.zerock.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.zerock.domain.GoodCntVO;
import org.zerock.persistence.CntDAO;

import javax.inject.Inject;

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
    public void goodCntPush(GoodCntVO goodCntVO) throws Exception {
        cntDAO.goodCntPush(goodCntVO);
    }

    @Override
    public String goodCntVOGet(String loginUserID, int bno) throws Exception {
        return cntDAO.goodCntVOGet(loginUserID, bno);
    }

    // -----------------------------------------------------------------


    @Override
    public void badCntPush(GoodCntVO badCntVO) throws Exception {
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
    public void spamCntPush(GoodCntVO spamCntVO) throws Exception {
        cntDAO.spamCntPush(spamCntVO);
    }

    @Override
    public String spamCntVOGet(String loginUserID, int bno) throws Exception {
        return cntDAO.spamCntVOGet(loginUserID, bno);
    }
}