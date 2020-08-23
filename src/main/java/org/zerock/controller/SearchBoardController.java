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
import org.zerock.service.PointService;
import org.zerock.service.UserService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by macbookpro on 2017. 2. 12. PM 12:44
 * sp4chap11-Project / org.zerock.controller
 * No pain, No gain!
 * What :
 * Why :
 * How : 인스턴스 변수의 선언에서는 BoardService 객체를 주입 받을 수 있게 설계.
 */

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {

    private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);

    @Inject
    private BoardService boardService;      // 게시판 작성글 처리하는 서비스

    @Inject
    private CntService cntService;          // cnt 처리하는 서비스

    @Inject
    private PointService pointService;      // 포인트 처리하는 서비스

    @Inject
    private UserService userService;        // 유저 정보를 가져와서 처리하는 서비스

    /**
     * 게시판 리스트 페이지가 cate의 기준에 따라 나뉘어짐.
     * listAll()은 스프링 MVC의 Model 타입의 객체를 파라미터로 받음.
     * Model을 이용해서 모든 게시물을 JSP로 전송하는 작업을 model.addAttribute()로 처리.
     * 실제 화면에서 올바르게 동작하는지 확인하기 위해. listPage()에서는 크게 목록 데이터를 Model에 저장하는 작업과,
     * PageMaker를 구성해서 Model에 담는 작업이 이루어짐.
     *
     * @param cri   SearchCriteria -> cri
     *              스프링 MVC의 컨트롤러는 특정 URL에 해당하는 메소드를 실행할 때, 파라미터의 타입을 보고,
     *              해당 객체를 자동으로 생성.
     *              파라미터가 자동으로 수집되기 때문에, 바로 이전에 만든 Criteria라는 클래스를 그대로 사용할 수 있음.
     *              Criteria cri를 파라미터로 사용하고, Model 객체를 이용해서 발생하는 PageMaker를 저장.
     * @param model the model 클래스는 스프링 MVC에서 제공하는 데이터 전달용 객체라고 생각하면 됨.
     *              Model 클래스는 Map과 유사하게 '키'와 '값'으로 데이터를 저장하는 역할을 함.
     *              과거 Servlet에서는 RequestDispatcher에 데이터를 저장했듯이 스프링에서는 Model을 이용해서 데이터를 저장.
     *              // * @param cateNum 카테고리 - 넘버 기준으로 나뉨.
     *              Model을 이용해서 모든 게시물을 JSP로 전송하는 작업을 model.addAttribute()로 처리.
     *              페이징된 리스트 출력.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listPage(@ModelAttribute("cri") SearchCriteria cri,
                           Model model,
                           BoardVO boardVO,
                           @RequestParam(required = false, value = "cate") Integer cateNum
                           /*@RequestParam(required = false, value = "cntSortType") String cntSortType*/) throws Exception {

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategb();          // 지우면 안 됨! rateMaker 자체적으로 돌아감.

        boardVO.setCnum(cateNum); // 1~10 페이징 처리를 위하여 URL의 cate의 값을 가져와서-@RequestParam("cate)-셋 메서드 활용.
        model.addAttribute("list", boardService.listSearchCriteria(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setCnumFromBoardVO(boardVO.getCnum());            // 1~10 페이징에서 cate 넘버를 가져오기 위한 setter 메서드.
        pageMaker.setTotalCount(boardService.listSearchCount(cri)); // pageMaker.setTotalCount(boardService.listCountCriteria(cri));
        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("cateName", boardVO.getCnum());                                     // 리스트 목록 상단에 카테고리 이름 출력!
        model.addAttribute("cateName", boardService.callCateNameInList(boardVO.getCnum()));    // 게시판 상세 글의 카테고리 이름 출력

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
     * '@RequestParam 애노테이션은 Servlet에서 request.getParameter()의 효과와 유사.
     * '@RequestParam("bno")는 과거 request.getParameter("bno")처럼 동작.
     * Servlet의 HttpServletRequest와 다른점은 문자열, 숫자, 날짜 등의 형 변환이 가능하다는 점.
     *
     * @param bno   파라미터는 외부에서 전달될 bno 값을 전달받음.
     *              좀 더 명확하게 표현하기 위해서 '@RequestParam'을 이용해서 구성.
     *              조회된 결과 게시물을 JSP로 전달해야 하기 때문에 Model 객체를 사용.
     * @param cri   URI는 'readPage'로 설정했기 때문에 '/board/readPage?bno=xx&page=x&perPageNum=xxx'와 같은 식으로
     *              접근하게 되는 상황.
     *              page와 perPageNum 파라미터의 경우 Criteria 타입의 객체로 처리. bno 파라미터만 별도로 처리해 주었음.
     * @param model 스프링의 Model은 addAttribute() 작업을 할 때 아무런 이름 없이 데이터를 넣으면 자동으로 클래스의 이름을
     *              소문자로 시작해서 사용.
     *              즉, 위의 코드에 들어가는 데이터는 BoardVO 클래스의 객체이므로, 'boardVO'라는 이름으로 저장.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/readPage", method = RequestMethod.GET)
    public void read(@RequestParam("bno") int bno,
                     @ModelAttribute("cri") SearchCriteria cri,
                     Model model,
                     HttpSession httpSession) throws Exception {

        /* 좋아서 지우기 아까운 로거와 메서드들.
        String readPageDest = httpServletRequest.getQueryString();               //   page=1&cate=1102&perPageNum=10&searchType&keyword&cntSortType&bno=4590
        String readPageDest02 = httpServletRequest.getRequestURI();              //   /sboard/readPage
        StringBuffer readPageDest03 = httpServletRequest.getRequestURL();        //   http://localhost:8082/sboard/readPage
        String readPageDest04 = readPageDest03.toString();

        logger.info("lllll~~~~~ : " + httpServletRequest.getQueryString());
        logger.info("lllll~~~~~ : " + httpServletRequest.getRequestURI());
        logger.info("lllll~~~~~ : " + httpServletRequest.getRequestURL());

        logger.info("lllll~~~~~ : bno : " + bno + "cri." + cri.toString());

        logger.info("lllll~~~~~ : /" + readPageDest02 + "?" + readPageDest);
        */

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategoodcnt(cntService.getGoodCntGet(bno));
        rateMaker.setRatebadcnt(cntService.getBadCntGet(bno));
        rateMaker.setRategb();
        cntService.changeGBPut(bno, rateMaker.getRategdivb());

        //model.addAttribute(boardService.read(bno));   데이터 타입이 BoardVO 클래스라서 웹단(jsp)에서 ${boardVO.?}로 사용할 수 있음
        BoardVO boardVO = boardService.read(bno);
        UserVO userVO = userService.loginInfoNoPW(boardVO.getId());                 // 게시글 작성자의 아이디를 파라미터로 넘겨 유저 정보 가져옴

        /* 로그인한 사용자일 때만  readPage가 됐었음. 디버깅 완료 start */
        if (userVO != null) {
            boardVO.setUtotallevel(userVO.getUtotallevel());
            boardVO.setUcolorlevel(userVO.getUcolorlevel());
        }
        /* end */

        model.addAttribute("boardVO", boardVO); // 글 읽기로! 조회수 증가(update)도 트랜잭션으로 있음!
        model.addAttribute("cateName", boardService.callCateName(bno));      // 카테고리 이름 가져오기.

        Object object = httpSession.getAttribute("login");
        UserVO loginUserVO = (UserVO) object;
        if (object != null) {
            model.addAttribute("goodCntVOGet", cntService.goodCntVOGet(loginUserVO.getUid(), bno));      // 굿씨앤티 브이오에 있는 거 가져오기.
            model.addAttribute("badCntVOGet", cntService.badCntVOGet(loginUserVO.getUid(), bno));        // 배드씨앤티 브이오에 있는 거 가져오기.
            model.addAttribute("spamCntVOGet", cntService.spamCntVOGet(loginUserVO.getUid(), bno));      // 스팸씨앤티 브이오에 있는 거 가져오기.
        }
    }

    @RequestMapping(value = "/readPa", method = RequestMethod.GET)
    public void read(@RequestParam("bno") int bno,
                     @ModelAttribute("cri") SearchCriteria cri,
                     HttpServletRequest httpServletRequest,
                     HttpServletResponse httpServletResponse,
                     @RequestParam(required = false, value = "cate") String cateNum) throws Exception {

        String readPageDest = httpServletRequest.getQueryString();               //   page=1&cate=1102&perPageNum=10&searchType&keyword&cntSortType&bno=4590
        String readPageDest02 = httpServletRequest.getRequestURI();              //   /sboard/readPage

        boardService.cookieBoard(httpServletRequest, httpServletResponse, bno, cateNum); // 조회수 증가 서비스

        httpServletResponse.sendRedirect(readPageDest02 + "ge?" + readPageDest); // 바로 위 클래스로 리다이렉트 호출
    }

    /**
     * SQL delete 에서 update 로 바꿈. 전달 메소드는 remove지만 마이바티스는 update로!
     * 삭제에 대한 처리는 POST 방식으로 조회 화면에서 처리.
     * 삭제는 등록 기능과 유사한 부분이 많은데, 삭제 후 페이지의 이동을 제대로 처리하지 않으면 브라우저에서
     * '새로고침'을 통해 계속해서 동일한 데이터가 재전송될 수 있는 문제가 있음.
     *
     * @param bno  the bno
     * @param cri  파라미터로 Criteria를 사용하게 되었고, JSP로 전송되는 정보 역시 page와 perPageNum이 같이 전송되어야 함.
     * @param rttr 삭제 결과는 RedirectAttributes의 addFlashAttribute()를 이용해서 처리.
     *             삭제 결과는 임시로 사용하는 데이터이므로 addFlashAttribute()를 이용해서 처리.
     * @return 등록 작업과 마찬가지로 리다이렉트 방식으로 리스트 페이지로 이동시켜 버리는 것을 볼 수 있음.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/removePage", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno,
                         @RequestParam(required = false, value = "cate") Integer cateNum,
                         SearchCriteria cri,
                         RedirectAttributes rttr,
                         HttpSession httpSession) throws Exception {

        boardService.remove(bno, httpSession); // SQL delete 에서 update 로 바꿈. 전달 메소드는 remove지만 마이바티스는 update로!

        // 카테고리 리스트
        if (cateNum != null) {
            rttr.addAttribute("page", cri.getPage());
            rttr.addAttribute("cate", cateNum); // RedirectAttributes 추가하면 URL 전달 가능 => 밑의 리턴값 "redirect: ... " 와 같겠지?
            rttr.addAttribute("perPageNum", cri.getPerPageNum());
            rttr.addAttribute("searchType", cri.getSearchType());
            rttr.addAttribute("keyword", cri.getKeyword());

            rttr.addFlashAttribute("msg", "SUCCESS");

            return "redirect:/sboard/list";
        }

        // 전체검색 리스트
        if (cateNum == null) {
            rttr.addAttribute("page", cri.getPage());
            rttr.addAttribute("perPageNum", cri.getPerPageNum());
            rttr.addAttribute("keyword", cri.getKeyword());

            rttr.addFlashAttribute("msg", "SUCCESS");

            return "redirect:/sboard/listAny";
        }
        return null;
    }

    /**
     * modifyGET()은 GET 방식으로 조회 페이지로 이동. 이때는 다시 원래의 게시물 데이터를 읽어와서 Model에 넣어서 전달.
     * 수정 처리 역시 삭제와 유사하지만 다른점은 수정으로 들어가는 화면이 하나 더 존재한다는 점.
     * 사용자는 조회 페이지로 이동한 후 'MODIFY' 버튼을 클릭해서 수정화면으로 들어가고,
     * 수정 작업이 완료되면 원래의 목록 페이지로 이동.
     *
     * @param bno   the bno
     * @param cri   the cri
     * @param model the model
     * @throws Exception the exception
     */
    @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
    public void modifyPagingGET(int bno,
                                @ModelAttribute("cri") SearchCriteria cri,
                                Model model
    ) throws Exception {
        model.addAttribute(boardService.read(bno));
    }

    /**
     * modifyPOST()는 POST 방식으로 실제 수정 작업을 처리. 이때 리턴 타입은 등록이나 삭제와 동일하게 처리하는 것을 볼 수 있음.
     * 수정이 가능한 화면에서는 POST 방식으로 수정을 요청하게 되고,
     * 작업이 완료된 후에는 원래의 정보가 유지된 채로 목록 페이지로 이동하게 됨.
     *
     * @param board the board
     * @param cri   the cri
     * @param rttr  the rttr
     * @return 이때 리턴 타입은 등록이나 삭제와 동일하게 처리하는 것을 볼 수 있음.
     * 수정 작업 역시 삭제와 마찬가지로 모든 작업이 끝나면 다시 목록 페이지로 리다이렉트 되어야 하고,
     * 수정된 결과에 대해서는 'msg'로 전송
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
     * registerGET() 메소드의 선언에 사용된 @RequestMapping 애노테이션의 설정을 보면 특정한 URI를 의미하는 value 속성과 GET/POST 등의 전송방식으로 결정하는 method라는 속성을 사용.
     *
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registGET() {
    }

    /**
     * 글 등록 화면 Post / 실제로 화면에서 입력되어 들어오는 데이터를 처리하는 registPOST() 메소드의 파라미터는 자동으로 모든
     * 데이터를 BoardVO로 수집하도록 하는 부분과, 향후에 뷰로 데이터를 전달할 가능성이 있으므로 Model 클래스의 객체를 받도록 설계.
     *
     * @param boardVO the boardVO
     * @param rttr    실제로 화면에서 입력되어 들어오는 데이터를 처리하는 registPOST() 메소드의 파라미터는
     *                자동으로 모든 데이터를 BoardVO로 수지바도록 하는 부분과, 향후에 뷰로 데이터를 전달할 가능성이 있으므로
     *                Model 클래스의 객체를 받도록 설계.
     * @return the string
     * @throws Exception the exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registPOST(BoardVO boardVO,
                             RedirectAttributes rttr,
                             HttpServletRequest httpServletRequest,
                             HttpSession httpSession) throws Exception {

        boardService.regist(boardVO, httpSession);

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

    /* 삭제 요망 - 없애는 상위 메뉴임 start */
    @RequestMapping(value = "/popList", method = RequestMethod.GET)
    public String popList(@ModelAttribute("cri") SearchCriteria cri,
                          Model model,
                          BoardVO boardVO
                          /*@RequestParam(required = false, value = "cate") Integer cateNum*/) throws Exception {

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategb();

        boardVO.setCnum(1101); // 1~10 페이징 처리를 위하여 URL의 cate의 값을 가져와서-@RequestParam("cate)-셋 메서드 활용.
        model.addAttribute("list", boardService.listSearchCriteria(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setCnumFromBoardVO(boardVO.getCnum());            // 1~10 페이징에서 cate 넘버를 가져오기 위한 setter 메서드.
        pageMaker.setTotalCount(boardService.listSearchCount(cri)); // pageMaker.setTotalCount(boardService.listCountCriteria(cri));
        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("cateName", boardVO.getCnum());                                     // 리스트 목록 상단에 카테고리 이름 출력!
        model.addAttribute("cateName", boardService.callCateNameInList(boardVO.getCnum()));    // 게시판 상세 글의 카테고리 이름 출력

        return "/pop/popList";
    }
    /* 삭제 요망 - 없애는 상위 메뉴임 start */

    /**
     * 실시간 인기 검색
     *
     * @param cri
     * @param cateNum
     * @param boardVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/livePopular", method = RequestMethod.GET)
    public String livePopular(@ModelAttribute("cri") SearchCriteria cri,
                              @RequestParam(required = false, value = "cate") Integer cateNum,
                              BoardVO boardVO,
                              Model model) throws Exception {

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategb();

        boardVO.setCnum(cateNum); // 1~10 페이징 처리를 위하여 URL의 cate의 값을 가져와서-@RequestParam("cate)-셋 메서드 활용.
        model.addAttribute("livePopular", boardService.livePopular(cri));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setCnumFromBoardVO(boardVO.getCnum());            // 1~10 페이징에서 cate 넘버를 가져오기 위한 setter 메서드.
        pageMaker.setTotalCount(boardService.livePopularCount(cri));
        model.addAttribute("pageMakerLivePopular", pageMaker);
        model.addAttribute("cateName", "실시간 인기 검색");                                // 리스트 목록 상단에 카테고리 이름 출력!
//        model.addAttribute("cateName", boardService.callCateNameInList(boardVO.getCnum()));    // 게시판 상세 글의 카테고리 이름 출력

        return "sboard/list";
    }

    /**
     * sameColor 같은 색깔 검색
     *
     * @param cri
     * @param cateNum
     * @param boardVO
     * @param model
     * @param userVO
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/samePopular", method = RequestMethod.GET)
    public String samePopular(@ModelAttribute("cri") SearchCriteria cri,
                              @RequestParam(required = false, value = "cate") Integer cateNum,
                              BoardVO boardVO,
                              Model model,
                              UserVO userVO,
                              HttpSession httpSession) throws Exception {

        RateMaker rateMaker = new RateMaker();
        rateMaker.setRategb();

        boardVO.setCnum(cateNum); // 1~10 페이징 처리를 위하여 URL의 cate의 값을 가져와서-@RequestParam("cate)-셋 메서드 활용.
        model.addAttribute("samePopular", boardService.samePopular(cri, boardVO, userVO, httpSession));

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setCnumFromBoardVO(boardVO.getCnum());            // 1~10 페이징에서 cate 넘버를 가져오기 위한 setter 메서드.
        pageMaker.setTotalCount(boardService.samePopularCount(cri, boardVO, userVO, httpSession));
        model.addAttribute("pageMakerSamePopular", pageMaker);
        model.addAttribute("cateName", "Color");                                     // 리스트 목록 상단에 카테고리 이름 출력!
//        model.addAttribute("cateName", boardService.callCateNameInList(boardVO.getCnum()));    // 게시판 상세 글의 카테고리 이름 출력

        return "sboard/list";
    }


}
