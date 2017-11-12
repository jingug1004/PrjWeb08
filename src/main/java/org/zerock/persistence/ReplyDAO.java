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
 *
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

    public ReplyVO readByIDnBnonText (ReplyVO replyVO) throws Exception;

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
     * REST 방식의 경우 전통적인 Model 객체에 데이터를 담지 않고 객체를 처리할 수 있기 때문에 메소드의 파라미터 처리가 조금 달라지긴 해도 간단하게 처리 가능.
     *
     * @param bno 기존 페이징 처리에 사용하는 Criteria를 그대로 활용하고, 추가로 게시물 번호에 맞는 데이터를 검색하기 위해서 'bno'를 추가해서 사용.
     * @param cri 기존 페이징 처리에 사용하는 Criteria를 그대로 활용하고, 추가로 게시물 번호에 맞는 데이터를 검색하기 위해서 'bno'를 추가해서 사용.
     * @return the list
     * @throws Exception the exception
     */
    public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;

    /**
     * 화면에 페이징 처리를 하기 위해서는 반드시 해당 게시물의 댓글 수가 필요하므로 count()를 작성.
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

    public int totalUserReplyNumGET(String uid) throws Exception;

    public int totalColorReplyNumGet(String getColor) throws Exception;

}
