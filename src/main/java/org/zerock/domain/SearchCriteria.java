package org.zerock.domain;

/**
 * Created by macbookpro on 2017. 2. 12. PM 12:45
 * sp4chap11-Project / org.zerock.domain
 * No pain, No gain!
 * What : 검색 처리와 동적 SQL - 검색에 필요한 데이터와 SearchCriteria 클래스
 * Why : Criteria의 두 개의 정보(page, perPageNum)는 이미 페이징 처리에 사용한 Criteria 클래스를 이용하면 되고, 새롭게 추가된 데이터는 검색의 종류를 의미하는 searchType과 검색 키워드에 해당하는 keyword임.
 * How : 구성하기 위해서 Criteria에 searchType과 keyword를 추가해서 구현하는 것도 좋지만, 기존 코드와 좀 더 구분해 주고자 별도의 클래스(SearchCriteria)를 기존의 Criteria를 상속해서 사용하도록.
 */

public class SearchCriteria extends Criteria{

    private String searchType;            // 검색 타입
    private String keyword;               // 검색 키워드
    private String cate;                  // 칼라 카테고리
    private String cntSortType;           // Good, Bad etc. 클릭하면 자동 정렬
    private String loginid;               // 접속한 로그인 아이디

    /**
     * Gets search type.
     *
     * @return the search type
     */
    public String getSearchType() {
        return searchType;
    }

    /**
     * Sets search type.
     *
     * @param searchType the search type
     */
    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    /**
     * Gets keyword.
     *
     * @return the keyword
     */
    public String getKeyword() {
        return keyword;
    }

    /**
     * Sets keyword.
     *
     * @param keyword the keyword
     */
    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getCntSortType() {
        return cntSortType;
    }

    public void setCntSortType(String cntSortType) {
        this.cntSortType = cntSortType;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public String getLoginid() {
        return loginid;
    }

    public void setLoginid(String loginid) {
        this.loginid = loginid;
    }

    @Override
    public String toString() {
        return "SearchCriteria{" +
                "searchType='" + searchType + '\'' +
                ", keyword='" + keyword + '\'' +
                ", cate='" + cate + '\'' +
                ", cntSortType='" + cntSortType + '\'' +
                ", loginid='" + loginid + '\'' +
                '}';
    }
}
