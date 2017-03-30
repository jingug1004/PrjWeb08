package org.zerock.persistence;

import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import java.util.List;

/**
 * Created by wtime on 2017-02-13. ${time}
 * org.zerock.persistence / Web Ex02
 * Better late than never!
 * What : Ajax 댓글 처리를 위한 REST와 도메인 객체 설계 인터페이스.
 * Why :
 * How :
 */


public interface ReplyDAO {

    /**
     * List list.
     *
     * @param bno the bno
     * @return the list
     * @throws Exception the exception
     */
    public List<ReplyVO> list(Integer bno) throws Exception;

    /**
     * Create.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    public void create(ReplyVO vo) throws Exception;

    /**
     * Update.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    public void update(ReplyVO vo) throws Exception;

    /**
     * Delete.
     *
     * @param rno the rno
     * @throws Exception the exception
     */
    public void delete(Integer rno) throws Exception;

    /**
     * List page list.
     *
     * @param bno the bno
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;

    /**
     * Count int.
     *
     * @param bno the bno
     * @return the int
     * @throws Exception the exception
     */
    public int count(Integer bno) throws Exception;

    /**
     * 댓글이 삭제될 때 해당 게시물의 번호를 알아내는 기능을 추가.
     *
     * @param rno the rno
     * @return the bno
     * @throws Exception the exception
     */
    public int getBno(Integer rno) throws Exception;

}
