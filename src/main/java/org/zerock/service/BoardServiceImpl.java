package org.zerock.service;

import com.mysql.jdbc.StringUtils;
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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        boardDAO.create(boardVO);

        /* 글 작성시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */
        int tPostNum = boardDAO.totalUserPostNumGET(loginUserVO.getUid());
        loginUserVO.setTpost(tPostNum);
        userDAO.totalUserPostNumUPD(loginUserVO);
        /* 글 작성시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */

        /* 글 작성시 칼라별 tbl_color_result로 update 하는 비지니스 로직 */
        int tcPostNum = boardDAO.totalColorPostNumGet(loginUserVO.getUday());
        userColorDAO.totalColorPostNumUPD(tcPostNum, loginUserVO.getUday());
        /* 글 작성시 칼라별 tbl_color_result로 update 하는 비지니스 로직 */

        /* 글 작성시 +50 포인트 */
        BoardVO boardVOExceptFile;                  // 첨부파일은 메소드 시그니처의 파라미터 그대로 가져가야 함으로.
        boardVOExceptFile = boardDAO.readByIDnTitle(boardVO);

        PointUtils pointUtils = new PointUtils(loginUserVO.getUid(), boardVOExceptFile.getBno(), "글 작성", Integer.parseInt(UnifyMessage.getMessage("BoardWritePoint")));

        PointInsertVO pointInsertVO = new PointInsertVO();
        pointInsertVO.setPinsid(loginUserVO.getUid());
        pointInsertVO.setPinspoint(Integer.parseInt(UnifyMessage.getMessage("BoardWritePoint")));
        pointInsertVO.setPinsdeldate(pointUtils.getDeleteScheduleDate());
        pointInsertVO.setPinscontent(pointUtils.getSavingPointContent());
        pointDAO.insertOperPoint(pointInsertVO);

        pointUtils.setBalancePoint(loginUserVO.getUpoint());
        pointDAO.balancePointUpdate(loginUserVO.getUid(), Integer.parseInt(UnifyMessage.getMessage("BoardWritePoint")));
        /* 글 작성시 +50 포인트 */

        System.out.println("lllll~~~~~ pointUtils.set : " + pointUtils.toString());


        /* 게시글의 파일 첨부 있을 시, 첨부파일 하나씩 파일 가져옴 */
        String[] files = boardVO.getFiles();
        if (files == null) {

            System.out.println("lllll~~~~~ files == null : " + files);

            return;
        }

        for (String fileName : files) {

            System.out.println("lllll~~~~~ fileName : " + fileName);
            System.out.println("lllll~~~~~ boardVO.getBno() : " + boardVOExceptFile.getBno());      // boardVO로 하면 lastInsertID가 형성되지 않았기에 sQL 오류 발생.
            boardDAO.addAttach(fileName, boardVOExceptFile.getBno());

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
        return boardDAO.read(bno); // 게시물 전체 내용 가져옴(제목, 내용, 작성자, 등등)
    }

    @Override
    public void cookieBoard(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, int bno, String cateNum) throws Exception {
        Cookie cookies[] = httpServletRequest.getCookies();                                  // 저장된 쿠키 불러오기

        logger.info("lllll~~~~~ 01 : " + cookies.toString());

        Map mapCookie = new HashMap();
        if (httpServletRequest.getCookies() != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie obj = cookies[i];
                mapCookie.put(obj.getName(), obj.getValue());
                logger.info("lllll~~~~~ 02-01 : " + mapCookie.toString());
                logger.info("lllll~~~~~ 02-02 : " + mapCookie.keySet());
            }
        }

        // 저장된 쿠키중에 viewcnt만 불러오기    @BoardVO.java     private int viewcnt;        // 게시글 조회수
        String cookie_viewcnt = (String) mapCookie.get(cateNum);

        // 저잘될 새로운 쿠키값 생성
        String new_cookie_viewcnt = "|" + bno;

        // 저장된 쿠키에 새로운 쿠키값이 존재하는지 검사
        if (StringUtils.indexOfIgnoreCase(cookie_viewcnt, new_cookie_viewcnt) == -1) {
            Cookie cookie = new Cookie(cateNum, cookie_viewcnt + new_cookie_viewcnt); // 없을 경우 쿠키 생성
            cookie.setMaxAge(60 * 60 * 24);
            httpServletResponse.addCookie(cookie);                                           // cookie.setmaxAge(1000); // 초단위

            boardDAO.updateViewCnt(bno);                                                     // 조회수 증가(업데이트)
        }
    }


    @Override
    public void updateViewCnt(Integer bno) throws Exception {
        boardDAO.updateViewCnt(bno); // 조회수 증가(업데이트)
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
        boardDAO.delete(bno);           // MyBatis 맵퍼 딜리트에서 업데이트(boardvisible = 'Y') 로 변경

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            // boardVO.setGetcolor(loginUserVO.getUday());   // 유저의 uday 숫자에 따라서 저장되는 보드 칼라숫자 달라짐
        }

        /* 글 삭제시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */
        int tPostNum = boardDAO.totalUserPostNumGET(loginUserVO.getUid()); // 로그인한 유저의 아이디에 따라 총 게시글 수 조회
        loginUserVO.setTpost(tPostNum);
        userDAO.totalUserPostNumUPD(loginUserVO);                               // 로그인한 유저의 총 게시글수(tpost 칼럼)에 업데이트
        /* 글 삭제시 접속한 유저의 별명을 통해서 총 게시글 등록수 구함 */

        /* 글 삭제시 칼라별 tbl_color_result로 update 하는 비지니스 로직 */
        int tcPostNum = boardDAO.totalColorPostNumGet(loginUserVO.getUday()); // 로그인한 유저의 칼라에 따라서 칼라 기준으로 총 토탈수 조회
        userColorDAO.totalColorPostNumUPD(tcPostNum, loginUserVO.getUday());  // tbl_color_result에 칼라 기준의 총 토탈수 업데이트 주입
        /* 글 삭제시 칼라별 tbl_color_result로 update 하는 비지니스 로직 */

       /* 글 삭제시 -50 포인트 */
        PointUtils pointUtils = new PointUtils(
                loginUserVO.getUid(),
                Integer.parseInt(UnifyMessage.getMessage("BoardDeletePoint")),
                "글 삭제",
                bno);

        PointUpdateVO pointUpdateVO = new PointUpdateVO();
        pointUpdateVO.setPupdid(loginUserVO.getUid());
        pointUpdateVO.setPupdpoint(Integer.parseInt(UnifyMessage.getMessage("BoardDeletePoint")));
        pointUpdateVO.setPupdcontent(pointUtils.getUsePointContent());

        pointUtils.setBalancePoint(loginUserVO.getUpoint());

        pointDAO.updateOperPoint(pointUpdateVO);                                                // tbl_point_update 추가(insert)
        pointDAO.balancePointUpdate(loginUserVO.getUid(), pointUtils.getBalancePoint());        // tbl_user 유저 포인트 변경(update)

        PointDeleteVO pointDeleteVO = new PointDeleteVO();
        pointDeleteVO.setPdelid(loginUserVO.getUid());
        pointDeleteVO.setPdelpoint(Integer.parseInt(UnifyMessage.getMessage("BoardDeletePoint")));
        pointDeleteVO.setPdelcontent(pointUtils.getExtinctPointContent());
        pointDAO.deleteOperPoint(pointDeleteVO);                        // tbl_point_delete 추가(insert)
       /* 글 삭제시 -50 포인트 */

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
