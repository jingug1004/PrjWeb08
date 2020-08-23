package org.zerock.persistence;

import org.zerock.domain.BoardVO;
import org.zerock.domain.SearchCriteria;

import java.util.List;

/**
 * Created by Emiya-PC on 2018. 7. 1. PM 7:37
 * sp4chap11-Project / org.zerock.persistence
 * No pain, No gain!
 * What :
 * Why :
 * How :
 */
public interface HomeDAO {

    /**
     * Home.jsp에 중상단에 보여줄 10개 랜덤 게시물
     *
     * @param searchCriteria
     * @return
     * @throws Exception
     */
    List<BoardVO> random10BoardsList(SearchCriteria searchCriteria) throws Exception;

    /**
     * Home.jsp에 중단에 보여줄 4개 최신 게시물
     *
     * @param searchCriteria
     * @return
     * @throws Exception
     */
    List<BoardVO> latest4BoardsList(SearchCriteria searchCriteria) throws Exception;


}
