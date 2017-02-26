package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.persistence.UserDAO;

import javax.inject.Inject;

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
}
