package org.zerock.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.*;
import org.zerock.persistence.BoardDAO;
import org.zerock.persistence.PointDAO;
import org.zerock.persistence.UserColorDAO;
import org.zerock.persistence.UserDAO;
import org.zerock.util.PointUtils;
import org.zerock.util.UnifyMessage;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 4.. PM 1:04
 * What :
 * Why :
 * How : 클래스 선언부에는 스프링의 빈으로 인식되기 위해서 @Service 애노테이션이 적용된 것을 볼 수 있음.
 */
@Service
public class BoardServiceImpl implements BoardService {

    private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);


    @Inject
    private BoardDAO boardDAO;

    @Inject
    private PointDAO pointDAO;

    @Inject
    private UserDAO userDAO;

    @Inject
    private UserColorDAO userColorDAO;

    /*
    @Override
    public void regist(BoardVO board) throws Exception {
        boardDAO.create(board);
    }
    */

    /**
     * BoardDAO의 create()와 addAttach()를 연속으로 사용하기 때문에 코드는 아래와 같이 트랜잭션을 처리하는 방식으로 변경.
     * 작업의 순서는 먼저 게시물을 등록하는 boardDAO.create()를 호출한 후 첨부파일의 이름 배열을 이용해서 각각의 파일 이름을 데이터베이스에 추가하는 형태로 구현.
     *
     * @param boardVO
     */
    @Transactional
    @Override
    public void regist(BoardVO boardVO, HttpSession httpSession) throws Exception {

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            boardVO.setGetcolor(loginUserVO.getUday());   // 유저의 uday 숫자에 따라서 저장되는 보드 칼라숫자 달라짐
        }

        logger.info("lllll~~~~~ loginUserVO.toString() lllll~~~~~ " + loginUserVO.toString());

        boardDAO.create(boardVO);

        /* 글 작성시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */
        int tgoodnum = boardDAO.totalUserPostNumGET(loginUserVO.getNickname());
        loginUserVO.setTpost(tgoodnum);
        userDAO.totalUserPostNumUPD(loginUserVO);
        /* 글 작성시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */

        /* 글 작성시 칼라별 tbl_color_result로 update 하는 비지니스 로직 */
        int tcPostNum = boardDAO.totalColorPostNumGet(loginUserVO.getUday());
        userColorDAO.totalColorPostNumUPD(tcPostNum, loginUserVO.getUday());
        /* 글 작성시 칼라별 tbl_color_result로 update 하는 비지니스 로직 */

        /* 글 작성시 +50 포인트 */
        boardVO = boardDAO.readByIDnTitle(boardVO);

        PointUtils pointUtils = new PointUtils(loginUserVO.getUid(), boardVO.getBno(), "글 작성", Integer.parseInt(UnifyMessage.getMessage("BoardWritePoint")));

        PointInsertVO pointInsertVO = new PointInsertVO();
        pointInsertVO.setPinsid(loginUserVO.getUid());
        pointInsertVO.setPinspoint(Integer.parseInt(UnifyMessage.getMessage("BoardWritePoint")));
        pointInsertVO.setPinsdeldate(pointUtils.getDeleteScheduleDate());
        pointInsertVO.setPinscontent(pointUtils.getSavingPointContent());
        pointDAO.insertOperPoint(pointInsertVO);

        pointUtils.setBalancePoint(loginUserVO.getUpoint());
        pointDAO.balancePointUpdate(loginUserVO.getUid(), Integer.parseInt(UnifyMessage.getMessage("BoardWritePoint")));
        /* 글 작성시 +50 포인트 */

        /* 게시글의 파일 첨부 있을 시, 첨부파일 하나씩 파일 가져옴 */
        String[] files = boardVO.getFiles();
        if (files == null) {
            return;
        }

        for (String fileName : files) {
            boardDAO.addAttach(fileName);
        }
        /* 게시글의 파일 첨부 있을 시, 첨부파일 하나씩 파일 가져옴 */

    }

