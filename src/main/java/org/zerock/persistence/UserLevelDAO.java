package org.zerock.persistence;

import org.zerock.domain.UserVO;

/**
 * Created by EmiyaPC on 2018. 01. 09. PM 7:37
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What : Lv1~100 까지 순위 렌더링
 * Why :
 * How :
 */


public interface UserLevelDAO {

    void userLevelPostUserUPD(UserVO userVO) throws Exception;         // (비로그인)게시물 올린 회원의 전체 순위 Lv.0 ~ Lv.100
    void userLevelColorUserUPD(UserVO userVO) throws Exception;        // (비로그인)게시물 올린 회원의 전체 순위 Lv.0 ~ Lv.100

    void userLevelLoginUserUPD() throws Exception;        // (로그인)로그인 회원의 전체 순위 Lv.0 ~ Lv.100

    void userAllUserUPD() throws Exception;               // 전체 회원의 전체, 칼라 순위 Lv.0 ~ Lv.100

}
