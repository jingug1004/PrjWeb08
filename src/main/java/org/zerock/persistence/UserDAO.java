package org.zerock.persistence;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

/**
 * Created by macbookpro on 2017. 2. 26. PM 7:37
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 */


public interface UserDAO {

    public UserVO login(LoginDTO dto) throws Exception;

}
