package org.zerock.service;

import org.zerock.domain.UserModifyVO;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

import java.util.Date;

/**
 * Created by macbookpro on 2017. 2. 26. PM 7:52
 * sp4chap11-Project / org.zerock.service
 * No pain, No gain!
 * What : UserService interface
 * Why : HttpSession을 이용하여 로그인 데이터를 가져오기 위하여
 * How : UserService 인터페이스니 구현 클래스를 만들어야 한다
 */
public interface UserService {

    /**
     * Login user vo. 로그인 했을 때의 쿠키 세션을 이용하려고
     *
     * @param dto the dto LoginDTO의 uid, upw, useCookie의 요청 파라미터를 가져옴
     * @return the user vo 회원가입한 회원 정보의 VO가 필요하니깐
     * @throws Exception the exception
     */
    public UserVO login(LoginDTO dto) throws Exception;

    public void loginIpUpd(UserVO userVO) throws Exception;

    public UserVO loginInfoNoPW(String uid) throws Exception;

    /**
     * Keep login. 로그인 정보를 유지하는 keepLogin과 과거에 접속한 사용자인지를 확인하는 기능을 작성
     *
     * @param uid       the uid
     * @param sessionId the session id
     * @param next      the next
     * @throws Exception the exception
     */
    public void keepLogin(String uid, String sessionId, Date next) throws Exception;

    /**
     * Check login before user vo.
     *
     * @param value the value
     * @return the user vo
     */
    public UserVO checkLoginBefore(String value);

    /**
     * Regist.
     *
     * @param user the user
     * @throws Exception the exception
     */
    public void regist(UserVO user) throws Exception;
    public int registUsersNumGET() throws Exception;

    public void createLog(UserModifyVO userModifyVO) throws Exception;

    public void loginUserInfoUPDATE(UserVO userVO) throws Exception;

}
