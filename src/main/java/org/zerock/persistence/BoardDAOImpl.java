package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.SearchCriteriaListAny;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by macbookpro on 2017. 2. 3.. PM 8:24
 * What : BoardDAO 인터페이스를 구현한 BoardDAOImpl 클래스.
 * Why :
 * How :
 */
@Repository
public class BoardDAOImpl implements BoardDAO {

    private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);

    @Inject
    private SqlSession session;

    private static String namespace = "org.zerock.mapper.BoardMapper";
//    공통으로 사용하는 XML Mapper의 namespace를 지정하고 사용.

    @Override
    public void create(BoardVO vo) throws Exception {
        session.insert(namespace + ".create", vo);
    }

    @Override
    public BoardVO read(Integer bno) throws Exception {
        return session.selectOne(namespace + ".read", bno);
    }

    @Override
    public void update(BoardVO vo) throws Exception {
        session.update(namespace + ".update", vo);
    }

    @Override
    public void delete(Integer bno) throws Exception {
        session.delete(namespace + ".delete", bno);
    }

    // 정말 무시하자! 옛날 거! ---------------------------------------------------------
    @Override
    public List<BoardVO> listAll() throws Exception {return session.selectList(namespace + ".listAll");}

    // 정말 무시하자! 옛날 거! ---------------------------------------------------------
    @Override
    public List<BoardVO> listPage(int page) throws Exception {
        if (page <= 0) {
            page = 1;
        }
        page = (page - 1) * 10;
        return session.selectList(namespace + ".listPage", page);
    }

    // 정말 무시하자! 옛날 거! 밑의 listSearch 씀 --------------------------------------------------
    @Override
    public List<BoardVO> listCriteria(Criteria cri) throws Exception {return session.selectList(namespace + ".listCriteria", cri);}

    // 이거 안 씀. 밑의 listSearchCount 씀
    @Override
    public int countPaging(Criteria cri) throws Exception {return session.selectOne(namespace + ".countPaging", cri);}

    // 기본 게시판(cate) 클릭하고 나서 보여주는 리스트
    @Override
    public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
        return session.selectList(namespace + ".listSearch", cri);
    }

    // 게시판 밑 페이징 (1~10버튼) // 게시판 전체 몇 개인지 카운트 불러오는 메소드
    @Override
    public int listSearchCount(SearchCriteria cri) throws Exception {
        return session.selectOne(namespace + ".listSearchCount", cri);
    }

    // 전체 검색 기능 구현
    @Override
    public List<BoardVO> listSearchAny(SearchCriteriaListAny criteria) throws Exception {
        return session.selectList(namespace + ".listSearchAny", criteria);
    }

    @Override
    public int listSearchAnyCount(SearchCriteriaListAny criteria) throws Exception {
        return session.selectOne(namespace + ".listSearchAnyCount", criteria);
    }

    @Override
    public void updateReplyCnt(Integer bno, int amount) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("bno", bno);
        paramMap.put("amount", amount);

        session.update(namespace + ".updateReplyCnt", paramMap);
    }

    /* 게시판 글 클릭 시 조회 수 증가 */
    @Override
    public void updateViewCnt(Integer bno) throws Exception {
        session.update(namespace + ".updateViewCnt", bno);
    }

    /* 게시판 글의 카테고리 이름 출력 */
    @Override
    public String callCateName(Integer bno) throws Exception {
        return session.selectOne(namespace + ".callCateName", bno);
    }

    /* 게시판 리스트의 카테고리 이름 출력 */
    @Override
    public String callCateNameInList(Integer cateNum) throws Exception {
        return session.selectOne(namespace + ".callCateNameInList", cateNum);
    }


    @Override
    public void addAttach(String fullName) throws Exception {

        logger.info("lllll~~~~~ fullName : " + fullName + "lllll~~~~~ ");

        session.insert(namespace + ".addAttach", fullName);
    }

    @Override
    public List<String> getAttach(Integer bno) throws Exception {
        return session.selectList(namespace + ".getAttach", bno);
    }

    @Override
    public void deleteAttach(Integer bno) throws Exception {
        session.delete(namespace + ".deleteAttach", bno);
    }

    @Override
    public void replaceAttach(String fullName, Integer bno) throws Exception {

        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("bno", bno);
        paramMap.put("fullName", fullName);

        session.insert(namespace + ".replaceAttach", paramMap);
    }
}
