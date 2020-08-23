package org.zerock.persistence;

import org.zerock.domain.BoardVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;

import java.util.List;

/**
 * Created by Emiya-PC on 2018. 5. 1.. PM 7:32
 * What : 글 작성자의 작성글과 댓글을 볼 수 있는 인터페이스.
 * Why :
 * How :
 */
public interface UserInfoDAO {

    /**
     * 게시판의 유저(WRITER) 클릭했을 때. 유저 상세페이지로 이동.
     *
     * @param searchCriteria
     * @return
     * @throws Exception
     */
    List<BoardVO> userInfoList(SearchCriteria searchCriteria) throws Exception;
    int userInfoListCount(SearchCriteria searchCriteria) throws Exception;

    /**
     * 회원정보 수정 페이지에서 회원정보 수정할 때 비밀번호 맞는지 확인하기 위한 GET.
     *
     * @param userVO
     * @return
     * @throws Exception
     */
    String userPassConfirmGET(UserVO userVO) throws Exception;

}
