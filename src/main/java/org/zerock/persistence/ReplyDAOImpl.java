package org.zerock.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wtime on 2017-02-13. ${time}
 * org.zerock.persistence / Web Ex02
 * Better late than never!
 * What : Ajax 댓글 처리를 위한 REST와 도메인 객체 설계 ReplyDAO 인터페이스 구현한 자바 클래스.
 * Why :
 * How :
 */
@Repository
public class ReplyDAOImpl implements ReplyDAO{

    @Inject
    private SqlSession sqlSession;

    private static String namespace = "org.zerock.mapper.ReplyMapper";

    @Override
    public List<ReplyVO> list(Integer bno) throws Exception {

        return sqlSession.selectList(namespace + ".list", bno);
    }

    @Override
    public ReplyVO readByIDnBnonText(ReplyVO replyVO) throws Exception {
        return sqlSession.selectOne(namespace + ".readByIDnBnonText", replyVO);
    }

    @Override
    public void create(ReplyVO vo) throws Exception {

        sqlSession.insert(namespace + ".create", vo);
    }

    @Override
    public void update(ReplyVO vo) throws Exception {

        sqlSession.update(namespace + ".update", vo);
    }

    @Override
    public void delete(Integer rno) throws Exception {

        // sqlSession.delete(namespace + ".delete", rno);
        sqlSession.update(namespace + ".delete", rno);
    }

    @Override
    public List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception {

        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("bno", bno);
        paramMap.put("cri", cri);

        return sqlSession.selectList(namespace + ".listPage", paramMap);
    }

    @Override
    public int count(Integer bno) throws Exception {

        return sqlSession.selectOne(namespace + ".count", bno);
    }

    @Override
    public int getBno(Integer rno) throws Exception {

        return sqlSession.selectOne(namespace + ".getBno", rno);
    }

    @Override
    public int totalUserReplyNumGET(String uid) throws Exception {

        return sqlSession.selectOne(namespace + ".totalUserReplyNumGET", uid); // 댓글 작성시 접속한 유저의 별명을 통해서 총 댓글 등록수 구함
    }

    @Override
    public int totalColorReplyNumGet(String getColor) throws Exception {
        return sqlSession.selectOne(namespace + ".totalColorReplyNumGet", getColor);
    }
}
