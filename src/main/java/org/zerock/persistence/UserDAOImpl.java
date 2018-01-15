package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

import javax.inject.Inject;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by macbookpro on 2017. 2. 26. PM 7:42
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What : UserDAOImpl.java
 * Why : UserDAO 인터페이스를 @Override해서 구현하기 위해
 * How : UserDAO 인터페이스 만든 후 마이바티스 userMapper.xml 파일 만들고 UserDAOImpl 만듦
 */
@Repository
public class UserDAOImpl implements UserDAO {

    @Inject
    private SqlSession sqlSession;

    private static String namespace = "org.zerock.mapper.UserMapper";

    @Override
    public UserVO login(LoginDTO dto) throws Exception {
        return sqlSession.selectOne(namespace + ".login", dto);
    }

    @Override
    public UserVO loginInfoNoPW(String uid) throws Exception {
        return sqlSession.selectOne(namespace + ".loginInfoNoPW", uid);
    }

    @Override
    public void loginIpUpd(UserVO userVO) throws Exception {
        sqlSession.update(namespace + ".loginIpUpd", userVO);
    }

    @Override
    public void keepLogin(String uid, String sessionId, Date next) {

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("uid", uid);
        paramMap.put("sessionId", sessionId);
        paramMap.put("next", next);

        sqlSession.update(namespace + ".keepLogin", paramMap);

    }

    @Override
    public UserVO checkUserWithSessionKey(String value) {

        return sqlSession.selectOne(namespace + ".checkUserWithSessionKey", value);
    }

    @Override
    public void create(UserVO uvo) throws Exception {

        sqlSession.insert(namespace + ".create", uvo);
    }

    /* 총 회원가입수 GET 하는 메소드 */
    @Override
    public int registUsersNumGET() throws Exception {
        return sqlSession.selectOne(namespace + ".registUsersNumGET");
    }

    @Override
    public int registColorNumGET(String uday) throws Exception {
        return sqlSession.selectOne(namespace + ".registColorNumGET", uday);
    }

    /* 글 작성시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */
    @Override
    public void totalUserPostNumUPD(UserVO userVO) throws Exception {
        sqlSession.update(namespace + ".totalUserPostNumUPD", userVO);
    }

    /* 댓글 작성시 접속한 유저의 아이디를 통해서 총 댓글 등록수 구함 */
    @Override
    public void totalUserReplyNumUPD(UserVO userVO) throws Exception {
        sqlSession.update(namespace + ".totalUserReplyNumUPD", userVO);
    }
}
