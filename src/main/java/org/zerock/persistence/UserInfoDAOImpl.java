package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.UserVO;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by Emiya-PC on 2018. 5. 1.. PM 8:24
 * What : 글 작성자의 작성글과 댓글을 볼 수 있는 DAOImpl 클래스.
 * Why :
 * How :
 */
@Repository
public class UserInfoDAOImpl implements UserInfoDAO {

    private static final Logger logger = LoggerFactory.getLogger(UserInfoDAOImpl.class);

    @Inject
    private SqlSession session;

    /* UserInfoMapper 하면 오류남. 앞에 소문자 'u' userInfoMapper 해야 오류 안 남 */
    private static String namespace = "org.zerock.mapper.userInfoMapper";

    @Override
    public List<BoardVO> userInfoList(String loginid) throws Exception {
        return session.selectList(namespace + ".userInfoList", loginid);
    }

    @Override
    public int userInfoListCount(String loginid) throws Exception {
        return session.selectOne(namespace + ".userInfoListCount", loginid);
    }

    @Override
    public String userPassConfirmGET(UserVO userVO) throws Exception {
        logger.info("lll~~~ userVO 01 : " + userVO.toString());
        return session.selectOne(namespace + ".userPassConfirmGET", userVO);
    }
}
