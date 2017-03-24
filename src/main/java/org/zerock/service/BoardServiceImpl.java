package org.zerock.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 4.. PM 1:04
 * What :
 * Why :
 * How :
 */
@Service
public class BoardServiceImpl implements BoardService {

    @Inject
    private BoardDAO dao;

    /*
    @Override
    public void regist(BoardVO board) throws Exception {
        dao.create(board);
    }
    */

    /**
     * BoardDAO의 create()와 addAttach()를 연속으로 사용하기 때문에 코드는 아래와 같이 트랜잭션을 처리하는 방식으로 변경.
     * 작업의 순서는 먼저 게시물을 등록하는 dao.create()를 호출한 후 첨부파일의 이름 배열을 이용해서 각각의 파일 이름을 데이터베이스에 추가하는 형태로 구현.
     *
     * @param board
     */
    @Transactional
    @Override
    public void regist(BoardVO board) throws Exception {

        dao.create(board);

        String[] files = board.getFiles();

        if (files == null) {
            return;
        }

        for (String fileName : files) {
            dao.addAttach(fileName);
        }

    }

//    @Override
//    public BoardVO read(Integer bno) throws Exception {
//        return dao.read(bno);
//    }

    @Transactional(isolation = Isolation.READ_COMMITTED)
    @Override
    public BoardVO read(Integer bno) throws Exception {

        dao.updateViewCnt(bno);
        return dao.read(bno);
    }

    /*
    @Override
    public void modify(BoardVO board) throws Exception {
        dao.update(board);
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
        dao.update(board);

        Integer bno = board.getBno();

        dao.deleteAttach(bno);

        String[] files = board.getFiles();

        if (files == null) {
            return;
        }

        for (String fileName : files) {
            dao.replaceAttach(fileName, bno);
        }
    }

    /*
    @Override
    public void remove(Integer bno) throws Exception {
        dao.delete(bno);
    }
    */

    /**
     * 데이터베이스에 저장된 첨부파일의 정보와 게시물의 삭제 작업.
     * 삭제 작업의 경우 tbl_attach가 tbl_board를 참조하기 때문에 반드시 첨부파일과 관련된 정보부터 삭제하고, 게시글을 삭제.
     *
     * @param bno
     */
    @Transactional
    @Override
    public void remove(Integer bno) throws Exception {
        dao.deleteAttach(bno);
        dao.delete(bno);
    }

    @Override
    public List<BoardVO> listAll() throws Exception {
        return dao.listAll();
    }

    @Override
    public List<BoardVO> listCriteria(Criteria cri) throws Exception {
        return dao.listCriteria(cri);
    }

    @Override
    public int listCountCriteria(Criteria cri) throws Exception {
        return dao.countPaging(cri);
    }

    @Override
    public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
        return dao.listSearch(cri);
    }

    @Override
    public int listSearchCount(SearchCriteria cri) throws Exception {
        return dao.listSearchCount(cri);
    }

    @Override
    public List<String> getAttach(Integer bno) throws Exception {
        return dao.getAttach(bno);
    }


}
