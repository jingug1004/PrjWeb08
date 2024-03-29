package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.zerock.domain.PointDeleteVO;
import org.zerock.domain.PointInsertVO;
import org.zerock.domain.PointUpdateVO;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by macbookpro on 2017. 10. 23. PM 2:17
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What :
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

//    @Override
//    public void updatePoint(String uid, int point) throws Exception {
//
//        Map<String, Object> paramMap = new HashMap<String, Object>();
//        paramMap.put("uid", uid);
//        paramMap.put("point", point);
//
//        sqlSession.update(namespace + ".updatePoint", paramMap);
//    }

    @Override
    public void insertOperPoint(PointInsertVO pointInsertVO) {
        logger.info("lllll~~~~~ pointInsertVO.toString() : " + pointInsertVO.toString());
        sqlSession.insert(namespace + ".insertOperPoint", pointInsertVO);
    }

    @Override
    public void updateOperPoint(PointUpdateVO pointUpdateVO) {
        sqlSession.insert(namespace + ".updateOperPoint", pointUpdateVO);
    }

    @Override
    public void deleteOperPoint(PointDeleteVO pointDeleteVO) {
        sqlSession.insert(namespace + ".deleteOperPoint", pointDeleteVO);
    }

    @Override
    public void balancePointUpdate(String uid, int balancePoint) {

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("uid", uid);
        paramMap.put("upoint", balancePoint);

        logger.info("lllll~~~~~ paramMap.toString() : " + paramMap.toString());

        sqlSession.update(namespace + ".balancePointUpdate", paramMap);
    }

    @Override
    public List<String> userLevelPointGET() {
        return sqlSession.selectList(namespace + ".userLevelPointGET");
    }

    @Override
    public List<String> userColorPointGET(String uday) {
        return sqlSession.selectList(namespace + ".userColorPointGET", uday);
    }
}
