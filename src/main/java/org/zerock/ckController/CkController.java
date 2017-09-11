package org.zerock.ckController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Emiya on 2017-09-11 오후 7:08
 * untitled / org.zerock.ckController
 * No pain, No gain!
 * What :
 * Why :
 * How :
 *
 * @author 개발팀 김진국
 * @version 1.0
 * @see
 * @since 2017/04/10
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2017/04/21  김진국          최초 생성
 *  2017/05/27  이몽룡          인증이 필요없는 URL을 패스하는 로직 추가
 *  </pre>
 *
 */

@Controller
@RequestMapping(value = "/ck/*")
public class CkController {

    private static final Logger logger = LoggerFactory.getLogger(CkController.class);

    @RequestMapping(value = "/viewGo", method = RequestMethod.GET)
    public void viewGo () {

    }

}