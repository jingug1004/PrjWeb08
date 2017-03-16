package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.persistence.UserDAO;

import javax.inject.Inject;
import java.util.Date;

/**
 * Created by macbookpro on 2017. 2. 26. PM 7:53
 * sp4chap11-Project / org.zerock.service
 * No pain, No gain!
 * What : UserServiceImpl 클래스
 * Why : UserService interface에서 설정한(선언한) 메소드를 구현하려고
 * How : UserDAO에 의존성 주입하고 implemets(구현)함으로서 B/L 처리
 */

@Service
public class UserServiceImpl implements UserService {

    @Inject
    private UserDAO dao;

    @Override
    public UserVO login(LoginDTO dto) throws Exception {

        return dao.login(dto);
    }

    @Override
    public void keepLogin(String uid, String sessionId, Date next) throws Exception {

        dao.keepLogin(uid, sessionId, next);
    }

    @Override
    public UserVO checkLoginBefore(String value) {

        return dao.checkUserWithSessionKey(value);
    }

    @Override
    public void regist(UserVO user) throws Exception {

        dao.create(user);
    }
}
