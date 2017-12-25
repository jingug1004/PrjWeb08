package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Emiya on 2017-11-20 오후 3:22
 * Web08 / org.zerock.controller
 * No pain, No gain!
 * What : [Spring] Excel 파일 업로드/ import / 엑셀업로드 / 첨부파일 / 엑셀 값 읽기 / Java
 * 출처: http://daydreamer-92.tistory.com/42 [아는게1도없다]http://daydreamer-92.tistory.com/42
 * Why : HANA Prj 같이
 * How :
 * << 개정이력(Modification Information) >>
 * 수정일         수정자          수정내용
 * -------       --------       ---------------------------
 * 2017/11/20     김진국          최초 생성
 * 2017/00/00     이몽룡          인증이 필요없는 URL을 패스하는 로직 추가
 *
 * @author 개발팀 김진국
 * @version 1.0
 * @see
 * @since 2017/04/10
 */

@Controller
@RequestMapping(value = "/jqGrid")
public class JqGridController {

    @RequestMapping(value = "/jqGridList", method = RequestMethod.GET)
    public void jqGridList() throws Exception {


    }

    @RequestMapping(value = "/jqGridList02", method = RequestMethod.GET)
    public void jqGridList02() throws Exception {


    }

    @RequestMapping(value = "/jqGridList03", method = RequestMethod.GET)
    public void jqGridList03() throws Exception {


    }


}