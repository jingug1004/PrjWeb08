package org.zerock.persistence;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:16
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What : AOP와 트랜잭션 처리를 위한 준비(테스트).
 * Why : 메시지 전송이나 개봉에 따라서 달라지는 사용자의 포린트를 처리하기 위해서 PointDAO를 설정.
 * How : MessageDAO에 추가적인 메소드를 선언해서 사용하는 것도 가능하지만, 포인트와 메시지는 다른 도메인이므로 분리.
 */


public interface PointDAO {

    /**
     * Update point.
     *
     * @param uid   the uid
     * @param point the point
     * @throws Exception the exception
     */
    public void updatePoint(String uid, int point)throws Exception;
}
