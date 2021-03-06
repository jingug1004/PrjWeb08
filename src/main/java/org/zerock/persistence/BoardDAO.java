package org.zerock.persistence;

import org.zerock.domain.*;

import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 3.. PM 7:32
 * What : 기본적인 게시물 관리 기능의 BoardDAO 인터페이스.
 * Why :
 * How : boardMapper.xml의 각 SQL 문의 id 속성 값은 BoardDAO 인터페이스와 동일하게 설정해주어서 혼란을 피하는 것이 좋음.
 */
public interface BoardDAO {

    /**
     * Create.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    void create(BoardVO vo) throws Exception;

    /**
     * Read board vo.
     *
     * @param bno the bno
     * @return the board vo
     * @throws Exception the exception
     */
    BoardVO read(Integer bno) throws Exception;

    BoardVO readByIDnTitle(BoardVO boardVO) throws Exception;

    /**
     * Update.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    void update(BoardVO vo) throws Exception;

    /**
     * Delete.
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    void delete(Integer bno) throws Exception;

    /**
     * List all list.     // 정말 무시하자! 옛날 거!
     *
     * @return the list
     * @throws Exception the exception
     */
    List<BoardVO> listAll() throws Exception;

    /**
     * 게시판 글 페이징 처리.
     *
     * @param page the page
     * @return the list
     * @throws Exception the exception
     */
    List<BoardVO> listPage(int page) throws Exception;

    /**
     * BoardDAO에 list를 출력하는 부분.
     * listCriteria()는 Criteria 객체릂 파라미터로 전달받고, 필요한 getPageStart()와 getPerPageNum() 메소드를 호출한 결과를 사용.
     *
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    List<BoardVO> listCriteria(Criteria cri) throws Exception;

    /**
     * 게시물의 BoardDAO에서 totalCount를 반환할 수 있게 처리하기 위해서.
     *
     * @param cri the cri
     * @return the int
     * @throws Exception the exception
     */
    int countPaging(Criteria cri) throws Exception;

    //use for dynamic sql

    /**
     * List search list. 메인에서 건의사항(기본 자유게시판) 눌렀을 때.
     *
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    List<BoardVO> listSearch(SearchCriteria cri) throws Exception;

    /**
     * List search count int. 페이징! 게시판 밑 1~10까지 버튼.
     *
     * @param cri the cri
     * @return the int
     * @throws Exception the exception
     */
    int listSearchCount(SearchCriteria cri) throws Exception;

    List<BoardVO> listSearchAny(SearchCriteriaListAny criteria) throws Exception;

    int listSearchAnyCount(SearchCriteriaListAny criteria) throws Exception;

    /**
     * 댓글의 숫자를 변경할 수 있는 updateReplyCnt()를 추가.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param bno    the bno
     * @param amount the amount
     * @throws Exception the exception
     */
    void updateReplyCnt(Integer bno, int amount) throws Exception;

    /**
     * Update view cnt.
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    void updateViewCnt(Integer bno) throws Exception;

    /**
     * 게시판 글의 카테고리 이름 출력
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    String callCateName(Integer bno) throws Exception;

    /**
     * 게시판 리스트(목록 - List)의 카테고리 이름 출력
     *
     * @param cateNum 카테고리 번호
     * @throws Exception the exception
     */
    String callCateNameInList(Integer cateNum) throws Exception;

    /**
     * 새로운 첨부파일이 추가될 수 있는 기능이 추가 - '새롭게 생성된 게시물의 번호가 필요하다는 점'.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param fullName 첨부파일의 이름.
     * @throws Exception
     */
    void addAttach(String fullName, int boardBno) throws Exception;

    /**
     * tbl_attach 테이블에는 썸네일(s_...) 파일명 저장. tbl_attach_origin은 원본 파일명 그대로 저장 - 리스트 썸네일 이미지 사이즈 안 맞아서, 맞게 할려고.
     *
     * @param fullName 첨부파일의 이름.
     * @throws Exception
     */
    void addAttachOrigin(String fullName, int boardBno) throws Exception;

    /**
     * 특정 게시물의 첨부파일을 시간 순서대로 가져오는 SQL문을 작성.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param bno the bno
     * @return the attach
     * @throws Exception the exception
     */
    List<String> getAttach(Integer bno) throws Exception;

    /**
     * 게시물의 수정에는 기존의 첨부파일을 삭제하고, 새롭게 추가하는 부분이 들어가므로 BoardDAO에 다음과 같은 SQL 처리가 필요.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    void deleteAttach(Integer bno) throws Exception;

    /**
     * 게시물의 수정에는 기존의 첨부파일을 삭제하고, 새롭게 추가하는 부분이 들어가므로 BoardDAO에 다음과 같은 SQL 처리가 필요.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param fullName the full name
     * @param bno      the bno
     * @throws Exception the exception
     */
    void replaceAttach(String fullName, Integer bno) throws Exception;

    int totalUserPostNumGET(String uid) throws Exception; // 글 작성시 접속한 유저의 아이디를 통해서 총 게시글 등록수 구함

    int totalColorPostNumGet(String getColor) throws Exception;

    /**
     * 게시판 - 실시간 인기순으로 정렬
     *
     * @param searchCriteria
     * @return
     * @throws Exception
     */
    List<BoardVO> livePopular(SearchCriteria searchCriteria, String sdfToday) throws Exception;

    int livePopularCount(SearchCriteria searchCriteria, String sdfToday) throws Exception;

    /**
     * 게시판 - 같은 정치성향 정렬
     *
     * @param searchCriteria
     * @param boardVO
     * @param userVO
     * @return
     * @throws Exception
     */
    List<BoardVO> samePopular(SearchCriteria searchCriteria, BoardVO boardVO, UserVO userVO) throws Exception;

    int samePopularCount(SearchCriteria searchCriteria, BoardVO boardVO, UserVO userVO) throws Exception;


    /**
     * 글 번호로 첨부파일 이름 딱 하나 가져오기
     *
     * @param bno
     * @return
     * @throws Exception
     */
    String getAttachNameGET(int bno) throws Exception;

}
