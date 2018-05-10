package org.zerock.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * Created by wtime on 2017-02-09.
 * What : 페이징 처리용 클래스.
 * Why : prev와 next의 계산을 매번 JSP 등에서 처리할 수도 있겠지만, 좀 더 편하게 사용하기 위해서는 별도의 클래스를 설계해서 처리하는 것이 좋음.
 * How :
 */
public class PageMaker {

    private static final Logger logger = LoggerFactory.getLogger(PageMaker.class);

    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 10;        // displayPageNum은 화면에 보여지는 페이지 번호의 숫자를 의미하는 변수를 추가
                                            // 만일 화면상에 페이지의 번호가 5개씩만 보여지고 싶다면 멤버 필드 값을 변경해주면 됨.

    private Criteria cri;                   // SearchCriteria에 상속하는 Criteria
    private CriteriaListAny criListAny;     // SearchCriteria에 상속하는 CriteriaListAny

    private int cnumFromBoardVO;            // BoardVO 에서 cnum(카테고리 넘버) 가져오는 필드

    //

    public int getCnumFromBoardVO() {
        return cnumFromBoardVO;
    }

    public void setCnumFromBoardVO(int cnumFromBoardVO) {
        this.cnumFromBoardVO = cnumFromBoardVO;
    }

    /**
     * Sets cri.
     *
     * @param cri the cri
     */
    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    /**
     * Gets cri.
     *
     * @return the cri
     */
    public Criteria getCri() {
        return cri;
    }

    public CriteriaListAny getCriListAny() {
        return criListAny;
    }

    public void setCriListAny(CriteriaListAny criListAny) {
        this.criListAny = criListAny;
    }

    /**
     * Sets total count.
     *
     * @param totalCount 가장 중요한 계산은 totalCount가 설정되는 시점에 calcData()를 실행해서 계산.
     */
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }

    private void calcData() {

        logger.info("");

        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    }

    /**
     * 전체검색(ListAny)으로 실행될 전체 게시글 카운트 갯수. 위와 구분.
     *
     * @param totalCount
     */
    public void setTotalCountListAny(int totalCount) {
        this.totalCount = totalCount;

        calcDataListAny();
    }

    private void calcDataListAny() {

        logger.info("lll~~~ calcDataListAny()");

        endPage = (int) (Math.ceil(criListAny.getPage() / (double) displayPageNum) * displayPageNum);
        startPage = (endPage - displayPageNum) + 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) criListAny.getPerPageNum()));

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * criListAny.getPerPageNum() >= totalCount ? false : true;
    }

    /**
     * Gets total count.
     *
     * @return the total count
     */
    public int getTotalCount() {
        return totalCount;
    }

    /**
     * Gets start page.
     *
     * @return the start page
     */
    public int getStartPage() {
        return startPage;
    }

    /**
     * Gets end page.
     *
     * @return the end page
     */
    public int getEndPage() {
        return endPage;
    }

    /**
     * Is prev boolean.
     *
     * @return the boolean
     */
    public boolean isPrev() {
        return prev;
    }

    /**
     * Is next boolean.
     *
     * @return the boolean
     */
    public boolean isNext() {
        return next;
    }

    /**
     * displayPageNum은 화면에 보여지는 페이지 번호의 숫자를 의미하는 변수를 추가.
     * 만일 화면상에 페이지의 번호가 5개씩만 보여지고 싶다면 멤버 필드 값을 변경해주면 됨.
     *
     * @return the display page num
     */
    public int getDisplayPageNum() {
        return displayPageNum;
    }

    /**
     * 모든 페이징 처리는 목록을 처리하기 위한 정보를 GET 방식으로 유지해야 하기 때문에 처리 과정이 복잡해질 때가 많음.
     * 현재 목록 페이지의 경우 모든 정보는 Criteria에 있기 때문에 PageMaker를 아래와 같이 makeQuery() 메소드를 추가.
     *
     * @param page the page
     * @return the string
     */
    public String makeQuery(int page) {
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", cri.getPerPageNum())
                        .build();
        return uriComponents.toUriString();
    }

    /**
     * 정상적으로 메뉴 들어갔을 때 카테고리(List)
     *
     * @param page the page
     * @return the string
     */
    public String makeSearch(int page) {
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("cate", getCnumFromBoardVO())
                        .queryParam("perPageNum", cri.getPerPageNum())
                        .queryParam("searchType", ((SearchCriteria) cri).getSearchType())
                        .queryParam("keyword", ((SearchCriteria) cri).getKeyword())
                        .queryParam("cntSortType", ((SearchCriteria) cri).getCntSortType())
                        .build();
        return uriComponents.toUriString();
    }

    /**
     * 사이트 맨 위(헤더 부분) 전체 검색(ListAny)
     *
     * @return the string
     */
    public String makeSearchAll(int page) {
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", criListAny.getPerPageNum())
                        .queryParam("keyword", ((SearchCriteriaListAny) criListAny).getKeyword())
//                        .queryParam("cntSortType", ((SearchCriteria) cri).getCntSortType())
                        .build();
        return uriComponents.toUriString();
    }

    /**
     * 사이트 맨 위(헤더 부분) 전체 검색(ListAny)
     *
     * @return the string
     */
    public String makeUserInfo(int page) {
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                        .queryParam("page", page)
                        .queryParam("perPageNum", criListAny.getPerPageNum())
                        .queryParam("keyword", ((SearchCriteriaListAny) criListAny).getKeyword())
//                        .queryParam("cntSortType", ((SearchCriteria) cri).getCntSortType())
                        .build();
        return uriComponents.toUriString();
    }

    @Override
    public String toString() {
        return "PageMaker{" +
                "totalCount=" + totalCount +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                ", prev=" + prev +
                ", next=" + next +
                ", displayPageNum=" + displayPageNum +
                ", cri=" + cri +
                ", criListAny=" + criListAny +
                ", cnumFromBoardVO=" + cnumFromBoardVO +
                '}';
    }
}
