//package org.zerock.controller;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//import org.zerock.domain.BoardVO;
//import org.zerock.domain.Criteria;
//import org.zerock.domain.PageMaker;
//import org.zerock.service.BoardService;
//
//import javax.inject.Inject;
//
///**
// * Created by macbookpro on 2017. 2. 4.. PM 1:35
// * What :
// * Why :
// */
//@Controller
//@RequestMapping("/board/*")
//public class BoardController {
//
//    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
//
//    @Inject
//    private BoardService service;
//
//    /**
//     *
//     * @param board the board
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/register", method = RequestMethod.GET)
//    public void registerGET(BoardVO board, Model model) throws Exception {
//
//        logger.info("lll~~~ register get ........... lll~~~");
//
//    }
//
//    /**
//     *
//     * @param board the board
//     * @return the string
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String registPOST(BoardVO board,
//                             RedirectAttributes rttr) throws Exception {
//        //public String registPOST(BoardVO board, Model model) throws Exception {
//
//        logger.info("lll~~~ regist post ........... lll~~~");
//        logger.info("lll~~~ " + board.toString() + " lll~~~");
//
//        service.regist(board);
//
//        rttr.addFlashAttribute("msg", "success");
//        //model.addAttribute("result", "success");
//
//        return "redirect:/board/listAll";
//        //return "/board/success";
//    }
//
//    /**
//     *
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
//    public void listAll(Model model) throws Exception {
//
//        logger.info("lll~~~ show All list................. lll~~~");
//        model.addAttribute("list", service.listAll());
//
//    }
//
//    /* --- 밑의 124 라인 ------------------------------------------
//    @RequestMapping(value = "/read", method = RequestMethod.GET)
//    public void read(@RequestParam("bno") int bno,
//                     Model model) throws Exception {
//
//        model.addAttribute(service.read(bno));
//    }
//    */
//
//    /* --- 밑의 134 라인 ------------------------------------------
//    @RequestMapping(value = "/remove", method = RequestMethod.POST)
//    public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {
//
//        service.remove(bno);
//
//        rttr.addFlashAttribute("msg", "success");
//
//        return "redirect:/board/listAll";
//    }
//    */
//
//    /**
//     *
//     * @param bno   the bno
//     * @param model the model
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/modify", method = RequestMethod.GET)
//    public void modifyGET(int bno,
//                          Model model) throws Exception {
//
//        model.addAttribute(service.read(bno));
//    }
//
//    /**
//     *
//     *
//     * @param board the board
//     * @param rttr  the rttr
//     * @return
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/modify", method = RequestMethod.POST)
//    public String modifyPOST(BoardVO board,
//                             RedirectAttributes rttr) throws Exception {
//
//        logger.info("lll~~~ mod post............ lll~~~");
//
//        service.modify(board);
//        rttr.addFlashAttribute("msg", "success");
//
//        return "redirect:/board/listAll";
//    }
//
//    /**
//     *
//     * @param cri
//     * @param model the model
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/listCri", method = RequestMethod.GET)
//    public void listAll(Criteria cri, Model model) throws Exception {
//
//        logger.info("lll~~~ show list Page with Criteria...................... lll~~~");
//
//        model.addAttribute("list", service.listCriteria(cri));
//
//    }
//
//    /**
//     *
//     * @param cri
//     * @param model the model
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
//    public void listPage(@ModelAttribute("cri") Criteria cri,
//                         Model model) throws Exception {
//
//        logger.info("lll~~~" + cri.toString() + "lll~~~");
//
//        model.addAttribute("list", service.listCriteria(cri));
//        PageMaker pageMaker = new PageMaker();
//        pageMaker.setCri(cri);
//        // pageMaker.setTotalCount(131);
//
//        pageMaker.setTotalCount(service.listCountCriteria(cri));
//
//        model.addAttribute("pageMaker", pageMaker);
//    }
//
//    /**
//     *
//     * @param bno
//     * @param cri
//     * @param model
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/readPage", method = RequestMethod.GET)
//    public void read(@RequestParam("bno") int bno,
//                     @ModelAttribute("cri") Criteria cri,
//                     Model model) throws Exception {
//
//        model.addAttribute(service.read(bno));
//    }
//
//    /**
//     *
//     *
//     * @param bno  the bno
//     * @param cri
//     * @param rttr
//     * @return
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/removePage", method = RequestMethod.POST)
//    public String remove(@RequestParam("bno") int bno,
//                         Criteria cri,
//                         RedirectAttributes rttr) throws Exception {
//
//        service.remove(bno);
//
//        rttr.addAttribute("page", cri.getPage());
//        rttr.addAttribute("perPageNum", cri.getPerPageNum());
//        rttr.addFlashAttribute("msg", "success");
//
//        return "redirect:/board/listPage";
//    }
//
//    /**
//     *
//     *
//     * @param bno   the bno
//     * @param cri   the cri
//     * @param model the model
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
//    public void modifyPagingGET(@RequestParam("bno") int bno,
//                                @ModelAttribute("cri") Criteria cri,
//                                Model model) throws Exception {
//
//        model.addAttribute(service.read(bno));
//    }
//
//    /**
//     *
//     *
//     * @param boardVO the board vo
//     * @param cri     the cri
//     * @param rttr    the rttr
//     * @return .
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
//    public String modifyPagingPOST(BoardVO boardVO,
//                                   Criteria cri,
//                                   RedirectAttributes rttr) throws Exception {
//
//        service.modify(boardVO);
//
//        rttr.addAttribute("page", cri.getPage());
//        rttr.addAttribute("perPageNum", cri.getPerPageNum());
//        rttr.addFlashAttribute("msg", "success");
//
//        return "redirect:/board/listPage";
//
//    }
//
//}