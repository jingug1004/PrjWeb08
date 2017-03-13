package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by macbookpro on 2017. 3. 13. PM 5:50
 * sp4chap11-Project / org.zerock.controller
 * No pain, No gain!
 * What : 페이지들(카테고리)만 이동할 수 있게 만든 컨트롤러
 * Why : 유저가 카테고리 클릭하면 페이지 이동이 되지 않는다. 일단 페이지 상세 내용은 아니더라도 페이지 이동까지만이라도
 * How : 페이지 컨트롤러와 jsp의 @RequestMapping URI 연결
 */


@Controller
public class PageController {

    private static final Logger logger = LoggerFactory.getLogger(PageController.class);

    @RequestMapping(value = "/item/clo_newin", method = RequestMethod.GET)
    public void clo_newin() {

    }


}
