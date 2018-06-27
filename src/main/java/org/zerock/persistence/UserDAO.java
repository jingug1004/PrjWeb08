package org.zerock.persistence;

import org.zerock.domain.UserModifyVO;
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
     * @param dto the dto LoginDTO에는 uid, upw, useCookie 3개의 필드가 있음
     * @return the user vo 사용자의 정보를 등록하거나 수정할 때의 데이터를 보관하는 UserVO 클래스
     * @throws Exception the exception
     */
    public UserVO login(LoginDTO dto) throws Exception;

    public void loginIpUpd(UserVO userVO) throws Exception;

    public UserVO loginInfoNoPW(String uid) throws Exception;

    /**
     * 로그인한 사용자의 sessionKey와 sessionLimit을 업데이트 하는 기능 / userMapper.xml의 keepLogin
     *
     * @param uid       the uid
     * @param sessionId the session id
     * @param next      the next
     */
    public void keepLogin(String uid, String sessionId, Date next);

    /**
     * loginCookie에 기록된 값으로 사용자의 정보를 조회하는 기능을 추가
     *
     * @param value the value
     * @return the user vo
     */
    public UserVO checkUserWithSessionKey(String value);

    /**
     * 유저 생성(회원가입)
     *
     * @param uvo the uvo
     * @throws Exception the exception
     */
    public void create(UserVO uvo) throws Exception;                    // 최초 회원가입

    public void createLog(UserModifyVO userModifyVO) throws Exception;  // 최초 회원가입 로그 이력

    public int registUsersNumGET() throws Exception;                    // 전체 등록된 회원수 GET

    public int registColorNumGET(String uday) throws Exception;         // 전체 등록된 칼라별 회원수 GET - Lv0~100 구하기 위해서

    public void totalUserPostNumUPD(UserVO userVO) throws Exception;    // 전체 유저의 등록한 게시물 수 업데이트

    public void totalUserReplyNumUPD(UserVO userVO) throws Exception;   // 전체 유저의 등록한 댓글 수 업데이트

    public void loginUserInfoUPDATE(UserVO userVO) throws Exception;    // tbl_user 테이블 회원 정보 수정

}
