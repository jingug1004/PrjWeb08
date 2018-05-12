package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.RateMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;
import org.zerock.service.UserInfoService;

import javax.inject.Inject;

/**
 * Created by 김진국 on 2017-11-09 오후 10:38
 * Web08 / org.zerock.controller
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

@Controller
@RequestMapping(value = "/userInfo/*")
public class UserInfoController {

    private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);

    @Inject
    private BoardService boardService;      // 게시판 작성글 처리하는 서비스

    @Inject
    private UserInfoService userInfoService;// 글 작성자의 게시글과 댓글

    /**
     * 게시판의 유저(WRITER) 클릭했을 때. 유저 상세페이지로 이동.
     *
     * @param cri
     * @param model
     * @param boardVO
     * @param paramLoginid
     * @throws Exception
     */
    @RequestMapping(value = "/userInfoList", method = RequestMethod.GET)
    public void userInfoList(@ModelAttribute("cri") SearchCriteria cri,
                             Model model,
                             BoardVO boardVO,
                             @RequestParam(required = false, value = "loginid") String paramLoginid) throws Exception {

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategb();          // 지우면 안 됨! rateMaker 자체적으로 돌아감.

        // boardVO.setCnum(cateNum); // 1~10 페이징 처리를 위하여 URL의 cate의 값을 가져와서-@RequestParam("cate)-셋 메서드 활용.
        model.addAttribute("userInfoList", userInfoService.userInfoList(paramLoginid));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setCnumFromBoardVO(boardVO.getCnum());            // 1~10 페이징에서 cate 넘버를 가져오기 위한 setter 메서드.
        pageMaker.setTotalCount(userInfoService.userInfoListCount(paramLoginid)); // pageMaker.setTotalCount(boardService.listCountCriteria(cri));
        model.addAttribute("pageMaker", pageMaker);
        // model.addAttribute("cateName", boardVO.getCnum());                                     // 리스트 목록 상단에 카테고리 이름 출력!
        model.addAttribute("cateName", boardService.callCateNameInList(boardVO.getCnum()));    // 게시판 상세 글의 카테고리 이름 출력
    }

    @RequestMapping(value = "/userInfoListGrid", method = RequestMethod.GET)
    public void userInfoListGridGET() throws Exception {

    }

    @RequestMapping(value = "/userInfoListDetail", method = RequestMethod.GET)
    public void userInfoListDetailGET() throws Exception {

    }


}