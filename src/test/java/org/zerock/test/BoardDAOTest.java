package org.zerock.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDAO;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 4.. AM 10:18
 * What :
 * Why :
 * How : 테스트 순서는 위의 테스트 코드부터 순차적으로 진행해주면 되고, 각 테스트 후에는 반드시 데이터베이스 상에서 올바르게 처리되었는지를 확인.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*xml"})
public class BoardDAOTest {
    @Inject
    private BoardDAO dao;

    private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);

    /**
     * Test create.
     *
     * @throws Exception the exception
     */
    @Test
    public void testCreate() throws Exception {

        BoardVO board = new BoardVO();
        board.setTitle("새로운 글을 넣습니다. ");
        board.setContent("새로운 글을 넣습니다. ");
        board.setWriter("user00");
        dao.create(board);
    }

    /**
     * Test read.
     *
     * @throws Exception the exception
     */
    @Test
    public void testRead() throws Exception {

        logger.info("lll~~~" + dao.read(15).toString() + "lll~~~");
    }

    /**
     * Test update.
     *
     * @throws Exception the exception
     */
    @Test
    public void testUpdate() throws Exception {

        BoardVO board = new BoardVO();
        board.setBno(1);
        board.setTitle("수정된 글입니다.");
        board.setContent("수정 테스트 ");
        dao.update(board);
    }

    /**
     * Test delete.
     *
     * @throws Exception the exception
     */
    @Test
    public void testDelete() throws Exception {

        dao.delete(1);
    }

    /**
     * Test list all.
     *
     * @throws Exception the exception
     */
    @Test
    public void testListAll() throws Exception {

        logger.info("lll~~~" + dao.listAll().toString() + "lll~~~");

    }

    /**
     * 페이징 처리는 단순히 SQL만으로 결과를 확인할 수 있기 때문에 테스트 코드를 작성.
     * 화면에 10개씩 데이터를 보여준다고 가정할 때, 사용자가 1페이지를 원한다면 limit 0, 10의 구문이 완성되어야 하고 2페이지를 원한다면 limit 10, 10, 3페이지를 원한다면 limit 20, 10과 같은 형태가 되어야 함.
     *
     * @throws Exception the exception
     */
    @Test
    public void testListPage() throws Exception {

        int page = 3;

        List<BoardVO> list = dao.listPage(page);

        for (BoardVO boardVO : list) {
            logger.info("lll~~~" + boardVO.getBno() + ":" + boardVO.getTitle() + "lll~~~");
        }
    }

    /**
     * MySQL의 결과와 JUnit에서의 테스트 결과가 같아야 한다.
     * select * from tbl_board where bno > 0 order by bno desc limit 20, 20;
     *
     * @throws Exception the exception
     */
    @Test
    public void testListCriteria() throws Exception {

        Criteria cri = new Criteria();
        cri.setPage(2);
        cri.setPerPageNum(20);

        List<BoardVO> list = dao.listCriteria(cri);

        for (BoardVO boardVO : list) {
            logger.info("lll~~~" + boardVO.getBno() + ":" + boardVO.getTitle() + "lll~~~");
        }
    }

    /**
     * 스프링 MVC의 경우 org.springframework.web.util 패키지에 웹 개발에 필요한 많은 유틸리티 클래스를 제공하는데 그 중에서 URI를 작성할 때 도움이 되는
     * 클래스가 UriComponentsBuilder와 UriComponents 클래스.
     * UriComponents 클래스는 path나 query에 해당하는 문자열들을 추가해서 원하는 URI를 생성할 때 사용.
     * 원하는 데이터를 계속 추가해서 처리할 수 있고, 필요한 데이터를 설정. 코드에서 queryParam()의 경우 나중에는 GET 방식의 '?' 뒤에 붙는 데이터가 되는 것을 볼 수 있음.
     *
     */
    @Test
    public void testURI() {

        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .path("/board/read")
                .queryParam("bno", 12)
                .queryParam("perPageNum", 20)
                .build();

        logger.info("lll~~~" + "/board/read?bno=12&perPageNum=20" + "lll~~~");
        logger.info("lll~~~" + uriComponents.toString() + "lll~~~");

    }

    /**
     * UriComponentsBuilder는 특정 URI를 먼저 지정하고 작업하는 것도 가능.
     * 미리 필요한 경로를 지정해 두고 '{module}'와 같은 경로를 'board'로, '{page}'를 'read'로 변경할 수 있음.
     *
     */
    @Test
    public void testURI2() {

        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .path("/{module}/{page}")
                .queryParam("bno", 12)
                .queryParam("perPageNum", 20)
                .build()
                .expand("board", "read")
                .encode();

        logger.info("lll~~~" + "/board/read?bno=12&perPageNum=20" + "lll~~~");
        logger.info("lll~~~" + uriComponents.toString() + "lll~~~");
    }

    /**
     * Test dynamic 1.
     *
     * @throws Exception the exception
     */
    @Test
    public void testDynamic1() throws Exception {

        SearchCriteria cri = new SearchCriteria();
        cri.setPage(1);
        cri.setKeyword("글");
        cri.setSearchType("t");

//        int cate = 1601;

        logger.info("lll~~~ ===================================== lll~~~");

        List<BoardVO> list = dao.listSearch(cri);

        for (BoardVO boardVO : list) {
            logger.info("lll~~~" + boardVO.getBno() + ": " + boardVO.getTitle() + "lll~~~");
        }

        logger.info("lll~~~ ===================================== lll~~~");

        logger.info("lll~~~ COUNT: " + dao.listSearchCount(cri) + " lll~~~");
    }

}