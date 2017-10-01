package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.zerock.domain.GoodCntVO;

import javax.inject.Inject;

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
public class CntDAOImpl implements CntDAO{

    private static final Logger logger = LoggerFactory.getLogger(CntDAOImpl.class);

    @Inject
    private SqlSession session;

    private static String namespace = "org.zerock.mapper.cntMapper";


    @Override
    public void goodCntPush(GoodCntVO goodCntVO) throws Exception {

//        logger.info(goodCntVO.toString());

        session.insert(namespace + ".goodCntInsert", goodCntVO);
        session.delete(namespace + ".goodCntDelete");

    }
}