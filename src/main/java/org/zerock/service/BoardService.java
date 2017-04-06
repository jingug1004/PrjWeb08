package org.zerock.service;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 4.. PM 1:01
 * What :
 * Why : 아직까지는 큰 역할이 없는 BoardController와 BoardDAO와의 연결 작업을 담당.
 * How :
 */
public interface BoardService {

    /**
     * Regist.
     *
     * @param board the board
     * @throws Exception the exception
     */
    public void regist(BoardVO board) throws Exception;

    /**
     * Read board vo.
     *
     * @param bno the bno
     * @return the board vo
     * @throws Exception the exception
     */
    public BoardVO read(Integer bno) throws Exception;

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
    public void remove(Integer bno) throws Exception;

    /**
     * List all list.
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
     * List count criteria int.
     *
     * @param cri the cri
     * @return the int
     * @throws Exception the exception
     */
    public int listCountCriteria(Criteria cri) throws Exception;

    /**
     * List search criteria list.
     *
     * @param cri the cri
     * @return the list
     * @throws Exception the exception
     */
    public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

    /**
     * List search count int.
     *
     * @param cri the cri
     * @return the int
     * @throws Exception the exception
     */
    public int listSearchCount(SearchCriteria cri) throws Exception;

    /**
     * 첨부 파일을 조회하는 기능.
     *
     * @param bno the bno
     * @return the attach
     * @throws Exception the exception
     */
    public List<String> getAttach(Integer bno) throws Exception;

}
