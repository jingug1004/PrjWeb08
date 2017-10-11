package org.zerock.persistence;

import org.zerock.domain.GoodCntVO;

/**
 * Created by Emiya on 2017-10-01 오전 11:58
 * untitled / org.zerock.persistence
 * No pain, No gain!
 * What :
 * Why :
 * How :
 * << 개정이력(Modification Information) >>
 * 수정일         수정자          수정내용
 * -------       --------       ---------------------------
 * 2017/04/21     김진국          최초 생성
 * 2017/05/27     이몽룡          인증이 필요없는 URL을 패스하는 로직 추가
 *
 * @author 개발팀 김진국
 * @version 1.0
 * @see
 * @since 2017/04/10
 */

public interface CntDAO {

    public void goodCntPush(GoodCntVO goodCntVO) throws Exception;             // 굿 버튼 눌렀을 때 아이디가 있는지 없는지 확인

    public String goodCntVOGet(String loginUserID, int bno) throws Exception;            // 굿 누르고 안 눌렀을 때 인풋박스에 적용되는 칼라

    // ---------------------------------------------------------

    public void badCntPush(GoodCntVO badCntVO) throws Exception;               // 배드 버튼 눌렀을 때 아이디가 있는지 없는지 확인

    public String badCntVOGet(String loginUserID, int bno) throws Exception;            // 굿 누르고 안 눌렀을 때 인풋박스에 적용되는 칼라

    // ---------------------------------------------------------

    public int getGoodCntGet(int goodcntbno) throws Exception;                 // Good 하기 위한 Good 개수 구하는.

    public int getBadCntGet(int badcntbno) throws Exception;                   // Bad 하기 위한 Bad 개수 구하는.

    public void changeGBPut(int gbbno, double gbRate) throws Exception;        // G/B 자동으로 변화는.

    // ---------------------------------------------------------

    public void spamCntPush(GoodCntVO spamCntVO) throws Exception;

    public String spamCntVOGet(String loginUserID, int bno) throws Exception;

}