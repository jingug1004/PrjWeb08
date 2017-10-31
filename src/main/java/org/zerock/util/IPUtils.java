package org.zerock.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Emiya on 2017-10-30 오후 6:57
 * Web07 / org.zerock.util
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


public class IPUtils {

    public String getIP() {

        // Spring 에서 client ip 가져오는 법. https://www.lesstif.com/pages/viewpage.action?pageId=18220218
        HttpServletRequest httpServletRequest =
                ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

        // 출처: http://sesok808.tistory.com/378 [살아가는 그 이유]
        String ip = httpServletRequest.getHeader("X-FORWARDED-FOR");
        if (ip == null || ip.length() == 0) {
            ip = httpServletRequest.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0) {
            ip = httpServletRequest.getHeader("WL-Proxy-Client-IP");  // 웹로직
        }
        if (ip == null || ip.length() == 0) {
            ip = httpServletRequest.getRemoteAddr();
        }
        return ip;
        // Spring 에서 client ip 가져오는 법. https://www.lesstif.com/pages/viewpage.action?pageId=18220218
    }

}