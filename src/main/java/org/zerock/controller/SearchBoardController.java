package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.BoardService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
    private BoardService service;

    /**
     * 게시판 리스트 페이지가 cate의 기준에 따라 나뉘어짐.
     *
     * @param cri     the cri
     * @param model   the model
     * @param cateNum 카테고리 - 넘버 기준으로 나뉨.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listPage(@ModelAttribute("cri") SearchCriteria cri,
//                         @RequestParam("cate") int cate,
                           Model model,
                           BoardVO boardVO,
                           @RequestParam("cate") int cateNum) throws Exception {

        logger.info("lll~~~ cri.toString() : " + cri.toString() + " lll~~~");

        // 1~10 페이징 처리를 위하여 URL의 cate의 값을 가져와서-@RequestParam("cate)-셋 메서드 활용.
        boardVO.setCnum(cateNum);

        // model.addAttribute("list", service.listCriteria(cri));
        model.addAttribute("list", service.listSearchCriteria(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);

        // 1~10 페이징에서 cate 넘버를 가져오기 위한 setter 메서드.
        pageMaker.setCnumFromBoardVO(boardVO.getCnum());

        // pageMaker.setTotalCount(service.listCountCriteria(cri));
        pageMaker.setTotalCount(service.listSearchCount(cri));

        model.addAttribute("pageMaker", pageMaker);

        return "sboard/list";
    }

    @RequestMapping(value = "/listAny", method = RequestMethod.GET)
    public String listAnyPage(@ModelAttribute("criteria") SearchCriteria criteria,
                              Model model,
                              RedirectAttributes redirectAttributes) throws Exception {

        logger.info("lll~~~ criteria.toString() listAny : " + criteria.toString() + " lll~~~");

        model.addAttribute("listAny", service.listSearchAny(criteria));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(criteria);

        pageMaker.setTotalCount(service.listSearchAnyCount(criteria));

        model.addAttribute("pageMakerAny", pageMaker);

        logger.info("lll~~~ pageMaker.setCri(criteria) listAny : " + pageMaker.getCri() + " lll~~~");
        logger.info("lll~~~ pageMaker.setTotalCount(service.listSearchAnyCount(criteria)) listAny : "
                + pageMaker.getTotalCount() + " lll~~~");

//        redirectAttributes.addAttribute("msg", "SUCCESS");

        /*
         * 전체 리스트 조회된 후에 카테 검색과 다시 전체검색 돋보기 버튼, 글쓰기 버튼이 동작되지 않는다.
         * list02 그대로 만들어서 그냥 지워버려도 될 듯.
         */
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
                     Model model)
            throws Exception {

//        Map<String, Object> paramMap = new HashMap<>();
//
//        paramMap.put("cateNum", cri);
//        paramMap.put("bno", bno);
//
//        logger.info("lll~~~ cri : " + cri);
//        logger.info("lll~~~ bno : " + bno);

        model.addAttribute(service.read(bno));
        model.addAttribute("cateName", service.callCateName(bno));

        logger.info("lll~~~ service.callCateName(bno) : " + service.callCateName(bno));

    }

    /**
     * Remove string.
     *
     * @param bno  the bno
     * @param cri  the cri
     * @param rttr the rttr
     * @return the string
     * @throws Exception the exception
     */
    @RequestMapping(value = "/removePage", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno,
                         @RequestParam("cate") int cateNum,
                         SearchCriteria cri,
                         RedirectAttributes rttr) throws Exception {

        service.remove(bno);

        rttr.addAttribute("page", cri.getPage());

        // RedirectAttributes 추가하면 URL 전달 가능 => 밑의 리턴값 "redirect: ... " 와 같겠지?
        rttr.addAttribute("cate", cateNum);

        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("searchType", cri.getSearchType());
        rttr.addAttribute("keyword", cri.getKeyword());

        rttr.addFlashAttribute("msg", "SUCCESS");

        return "redirect:/sboard/list";
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

        model.addAttribute(service.read(bno));
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

        logger.info(cri.toString());
        service.modify(board);

        rttr.addAttribute("page", cri.getPage());

        // remove 메서드와 같이 RedirectAttributes의 GET 형식으로 URL을 전달하기 위해서. cate 어트리뷰트 추가!
        rttr.addAttribute("cate", cateNum);

        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("searchType", cri.getSearchType());
        rttr.addAttribute("keyword", cri.getKeyword());

        rttr.addFlashAttribute("msg", "SUCCESS");

        logger.info(rttr.toString());

        return "redirect:/sboard/list";
    }

    /**
     * Regist get.
     *
     * @throws Exception the exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registGET() throws Exception {

        logger.info("lll~~~ regist get ........... lll~~~");
    }

    /**
     * Regist post string.
     *
     * @param board the board
     * @param rttr  the rttr
     * @return the string
     * @throws Exception the exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registPOST(BoardVO board,
                             RedirectAttributes rttr,
                             HttpServletRequest httpServletRequest) throws Exception {

        logger.info("lll~~~ regist post ........... lll~~~");
        logger.info(board.toString());

        service.regist(board);

        rttr.addFlashAttribute("msg", "success");

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

        return service.getAttach(bno);
    }

    // @RequestMapping(value = "/list", method = RequestMethod.GET)
    // public void listPage(@ModelAttribute("cri") SearchCriteria cri,
    // Model model) throws Exception {
    //
    // logger.info(cri.toString());
    //
    // model.addAttribute("list", service.listCriteria(cri));
    //
    // PageMaker pageMaker = new PageMaker();
    // pageMaker.setCri(cri);
    //
    // pageMaker.setTotalCount(service.listCountCriteria(cri));
    //
    // model.addAttribute("pageMaker", pageMaker);

    // }

}
