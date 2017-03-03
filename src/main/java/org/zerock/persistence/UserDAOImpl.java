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
 */

@Repository
public class UserDAOImpl implements UserDAO{

    @Inject
    private SqlSession session;

    private static String namespace = "org.zerock.mapper.UserMapper";

    @Override
    public UserVO login(LoginDTO dto) throws Exception {

        return session.selectOne(namespace + ".login", dto);
    }

    @Override
    public void keepLogin(String uid, String sessionId, Date next) {

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("uid", uid);
        paramMap.put("sessionId", sessionId);
        paramMap.put("next", next);

        session.update(namespace + ".keepLogin", paramMap);

    }

    @Override
    public UserVO checkUserWithSessionKey(String value) {

        return session.selectOne(namespace + ".checkUserWithSessionKey", value);
    }

    @Override
    public void create(UserVO uvo) throws Exception {

        session.insert(namespace + ".create", uvo);
    }


}
