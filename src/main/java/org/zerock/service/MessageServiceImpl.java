package org.zerock.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MessageVO;
import org.zerock.persistence.MessageDAO;
import org.zerock.persistence.PointDAO;

import javax.inject.Inject;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:19
 * sp4chap11-Project / org.zerock.service
 * No pain, No gain!
 * What : AOP와 트랜잭션 처리를 위한 준비(테스트).
 * Why : MessageService가 기존의 서비스 객체와 다른 점은 두 개의 DAO를 같이 활용해서 하나의 비지니스 로직을 완성하는 형태로 사용하기 때문에 MessageDAO와 PointDAO를 함께 사용한다는 점.
 * How : 코드를 보면 알 수 있듯이 MessageService 메소드를 실행하기 위해서는 한 번에 여러 작업이 동시에 이뤄져야 하는 로직으로 구성.
 */
@Service
public class MessageServiceImpl implements MessageService {

    @Inject
    private MessageDAO messageDAO;

    @Inject
    private PointDAO pointDAO;


    @Transactional
    @Override
    public void addMessage(MessageVO vo) throws Exception {

        messageDAO.create(vo);
        pointDAO.balancePointUpdate(vo.getSender(), 10);
    }

    /**
     * readMessage()에서는 메시지를 조회하기 때문에 1) 메시지의 상태가 변경되야 하고(messageDAO.updateState()), 2) 메시지를 본 사람의 포인트가 5점 증가(pointDAO.updatePoint()).
     *
     * @param uid the uid
     * @param mno the mno
     * @return 3) 모든 작업 후 메시지를 조회해서 반환(messageDAO.readMessage()).
     * @throws Exception the exception
     */
    @Override
    public MessageVO readMessage(String uid, Integer mno) throws Exception {

        messageDAO.updateState(mno);

        pointDAO.balancePointUpdate(uid, 5);

        return messageDAO.readMessage(mno);
    }
}
