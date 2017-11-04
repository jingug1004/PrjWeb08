package org.zerock.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.PointDAO;
import org.zerock.persistence.ReplyDAO;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by wtime on 2017-02-13. ${time}
 * org.zerock.service / Web Ex02
 * Better late than never!
 * What :
 * Why :
 * How : 댓글의 등록과 삭제시 처리할 부분이 있기 때문에 BoardDAO를 같이 사용하도록 다음과 2개의 @Inject.
 */
@Service
public class ReplyServiceImpl implements ReplyService {

    @Inject
    private ReplyDAO replyDAO;

    @Inject
    private BoardDAO boardDAO;

    @Inject
    private PointDAO pointDAO;

//    @Override
//    public void addReply(ReplyVO vo) throws Exception {
//
//        replyDAO.create(vo);
//    }

    /**
     * 새로운 댓글이 추가되면 tbl_board의 replycnt 칼럼의 값을 1 증가시키는 작업과 댓글이 삭제될 때 replycnt 칼럼의 값을 -1 시키는 작업으로 수정하고 @Transactional을 이용해서 처리.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    @Transactional
    @Override
    public void addReply(ReplyVO vo) throws Exception {

//        Object object = httpSession.getAttribute("login");
//        UserVO loginUserVO = (UserVO) object;
//        if (object != null) {
//        }

        replyDAO.create(vo);
        boardDAO.updateReplyCnt(vo.getBno(), 1);

//        ReplyVO replyVO = new ReplyVO();

//        PointUtils pointUtils = new PointUtils(loginUserVO.getUid(), vo.getRno(), "댓글 작성", Integer.parseInt(UnifyMessage.getMessage("ReplyWriterPoint")));
//
//        PointInsertVO pointInsertVO = new PointInsertVO();
//        pointInsertVO.setPinsid(vo.getRid());
//        pointInsertVO.setPinspoint(Integer.parseInt(UnifyMessage.getMessage("ReplyWriterPoint")));
//        pointInsertVO.setPinsdeldate(pointUtils.getDeleteScheduleDate());
//        pointInsertVO.setPinscontent(pointUtils.getSavingPointContent());

    }

    /**
     * 새로운 댓글이 추가되면 tbl_board의 replycnt 칼럼의 값을 1 증가시키는 작업과 댓글이 삭제될 때 replycnt 칼럼의 값을 -1 시키는 작업으로 수정하고 @Transactional을 이용해서 처리.
     *
     * @param rno
     * @throws Exception the exception
     */
    @Transactional
    @Override
    public void removeReply(Integer rno) throws Exception {

        /* tbl_board의 replycnt 칼럼의 값을 1 증가시키는 작업과 댓글이 삭제될 때 replycnt 칼럼의 값을 -1 시키는 작업 */
        int bno = replyDAO.getBno(rno);
        replyDAO.delete(rno);                   // MyBatis 맵퍼 딜리트에서 업데이트로 변경
        boardDAO.updateReplyCnt(bno, -1);
        /* tbl_board의 replycnt 칼럼의 값을 1 증가시키는 작업과 댓글이 삭제될 때 replycnt 칼럼의 값을 -1 시키는 작업 */

    }

    @Override
    public List<ReplyVO> listReply(Integer bno) throws Exception {

        return replyDAO.list(bno);
    }

    @Override
    public void modifyReply(ReplyVO vo) throws Exception {

        replyDAO.update(vo);
    }

//    @Override
//    public void removeReply(Integer rno) throws Exception {
//
//        replyDAO.delete(rno);
//    }

    @Override
    public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) throws Exception {

        return replyDAO.listPage(bno, cri);
    }

    @Override
    public int count(Integer bno) throws Exception {

        return replyDAO.count(bno);
    }


}
