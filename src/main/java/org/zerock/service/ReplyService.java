package org.zerock.service;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

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
    public void addReply(ReplyVO vo) throws Exception;

    /**
     * List reply list.
     *
     * @param bno the bno
     * @return the list
     * @throws Exception the exception
     */
    public List<ReplyVO> listReply(Integer bno) throws Exception;

    /**
     * Modify reply.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    public void modifyReply(ReplyVO vo) throws Exception;

    /**
     * Remove reply.
     *
     * @param rno the rno
     * @throws Exception the exception
     */
    public void removeReply(Integer rno) throws Exception;

    /**
     * List reply page list.
     *
     * @param bno the bno
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception;

    /**
     * Count int.
     *
     * @param bno the bno
     * @return the int
     * @throws Exception the exception
     */
    public int count(Integer bno) throws Exception;

}
