package org.zerock.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.persistence.*;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 4.. PM 1:04
 * What :
 * Why :
 * How : 클래스 선언부에는 스프링의 빈으로 인식되기 위해서 @Service 애노테이션이 적용된 것을 볼 수 있음.
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Inject
    private BoardDAO boardDAO;                          // 게시글

    @Inject
    private PointDAO pointDAO;                          // 포인트 증가, 차감

    @Inject
    private UserDAO userDAO;                            // 유저 정보

    @Inject
    private UserColorDAO userColorDAO;                  // 각 정당의 색깔에 맞게 구분

    @Inject
    private UserLevelDAO userLevelDAO;                  // Lv0~100

    @Inject
    private UserInfoDAO userInfoDAO;                    // 글 작성자의 게시글과 댓글

    private static final Logger logger = LoggerFactory.getLogger(UserInfoServiceImpl.class);

    @Override
    public List<BoardVO> userInfoList(SearchCriteria searchCriteria) throws Exception {
        return userInfoDAO.userInfoList(searchCriteria);
    }

    @Override
    public int userInfoListCount(SearchCriteria searchCriteria) throws Exception {
        return userInfoDAO.userInfoListCount(searchCriteria);
    }

    @Override
    public String userPassConfirmGET(UserVO userVO) throws Exception {
        return userInfoDAO.userPassConfirmGET(userVO);
    }
}
