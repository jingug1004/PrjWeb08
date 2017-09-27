package org.zerock.persistence;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.SearchCriteriaListAny;

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
    public void create(BoardVO vo) throws Exception;

    /**
     * Read board vo.
     *
     * @param bno the bno
     * @return the board vo
     * @throws Exception the exception
     */
    public BoardVO read(Integer bno) throws Exception;

    /**
     * Update.
     *
     * @param vo the vo
     * @throws Exception the exception
     */
    public void update(BoardVO vo) throws Exception;

    /**
     * Delete.
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    public void delete(Integer bno) throws Exception;

    /**
     * List all list.     // 정말 무시하자! 옛날 거!
     *
     * @return the list
     * @throws Exception the exception
     */
    public List<BoardVO> listAll() throws Exception;

    /**
     * 게시판 글 페이징 처리.
     *
     * @param page the page
     * @return the list
     * @throws Exception the exception
     */
    public List<BoardVO> listPage(int page) throws Exception;

    /**
     * BoardDAO에 list를 출력하는 부분.
     * listCriteria()는 Criteria 객체릂 파라미터로 전달받고, 필요한 getPageStart()와 getPerPageNum() 메소드를 호출한 결과를 사용.
     *
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    public List<BoardVO> listCriteria(Criteria cri) throws Exception;

    /**
     * 게시물의 BoardDAO에서 totalCount를 반환할 수 있게 처리하기 위해서.
     *
     * @param cri the cri
     * @return the int
     * @throws Exception the exception
     */
    public int countPaging(Criteria cri) throws Exception;

    //use for dynamic sql

    /**
     * List search list. 메인에서 건의사항(기본 자유게시판) 눌렀을 때.
     *
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;

    /**
     * List search count int. 페이징! 게시판 밑 1~10까지 버튼.
     *
     * @param cri the cri
     * @return the int
     * @throws Exception the exception
     */
    public int listSearchCount(SearchCriteria cri) throws Exception;


    public List<BoardVO> listSearchAny(SearchCriteriaListAny criteria) throws Exception;

    public int listSearchAnyCount(SearchCriteriaListAny criteria) throws Exception;


    /**
     * 댓글의 숫자를 변경할 수 있는 updateReplyCnt()를 추가.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param bno    the bno
     * @param amount the amount
     * @throws Exception the exception
     */
    public void updateReplyCnt(Integer bno, int amount) throws Exception;

    /**
     * Update view cnt.
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    public void updateViewCnt(Integer bno) throws Exception;

    /**
     * 게시판 글의 카테고리 이름 출력
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    public String callCateName(Integer bno) throws Exception;

    /**
     * 게시판 리스트(목록 - List)의 카테고리 이름 출력
     *
     * @param cateNum 카테고리 번호
     * @throws Exception the exception
     */
    public String callCateNameInList(Integer cateNum) throws Exception;

    /**
     * 새로운 첨부파일이 추가될 수 있는 기능이 추가 - '새롭게 생성된 게시물의 번호가 필요하다는 점'.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param fullName 첨부파일의 이름.
     * @throws Exception
     */
    public void addAttach(String fullName) throws Exception;

    /**
     * 특정 게시물의 첨부파일을 시간 순서대로 가져오는 SQL문을 작성.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param bno the bno
     * @return the attach
     * @throws Exception the exception
     */
    public List<String> getAttach(Integer bno) throws Exception;

    /**
     * 게시물의 수정에는 기존의 첨부파일을 삭제하고, 새롭게 추가하는 부분이 들어가므로 BoardDAO에 다음과 같은 SQL 처리가 필요.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param bno the bno
     * @throws Exception the exception
     */
    public void deleteAttach(Integer bno)throws Exception;

    /**
     * 게시물의 수정에는 기존의 첨부파일을 삭제하고, 새롭게 추가하는 부분이 들어가므로 BoardDAO에 다음과 같은 SQL 처리가 필요.
     * BoardDAO - boardMapper.xml - BoardDAOImpl
     *
     * @param fullName the full name
     * @param bno      the bno
     * @throws Exception the exception
     */
    public void replaceAttach(String fullName, Integer bno)throws Exception;

//    public void goodCntPush(String uid) throws Exception;

}
