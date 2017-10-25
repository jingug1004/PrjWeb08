package org.zerock.service;

import org.zerock.domain.PointDeleteVO;
import org.zerock.domain.PointInsertVO;

/**
 * Created by Emiya on 2017-10-23 오후 1:23
 * untitled / org.zerock.service
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


public interface PointService {

    public void insertOperPoint(PointInsertVO pointInsertVO) throws Exception;

    public void deleteOperPoint(PointDeleteVO pointDeleteVO) throws Exception;


}