//    @Override
//    public BoardVO read(Integer bno) throws Exception {
//        return boardDAO.read(bno);
//    }

    /**
     * 트랜잭션의 격리 수준은 사실 데이터베이스가 기본으로 사용하는 수준으로 다른 연결이 커밋하지 않은 데이터는 볼 수 없도록 함.
     *
     * @param bno 게시판 상세 글 조회를 위한 게시글 번호
     */
    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public BoardVO read(Integer bno) throws Exception {

        /* 조회수 증가(업데이트) */
        boardDAO.updateViewCnt(bno);

        return boardDAO.read(bno);
    }

    @Override
    public BoardVO readByIDnTitle(BoardVO boardVO) throws Exception {
        return boardDAO.readByIDnTitle(boardVO);
    }

    @Override
    public String callCateName(int bno) throws Exception {
        return boardDAO.callCateName(bno);               // 게시판 상세 글의 카테고리 이름 출력
    }

    @Override
    public String callCateNameInList(int cateNum) throws Exception {
        return boardDAO.callCateNameInList(cateNum);     // 게시판 리스트(목록 - List)의 카테고리 이름 출력
    }

    /*
    @Override
    public void modify(BoardVO board) throws Exception {
        boardDAO.update(board);
    }
    */


    /**
     * 첨부파일이 존재하는 경우 게시물의 수정은 '원래의 게시물 수정' + '기존 첨부파일 목록 삭제' + '새로운 첨부파일 정보 입력'의 세가지 작업이 함께 이뤄져야 하기 때문에 트랜잭션으로 처리.
     *
     * @param board
     */
    @Transactional
    @Override
    public void modify(BoardVO board) throws Exception {
        boardDAO.update(board);

        Integer bno = board.getBno();

        boardDAO.deleteAttach(bno);

        String[] files = board.getFiles();

        if (files == null) {
            return;
        }

        for (String fileName : files) {
            boardDAO.replaceAttach(fileName, bno);
        }
    }

    /**
     * 데이터베이스에 저장된 첨부파일의 정보와 게시물의 삭제 작업.
     * 삭제 작업의 경우 tbl_attach가 tbl_board를 참조하기 때문에 반드시 첨부파일과 관련된 정보부터 삭제하고, 게시글을 삭제.
     *
     * @param bno
     */
    @Transactional
    @Override
    public void remove(Integer bno, HttpSession httpSession) throws Exception {
        boardDAO.deleteAttach(bno);
        boardDAO.delete(bno);

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            // boardVO.setGetcolor(loginUserVO.getUday());   // 유저의 uday 숫자에 따라서 저장되는 보드 칼라숫자 달라짐
        }

        /* 글 작성시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */
        int tPostNum = boardDAO.totalUserPostNumGET(loginUserVO.getNickname());
        loginUserVO.setTpost(tPostNum);
        userDAO.totalUserPostNumUPD(loginUserVO);
        /* 글 작성시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */

        /* 글 작성시 칼라별 tbl_color_result로 update 하는 비지니스 로직 */
        int tcPostNum = boardDAO.totalColorPostNumGet(loginUserVO.getUday());
        userColorDAO.totalColorPostNumUPD(tcPostNum, loginUserVO.getUday());
        /* 글 작성시 칼라별 tbl_color_result로 update 하는 비지니스 로직 */


        PointUtils pointUtils = new PointUtils(loginUserVO.getUid(), Integer.parseInt(UnifyMessage.getMessage("BoardDeletePoint")), "글 삭제", (Integer) bno);

       /* 글 작성시 -49 포인트 */
        PointUpdateVO pointUpdateVO = new PointUpdateVO();
        pointUpdateVO.setPupdid(loginUserVO.getUid());
        pointUpdateVO.setPupdpoint(Integer.parseInt(UnifyMessage.getMessage("BoardDeletePoint")));
        pointUpdateVO.setPupdcontent(pointUtils.getUsePointContent());

        pointUtils.setBalancePoint(loginUserVO.getUpoint());

        pointDAO.updateOperPoint(pointUpdateVO);
        pointDAO.balancePointUpdate(loginUserVO.getUid(), pointUtils.getBalancePoint());

        PointDeleteVO pointDeleteVO = new PointDeleteVO();
        pointDeleteVO.setPdelid(loginUserVO.getUid());
        pointDeleteVO.setPdelpoint(Integer.parseInt(UnifyMessage.getMessage("BoardDeletePoint")));
        pointDeleteVO.setPdelcontent(pointUtils.getExtinctPointContent());
        pointDAO.deleteOperPoint(pointDeleteVO);
       /* 글 작성시 -49 포인트 */

    }

    // 정말 무시하자! 옛날 거!
    @Override
    public List<BoardVO> listAll() throws Exception {
        return boardDAO.listAll();
    }

    @Override
    public List<BoardVO> listCriteria(Criteria cri) throws Exception {
        return boardDAO.listCriteria(cri);
    }

    // 이거 안 씀. 밑의 listSearchCount 씀
    @Override
    public int listCountCriteria(Criteria cri) throws Exception {
        return boardDAO.countPaging(cri);
    }

    // 글 목록 불러오기
    @Override
    public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
        return boardDAO.listSearch(cri);
    }

    @Override
    public List<BoardVO> listSearchAny(SearchCriteriaListAny criteria) throws Exception {
        return boardDAO.listSearchAny(criteria);
    }

    @Override
    public int listSearchCount(SearchCriteria cri) throws Exception {
        return boardDAO.listSearchCount(cri);
    }

    @Override
    public int listSearchAnyCount(SearchCriteriaListAny criteria) throws Exception {
        return boardDAO.listSearchAnyCount(criteria);
    }

    @Override
    public List<String> getAttach(Integer bno) throws Exception {
        return boardDAO.getAttach(bno);
    }


}
