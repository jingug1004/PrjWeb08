package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.SearchCriteria;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by Emiya-PC on 2018. 7. 1.. PM 8:24
 * What :
 * Why :
 * How :
 */
@Repository
public class HomeDAOImpl implements HomeDAO {

    private static final Logger logger = LoggerFactory.getLogger(HomeDAOImpl.class);

    @Inject
    private SqlSession session;

    private static String namespace = "org.zerock.mapper.homeMapper";

    @Override
    public List<BoardVO> random10BoardsList(SearchCriteria searchCriteria) throws Exception {
        return session.selectList(namespace + ".random10BoardsList", searchCriteria);
    }

}
