package org.zerock.service;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

/**
 * Created by macbookpro on 2017. 2. 26. PM 7:52
 * sp4chap11-Project / org.zerock.service
 * No pain, No gain!
 */

public interface UserService {

    public UserVO login(LoginDTO dto) throws Exception;

}
