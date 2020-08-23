package org.zerock.service;

import org.zerock.domain.MessageVO;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:18
 * sp4chap11-Project / org.zerock.service
 * No pain, No gain!
 * What : AOP와 트랜잭션 처리를 위한 준비(테스트).
 * Why : MessageService가 기존의 서비스 객체와 다른 점은 두 개의 DAO를 같이 활용해서 하나의 비지니스 로직을 완성하는 형태로 사용하기 때문에 MessageDAO와 PointDAO를 함께 사용한다는 점.
 * How : 코드를 보면 알 수 있듯이 MessageService 메소드를 실행하기 위해서는 한 번에 여러 작업이 동시에 이뤄져야 하는 로직으로 구성.
 */


public interface MessageService {

    /**
     * addMessage()의 메시지를 추가하는 부분을 보면 MessageDAO에 create()를 호출해서 새로운 메시지를 추가하지만, 이와 같이 PointDAO를 이용해서 메시지를 보낸 사람에게 10점을 추가해주는 작업을 같이 실행.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    void addMessage(MessageVO vo) throws Exception;

    /**
     * Read message message vo.
     *
     * @param uid the uid
     * @param mno the mno
     * @return the message vo
     * @throws Exception the exception
     */
    MessageVO readMessage(String uid, Integer mno) throws Exception;

}
