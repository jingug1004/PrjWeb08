package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.UserVO;

import javax.inject.Inject;

/**
 * Created by EmiyaPC on 2018. 01. 09. PM 7:42
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What :
 * Why :
 * How :
 */
@Repository
public class UserLevelDAOImpl implements UserLevelDAO {

    @Inject
    private SqlSession sqlSession;

    private static String namespace = "org.zerock.mapper.UserLevelMapper";

//    @Override
//    public void userLevelPostUserUPD(UserVO userVO) throws Exception {
//        sqlSession.update(namespace + ".userLevelPostUserUPD", userVO);
//    }

    @Override
    public void userLevelLoginUserUPD() throws Exception {

    }

    @Override
    public void userAllUserUPD() throws Exception {

    }

    @Override
    public void userLevelPostUserUPD(UserVO userVO) throws Exception {
        sqlSession.update(namespace + ".userLevelPostUserUPD", userVO);
    }

    @Override
    public void userLevelColorUserUPD(UserVO userVO) throws Exception {
        sqlSession.update(namespace + ".userLevelColorUserUPD", userVO);
    }
}
