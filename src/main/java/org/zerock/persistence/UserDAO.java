package org.zerock.persistence;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

import java.util.Date;

/**
 * Created by macbookpro on 2017. 2. 26. PM 7:37
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 */


public interface UserDAO {

    public UserVO login(LoginDTO dto) throws Exception;

    public void keepLogin(String uid, String sessionId, Date next);

    public UserVO checkUserWithSessionKey(String value);

    public void create(UserVO uvo) throws Exception;

//    public UserVO readEmail(String email) throws Exception;

}
