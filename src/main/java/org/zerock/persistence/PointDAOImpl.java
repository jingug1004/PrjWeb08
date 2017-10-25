package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.zerock.domain.PointDeleteVO;
import org.zerock.domain.PointInsertVO;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:17
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What : AOP와 트랜잭션 처리를 위한 준비(테스트).
 * Why :
 * How :
 */


@Repository
public class PointDAOImpl implements PointDAO {

    public static final Logger logger =
            LoggerFactory.getLogger(PointDAOImpl.class);

    @Inject
    private SqlSession sqlSession;

    private static String namespace = "org.zerock.mapper.PointMapper";

    @Override
    public void updatePoint(String uid, int point) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("uid", uid);
        paramMap.put("point", point);

        sqlSession.update(namespace + ".updatePoint", paramMap);
    }

    @Override
    public void insertOperPoint(PointInsertVO pointInsertVO) throws Exception {
        logger.info("lllll~~~~~ pointInsertVO.toString() : " + pointInsertVO.toString());
        sqlSession.insert(namespace + ".insertOperPoint", pointInsertVO);
    }

    @Override
    public void deleteOperPoint(PointDeleteVO pointDeleteVO) throws Exception {
        sqlSession.insert(namespace + ".deleteOperPoint", pointDeleteVO);
    }
}
