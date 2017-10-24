package org.zerock.util;

import org.springframework.context.support.MessageSourceAccessor;

import java.util.Locale;

/**
 * Created by macbookpro on 2017. 10. 24. PM 6:32
 * beauty / org.zerock.util
 * No pain, No gain!
 * What :
 * Why :
 * How :
 *
 * @author 개발팀 김진국
 * @version 1.0
 * @see <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2017/04/21  김진국          최초 생성
 *  2017/05/27  이몽룡          인증이 필요없는 URL을 패스하는 로직 추가
 *  </pre>
 * @since 2017/04/10
 */


public class UnifyMessage {

    private static MessageSourceAccessor messageSourceAccessor = null; // 보통 VO에 있는 필드변수와 비슷하다고 보면 됨.

    public void setMessageSourceAccessor (MessageSourceAccessor messageSourceAccessor) {
        UnifyMessage.messageSourceAccessor = messageSourceAccessor;
    }

    // key에 해당하는 메세지 반환
    public static String getMessage(String key) {
        return messageSourceAccessor.getMessage(key, Locale.getDefault());
    }
    
    // key에 해당하는 메세지 반환
    public static String getMessage(String key, Object[] objs) {
    		return messageSourceAccessor.getMessage(key, objs, Locale.getDefault());
    }

}