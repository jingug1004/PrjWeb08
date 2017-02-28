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
}
