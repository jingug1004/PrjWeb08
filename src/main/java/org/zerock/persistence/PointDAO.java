package org.zerock.persistence;

import org.zerock.domain.PointDeleteVO;
import org.zerock.domain.PointInsertVO;
import org.zerock.domain.PointUpdateVO;

import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:16
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What : AOP와 트랜잭션 처리를 위한 준비(테스트).
 * Why : 메시지 전송이나 개봉에 따라서 달라지는 사용자의 포린트를 처리하기 위해서 PointDAO를 설정.
 * How : MessageDAO에 추가적인 메소드를 선언해서 사용하는 것도 가능하지만, 포인트와 메시지는 다른 도메인이므로 분리.
 */
public interface PointDAO {

//    /**
//     * Update point.
//     *
//     * @param uid   the uid
//     * @param point the point
//     * @throws Exception the exception
//     */
//    public void updatePoint(String uid, int point) throws Exception;

    /* 글 작성할 때 포인트 추가, 제거 */
    public void insertOperPoint(PointInsertVO pointInsertVO) throws Exception;

    public void updateOperPoint(PointUpdateVO pointUpdateVO) throws Exception;

    public void deleteOperPoint(PointDeleteVO pointDeleteVO) throws Exception;

    public void balancePointUpdate(String uid, int balancePoint) throws Exception;
    /* 글 작성할 때 포인트 추가, 제거 */

    /* 유저의 전체, 칼라별 레벨 순번을 가져오기 위한 전체 리스트 */
    public List<String> userLevelPointGET () throws Exception;                  // 전체 회원의 upoint에 따른 내림차순

    /* 유저의 전체, 칼라별 레벨 순번을 가져오기 위한 전체 리스트 */
    public List<String> userColorPointGET (String uday) throws Exception;                  // 전체 회원의 upoint에 따른 내림차순


}
