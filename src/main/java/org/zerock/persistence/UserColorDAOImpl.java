package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by macbookpro on 2017. 10. 29. PM 7:42
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What :
 * Why :
 * How :
 */
@Repository
public class UserColorDAOImpl implements UserColorDAO {

    @Inject
    private SqlSession sqlSession;

    private static String namespace = "org.zerock.mapper.UserColorMapper";

    @Override
    public int userColorInputGET(String userColor) throws Exception {
        return sqlSession.selectOne(namespace + ".userColorInputGET", userColor);
    }

    @Override
    public void userColorInputTotalUpd(int userColorNum, String userColor) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userColorNum", userColorNum);
        paramMap.put("userColor", userColor);

        sqlSession.update(namespace + ".userColorInputTotalUpd", paramMap);
    }

    @Override
    public void totalColorPostNumUPD(int getTotalPostNumByColor, String userColor) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("getTotalPostNumByColor", getTotalPostNumByColor);
        paramMap.put("userColor", userColor);

        sqlSession.update(namespace + ".totalColorPostNumUPD", paramMap);
    }

    @Override
    public void totalColorReplyNumUPD(int getTotalReplyNumByColor, String userColor) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("getTotalReplyNumByColor", getTotalReplyNumByColor);
        paramMap.put("userColor", userColor);

        sqlSession.update(namespace + ".totalColorReplyNumUPD", paramMap);
    }
}
