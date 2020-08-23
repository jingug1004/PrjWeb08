package org.zerock.service;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by wtime on 2017-02-13. ${time}
 * org.zerock.service / Web Ex02
 * Better late than never!
 * What :
 * Why :
 * How :
 */


public interface ReplyService {

    /**
     * Add reply.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    void addReply(ReplyVO vo, HttpSession httpSession) throws Exception;

    /**
     * Ajax 댓글 처리의 REST 방식의 ReplyController 작성 중 댓글 처리를 위한 서비스.
     *
     * @param bno the bno
     * @return the list
     * @throws Exception the exception
     */
    List<ReplyVO> listReply(Integer bno) throws Exception;

    /**
     * Modify reply.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    void modifyReply(ReplyVO vo) throws Exception;

    /**
     * Remove reply.
     *
     * @param rno the rno
     * @throws Exception the exception
     */
    void removeReply(Integer rno, HttpSession httpSession) throws Exception;

    /**
     * Ajax 댓글 처리의 REST 방식의 ReplyController 작성 중 댓글 처리를 위한 서비스.
     *
     * @param bno the bno
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception;

    /**
     * Ajax 댓글 처리의 REST 방식의 ReplyController 작성 중 댓글 처리를 위한 서비스.
     *
     * @param bno the bno
     * @return the int
     * @throws Exception the exception
     */
    int count(Integer bno) throws Exception;

}
