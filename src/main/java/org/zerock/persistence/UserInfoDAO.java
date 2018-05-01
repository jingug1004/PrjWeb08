package org.zerock.persistence;

import org.zerock.domain.BoardVO;

import java.util.List;

/**
 * Created by Emiya-PC on 2018. 5. 1.. PM 7:32
 * What : 글 작성자의 작성글과 댓글을 볼 수 있는 인터페이스.
 * Why :
 * How :
 */
public interface UserInfoDAO {

    public List<BoardVO> userInfoList(String loginid) throws Exception;
    public int userInfoListCount(String loginid) throws Exception;


}
