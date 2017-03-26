package org.zerock.persistence;

import org.zerock.domain.MessageVO;

/**
 * Created by macbookpro on 2017. 2. 19. PM 2:11
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What : AOP와 트랜잭션 처리를 위한 준비(테스트).
 * Why :
 * How : MessageDAO는 메시지에 대한 등록과 수정, 업데이트만 처리하도록 작성되어 있고, 사용자의 활동에 따른 처리는 PointDAO라는 것을 작성해서 처리.
 */


public interface MessageDAO {

    /**
     * Create.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    public void create(MessageVO vo) throws Exception;

    /**
     * Read message message vo.
     *
     * @param mno the mno
     * @return the message vo
     * @throws Exception the exception
     */
    public MessageVO readMessage(Integer mno) throws Exception;

    /**
     * Update state.
     *
     * @param mno the mno
     * @throws Exception the exception
     */
    public void updateState(Integer mno) throws Exception;

}
