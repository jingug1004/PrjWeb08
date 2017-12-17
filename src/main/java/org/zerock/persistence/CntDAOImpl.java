package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.zerock.domain.GoodCntVO;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Emiya on 2017-10-01 오전 11:59
 * untitled / org.zerock.persistence
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

@Repository
public class CntDAOImpl implements CntDAO {

    private static final Logger logger = LoggerFactory.getLogger(CntDAOImpl.class);

    @Inject
    private SqlSession session;

    private static String namespace = "org.zerock.mapper.cntMapper";


    // 굿 버튼 눌렀을 때
    @Override
    public void goodCntPush(GoodCntVO goodCntVO) throws Exception {
        // logger.info(goodCntVO.toString());
        session.insert(namespace + ".goodCntInsert", goodCntVO);
//        session.update(namespace + ".goodCntUpdate", goodCntVO);
        session.delete(namespace + ".goodCntDelete");
        session.update(namespace + ".updateGoodCountGet", goodCntVO);
    }

    // 굿 버튼 보이게 안 보이게
    @Override
    public String goodCntVOGet(String loginUserID, int bno) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("goodcntParamMap", bno + loginUserID + "Good");
        return session.selectOne(namespace + ".goodCntVOGet", paramMap);
    }

    // -----------------------------------------------------------------------

    // 배드 버튼 눌렀을 때
    @Override
    public void badCntPush(GoodCntVO badcntbno) throws Exception {

//        logger.info("lll~~~ " + badcntbno.toString() + "lll~~~");

        session.insert(namespace + ".badCntInsert", badcntbno);
//        session.update(namespace + ".badCntUpdate", badcntbno);
        session.delete(namespace + ".badCntDelete");
        session.update(namespace + ".updateBadCountGet", badcntbno);

    }

    @Override
    public String badCntVOGet(String loginUserID, int bno) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("badcntParamMap", bno + loginUserID + "Bad");

//        logger.info("lllll~~~~~ bad paramMap.toString() : " + paramMap.toString() + "lllll~~~~~");

        return session.selectOne(namespace + ".badCntVOGet", paramMap);
    }

    // -----------------------------------------------------------------------


    // good 하기 위한 good 개수 구하는.
    @Override
    public int getGoodCntGet(int goodcntbno) throws Exception {
        // logger.info("lll~~~ " + String.valueOf(goodcntbno));
        return session.selectOne(namespace + ".getGoodCntGet", goodcntbno);
    }

    // Bad 하기 위한 Bad 개수 구하는.
    @Override
    public int getBadCntGet(int badcntbno) throws Exception {
        // logger.info("lll~~~ " + String.valueOf(badcntbno));
        return session.selectOne(namespace + ".getBadCntGet", badcntbno);
    }

    @Override
    public void changeGBPut(int gbbno, double gbRate) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("gbbnoParam", gbbno);
        paramMap.put("gbRateParam", gbRate);

        session.update(namespace + ".changeGBPut", paramMap);
    }

    // -----------------------------------------------------------------------

    @Override
    public void spamCntPush(GoodCntVO spamCntVO) throws Exception {

        logger.info("lllll~~~~~ bad paramMap.toString() : " + spamCntVO.toString() + "lllll~~~~~");

        session.insert(namespace + ".spamCntInsert", spamCntVO);
        session.delete(namespace + ".spamCntDelete");
        session.update(namespace + ".updateSpamCountGet", spamCntVO);

    }

    @Override
    public String spamCntVOGet(String loginUserID, int bno) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("spamcntParamMap", bno + loginUserID + "Spam");

        return session.selectOne(namespace + ".spamCntVOGet", paramMap);
    }
}