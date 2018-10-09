package org.zerock.service;

import org.zerock.domain.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 4.. PM 1:01
 * What :
 * Why : 아직까지는 큰 역할이 없는 BoardController와 BoardDAO와의 연결 작업을 담당.
 * How :
 */
public interface BoardService {

    /**
     * Regist. 글 등록 from SeachBoardController
     * boarddao -> create
     *
     * @param boardVO the board
     * @throws Exception the exception
     */
    public void regist(BoardVO boardVO, HttpSession httpSession) throws Exception;

    /**
     * Read board vo.
     *
     * @param bno the bno
     * @return the board vo
     * @throws Exception the exception
     */
    public BoardVO read(Integer bno) throws Exception;

    public void cookieBoard(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, int bno, String cateNum) throws Exception;

    public void updateViewCnt(Integer bno) throws Exception;

    public BoardVO readByIDnTitle(BoardVO boardVO) throws Exception;

    /**
     * 게시판 글의 카테고리 이름 출력
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    public String callCateName(int bno) throws Exception;


    /**
     * 게시판 리스트(목록 - List)의 카테고리 이름 출력
     *
     * @param cateNum 카테고리 번호
     * @throws Exception the exception
     */
    public String callCateNameInList(int cateNum) throws Exception;

    /**
     * Modify.
     *
     * @param board the board
     * @throws Exception the exception
     */
    public void modify(BoardVO board) throws Exception;

    /**
     * Remove.
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    public void remove(Integer bno, HttpSession httpSession) throws Exception;

    /**
     * List all list.     // 정말 무시하자! 옛날 거!
     *
     * @return the list
     * @throws Exception the exception
     */
    public List<BoardVO> listAll() throws Exception;

    /**
     * List criteria list.
     *
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    public List<BoardVO> listCriteria(Criteria cri) throws Exception;

    /**
     * Criteria를 이용해서 전체 게시물의 숫자를 계산하도록 변경이 필요.
     *
     * @param cri the cri
     * @return the int
     * @throws Exception the exception
     */
    public int listCountCriteria(Criteria cri) throws Exception;


    /**
     * BoardDAO 의 listSearch 메소드로 전달(BoardDAOImpl 의 listSearch 로 전달.).
     *
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

    public List<BoardVO> listSearchAny(SearchCriteriaListAny criteria) throws Exception;


    /**
     * List search count int. 게시판 밑 1~10 페이징 버튼
     *
     * @param cri the cri
     * @return the int
     * @throws Exception the exception
     */
    public int listSearchCount(SearchCriteria cri) throws Exception;

    public int listSearchAnyCount(SearchCriteriaListAny criteria) throws Exception;


    /**
     * 첨부 파일을 조회하는 기능.
     *
     * @param bno the bno
     * @return the attach
     * @throws Exception the exception
     */
    public List<String> getAttach(Integer bno) throws Exception;

    /**
     * 게시판 - 실시간 인기순으로 정렬
     *
     * @param searchCriteria
     * @return
     * @throws Exception
     */
    public List<BoardVO> livePopular(SearchCriteria searchCriteria) throws Exception;
    public int livePopularCount(SearchCriteria searchCriteria) throws Exception;

    /**
     * 게시판 - 같은 정치성향 정렬
     *
     * @param searchCriteria
     * @param boardVO
     * @param userVO
     * @return
     * @throws Exception
     */
    public List<BoardVO> samePopular(SearchCriteria searchCriteria, BoardVO boardVO, UserVO userVO, HttpSession httpSession) throws Exception;

    public int samePopularCount(SearchCriteria searchCriteria, BoardVO boardVO, UserVO userVO, HttpSession httpSession) throws Exception;

    /**
     * 글 번호로 첨부파일 이름 딱 하나 가져오기
     *
     * @param bno
     * @return
     * @throws Exception
     */
    public String getAttachNameGET(int bno) throws Exception;



}
