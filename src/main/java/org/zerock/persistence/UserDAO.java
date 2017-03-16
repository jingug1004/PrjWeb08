package org.zerock.persistence;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

import java.util.Date;

/**
 * Created by macbookpro on 2017. 2. 26. PM 7:37
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What : UserDAO 인터페이스
 * Why : Service에서 의존성 주입을 받기 위해
 * How : 인터페이스 선언만 하고 B/L은 인터페이스 구현할 UserDAOImpl 클래스에서
 */


public interface UserDAO {

    /**
     * Login user vo. 로그인할 때 사용자의 아이디와 패스워드를 이용해서 사용자의 정보를 조회
     * /resouces/mappers/userMapper.xml과 연결
     *
     * @param dto the dto LoginDTO에는 uid, upw, useCookie 3개의 필드가 있다
     * @return the user vo 사용자의 정보를 등록하거나 수정할 때의 데이터를 보관하는 UserVO 클래스
     * @throws Exception the exception
     */
    public UserVO login(LoginDTO dto) throws Exception;

    /**
     * Keep login.
     *
     * @param uid       the uid
     * @param sessionId the session id
     * @param next      the next
     */
    public void keepLogin(String uid, String sessionId, Date next);

    /**
     * Check user with session key user vo.
     *
     * @param value the value
     * @return the user vo
     */
    public UserVO checkUserWithSessionKey(String value);

    /**
     * Create.
     *
     * @param uvo the uvo
     * @throws Exception the exception
     */
    public void create(UserVO uvo) throws Exception;

//    public UserVO readEmail(String email) throws Exception;

}
