package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.*;
import org.zerock.service.BoardService;
import org.zerock.service.CntService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 12. PM 12:44
 * sp4chap11-Project / org.zerock.controller
 * No pain, No gain!
 * What :
 * Why :
 * How :
 */


@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {

    private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

    @Inject
    private BoardService boardService;

    @Inject
    private CntService cntService; // cnt 처리하는 서비스

    /**
     * 게시판 리스트 페이지가 cate의 기준에 따라 나뉘어짐.
     *
     * @param cri     SearchCriteria -> cri
     * @param model   the model
//     * @param cateNum 카테고리 - 넘버 기준으로 나뉨.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listPage(@ModelAttribute("cri") SearchCriteria cri,
                           Model model,
                           BoardVO boardVO,
                           @RequestParam(required = false, value = "cate") Integer cateNum,
                           @RequestParam(required = false, value = "cntSortType") String cntSortType) throws Exception {

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategb();

        boardVO.setCnum(cateNum); // 1~10 페이징 처리를 위하여 URL의 cate의 값을 가져와서-@RequestParam("cate)-셋 메서드 활용.
        model.addAttribute("list", boardService.listSearchCriteria(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setCnumFromBoardVO(boardVO.getCnum());            // 1~10 페이징에서 cate 넘버를 가져오기 위한 setter 메서드.
        pageMaker.setTotalCount(boardService.listSearchCount(cri)); // pageMaker.setTotalCount(boardService.listCountCriteria(cri));
        model.addAttribute("pageMaker", pageMaker);
//        model.addAttribute("cateName", cateNum);                                    // 리스트 목록 상단에 카테고리 이름 출력!
        model.addAttribute("cateName", boardVO.getCnum());                                    // 리스트 목록 상단에 카테고리 이름 출력!
//        model.addAttribute("cateName", boardService.callCateNameInList(cateNum));   // 게시판 상세 글의 카테고리 이름 출력
        model.addAttribute("cateName", boardService.callCateNameInList(boardVO.getCnum()));   // 게시판 상세 글의 카테고리 이름 출력

        return "sboard/list";
    }

    @RequestMapping(value = "/listAny", method = RequestMethod.GET)
    public String listAnyPage(@ModelAttribute("criteria") SearchCriteriaListAny searchCriteriaListAny,
                              Model model) throws Exception {

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategb();

        model.addAttribute("listAny", boardService.listSearchAny(searchCriteriaListAny));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCriListAny(searchCriteriaListAny);
        pageMaker.setTotalCountListAny(boardService.listSearchAnyCount(searchCriteriaListAny));
        model.addAttribute("pageMakerAny", pageMaker);

        return "sboard/list";
    }

    /**
     * Read.
     *
     * @param bno   the bno
     * @param cri   the cri
     * @param model the model
     * @throws Exception the exception
     */
    @RequestMapping(value = "/readPage", method = RequestMethod.GET)
    public void read(@RequestParam("bno") int bno,
                     @ModelAttribute("cri") SearchCriteria cri,
                     Model model,
                     BoardVO boardVO,
                     HttpSession httpSession) throws Exception {

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategoodcnt(cntService.getGoodCntGet(bno));
        rateMaker.setRatebadcnt(cntService.getBadCntGet(bno));
        rateMaker.setRategb();
        cntService.changeGBPut(bno, rateMaker.getRategdivb());

        model.addAttribute(boardService.read(bno));                              // 글 읽기로! 조회수 증가(update)도 트랜잭션으로 있음!
        model.addAttribute("cateName", boardService.callCateName(bno));      // 카테고리 이름 가져오기.

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            model.addAttribute("goodCntVOGet", cntService.goodCntVOGet(loginUserVO.getUid(), bno));      // 굿씨앤티 브이오에 있는 거 가져오기.
            model.addAttribute("badCntVOGet", cntService.badCntVOGet(loginUserVO.getUid(), bno));        // 배드씨앤티 브이오에 있는 거 가져오기.
            model.addAttribute("spamCntVOGet", cntService.spamCntVOGet(loginUserVO.getUid(), bno));      // 스팸씨앤티 브이오에 있는 거 가져오기.
        }
    }

    /**
     * SQL delete 에서 update 로 바꿈. 전달 메소드는 remove지만 마이바티스는 update로!
     *
     * @param bno  the bno
     * @param cri  the cri
     * @param rttr the rttr
     * @return the string
     * @throws Exception the exception
     */
    @RequestMapping(value = "/removePage", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno,
                         @RequestParam(required = false, value = "cate") Integer cateNum,
                         SearchCriteria cri,
                         RedirectAttributes rttr) throws Exception {

        boardService.remove(bno); // SQL delete 에서 update 로 바꿈. 전달 메소드는 remove지만 마이바티스는 update로!

//        String valCatenum = String.valueOf(cateNum);

        if (cateNum != null) {
            rttr.addAttribute("page", cri.getPage());
            rttr.addAttribute("cate", cateNum); // RedirectAttributes 추가하면 URL 전달 가능 => 밑의 리턴값 "redirect: ... " 와 같겠지?
            rttr.addAttribute("perPageNum", cri.getPerPageNum());
            rttr.addAttribute("searchType", cri.getSearchType());
            rttr.addAttribute("keyword", cri.getKeyword());

            rttr.addFlashAttribute("msg", "SUCCESS");

            logger.info("lllll~~~~~ valCatenum 01 : " + cateNum);

            return "redirect:/sboard/list";
        }

        if (cateNum == null){
            rttr.addAttribute("page", cri.getPage());
            rttr.addAttribute("perPageNum", cri.getPerPageNum());
            rttr.addAttribute("keyword", cri.getKeyword());

            rttr.addFlashAttribute("msg", "SUCCESS");

            logger.info("lllll~~~~~ valCatenum 02 : " + cateNum);

            return "redirect:/sboard/listAny";
        }

//        else {
//            rttr.addAttribute("page", cri.getPage());
//            rttr.addAttribute("perPageNum", cri.getPerPageNum());
//            rttr.addAttribute("keyword", cri.getKeyword());
//
//            rttr.addFlashAttribute("msg", "SUCCESS");
//
//            logger.info("lllll~~~~~ valCatenum 02 : " + valCatenum);
//
//            return "redirect:/sboard/listAny";
//        }

        return null;

    }

    /**
     * Modify paging get.
     *
     * @param bno   the bno
     * @param cri   the cri
     * @param model the model
     * @throws Exception the exception
     */
    @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
    public void modifyPagingGET(int bno,
                                @ModelAttribute("cri") SearchCriteria cri,
                                Model model) throws Exception {
        model.addAttribute(boardService.read(bno));
    }

    /**
     * Modify paging post string.
     *
     * @param board the board
     * @param cri   the cri
     * @param rttr  the rttr
     * @return the string
     * @throws Exception the exception
     */
    @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
    public String modifyPagingPOST(BoardVO board,
                                   SearchCriteria cri,
                                   RedirectAttributes rttr,
                                   @RequestParam("cate") int cateNum) throws Exception {

        boardService.modify(board);

        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("cate", cateNum); // remove 메서드와 같이 RedirectAttributes의 GET 형식으로 URL을 전달하기 위해서. cate 어트리뷰트 추가!
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("searchType", cri.getSearchType());
        rttr.addAttribute("keyword", cri.getKeyword());

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/sboard/list";
    }

    /**
     * 등록 화면 Get
     *
     * @throws Exception the exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registGET() throws Exception {
        logger.info("lll~~~ regist get ........... lll~~~");
    }

    /**
     * 등록 화면 Post
     *
     * @param boardVO the boardVO
     * @param rttr  the rttr
     * @return the string
     * @throws Exception the exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registPOST(BoardVO boardVO,
                             RedirectAttributes rttr,
                             HttpServletRequest httpServletRequest,
                             HttpSession httpSession) throws Exception {

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            boardVO.setGetcolor(loginUserVO.getUday());   // 유저의 uday 숫자에 따라서 저장되는 보드 칼라숫자 달라짐
        }

        boardService.regist(boardVO);

        rttr.addFlashAttribute("msg", "SUCCESS");

        int cateInt = Integer.parseInt(httpServletRequest.getParameter("cate"));

        return "redirect:/sboard/list?cate=" + cateInt;
    }

    /**
     * Ajax로 호출되는 특정 게시물의 첨부파일을 처리하는 메소드를 아래와 같이 작성.
     *
     * @param bno 호출하는 경로는 '/sboard/getAttach/게시물 번호'의 형태가 됨.
     * @return 첨부파일의 문자열 리스트 형태로 작성.
     * @throws Exception
     */
    @RequestMapping("/getAttach/{bno}")
    @ResponseBody
    public List<String> getAttach(@PathVariable("bno") Integer bno) throws Exception {
        return boardService.getAttach(bno);
    }
}
