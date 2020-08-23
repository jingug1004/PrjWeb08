package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.SearchCriteria;
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
    public List<BoardVO> userInfoList(SearchCriteria searchCriteria) {
        return session.selectList(namespace + ".userInfoList", searchCriteria);
    }

    @Override
    public int userInfoListCount(SearchCriteria searchCriteria) {
        return session.selectOne(namespace + ".userInfoListCount", searchCriteria);
    }

    @Override
    public String userPassConfirmGET(UserVO userVO) {
        return session.selectOne(namespace + ".userPassConfirmGET", userVO);
    }
}
