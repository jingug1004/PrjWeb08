package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.service.BoardService;

import javax.inject.Inject;

/**
 * Created by macbookpro on 2017. 2. 4.. PM 1:35
 * What :
 * Why :
 * How : 인스턴스 변수의 선언에서는 BoardService 객체를 주입 받을 수 있게 설계.
 */
@Controller
@RequestMapping("/board/*")
public class BoardController {

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Inject
    private BoardService service;

    /**
     * registerGET() 메소드의 선언에 사용된 @RequestMapping 애노테이션의 설정을 보면 특정한 URI를 의미하는 value 속성과 GET/POST 등의 전송방식으로 결정하는 method라는 속성을 사용.
     *
     * @param board the board
     * @param model Model 클래스는 스프링 MVC에서 제공하는 데이터 전달용 객체라고 생각하면 됨. Model 클래스는 Map과 유사하게 '키'와 '값'으로 데이터를 저장하는 역할을 함. 과거 Servlet에서는 RequestDispatcher에 데이터를 저장했듯이 스프링에서는 Model을 이용해서 데이터를 저장.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void registerGET(BoardVO board, Model model) throws Exception {

        logger.info("lll~~~ register get ........... lll~~~");

    }

    /**
     * 실제로 화면에서 입력되어 들어오는 데이터를 처리하는 registPOST() 메소드의 파라미터는 자동으로 모든 데이터를 BoardVO로 수지바도록 하는 부분과, 향후에 뷰로 데이터를 전달할 가능성이 있으므로 Model 클래스의 객체를 받도록 설계.
     *
     * @param board the board
     * @param rttr  재전송의 문제는 막을 수 있었지만, 마지막에 같이 전송되는 'result=SUCCESS' 문자열은 지워지지 않고 남기 때문에 페이지를 '새로 고침'했을 때 계속 남는 문제점. RedirectAttributes 객체는 리다이렉트 시점에 한 번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()라는 기능을 지원.              addFlashAttribute()는 브라우저까지 전송되기는 하지만, URI 상에는 보이지 않는 숨겨진 데이터의 형태로 전달.
     * @return the string
     * @throws Exception the exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registPOST(BoardVO board,
                             RedirectAttributes rttr) throws Exception {
        //public String registPOST(BoardVO board, Model model) throws Exception {

        logger.info("lll~~~ regist post ........... lll~~~");
        logger.info("lll~~~ " + board.toString() + " lll~~~");

        service.regist(board);

        rttr.addFlashAttribute("msg", "success");
        //model.addAttribute("result", "success");

        return "redirect:/board/listAll";
        //return "/board/success";
    }

    /**
     * listAll()은 스프링 MVC의 Model 타입의 객체를 파라미터로 받음. Model을 이용해서 모든 게시물을 JSP로 전송하는 작업을 model.addAttribute()로 처리.
     *
     * @param model Model을 이용해서 모든 게시물을 JSP로 전송하는 작업을 model.addAttribute()로 처리.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/listAll", method = RequestMethod.GET)
    public void listAll(Model model) throws Exception {

        logger.info("lll~~~ show All list................. lll~~~");
        model.addAttribute("list", service.listAll());

    }

    /* --- 밑의 124 라인 ------------------------------------------
    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public void read(@RequestParam("bno") int bno,
                     Model model) throws Exception {

        model.addAttribute(service.read(bno));
    }
    */

    /* --- 밑의 134 라인 ------------------------------------------
    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) throws Exception {

        service.remove(bno);

        rttr.addFlashAttribute("msg", "success");

        return "redirect:/board/listAll";
    }
    */

    /**
     * modifyGET()은 GET 방식으로 조회 페이지로 이동. 이때는 다시 원래의 게시물 데이터를 읽어와서 Model에 넣어서 전달.
     *
     * @param bno   the bno
     * @param model the model
     * @throws Exception the exception
     */
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void modifyGET(int bno, Model model) throws Exception {

        model.addAttribute(service.read(bno));
    }

    /**
     * modifyPOST()는 POST 방식으로 실제 수정 작업을 처리. 이때 리턴 타입은 등록이나 삭제와 동일하게 처리하는 것을 볼 수 있음.
     *
     * @param board the board
     * @param rttr  the rttr
     * @return 이때 리턴 타입은 등록이나 삭제와 동일하게 처리하는 것을 볼 수 있음.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(BoardVO board,
                             RedirectAttributes rttr) throws Exception {

        logger.info("lll~~~ mod post............ lll~~~");

        service.modify(board);
        rttr.addFlashAttribute("msg", "success");

        return "redirect:/board/listAll";
    }

    /**
     * 페이징된 리스트 출력.
     *
     * @param cri   스프링 MVC의 컨트롤러는 특정 URL에 해당하는 메소드를 실행할 때, 파라미터의 타입을 보고, 해당 객체를 자동으로 생성. 파라미터가 자동으로 수집되기 때문에, 바로 이전에 만든 Criteria라는 클래스를 그대로 사용할 수 있음.
     * @param model the model
     * @throws Exception the exception
     */
    @RequestMapping(value = "/listCri", method = RequestMethod.GET)
    public void listAll(Criteria cri, Model model) throws Exception {

        logger.info("lll~~~ show list Page with Criteria...................... lll~~~");

        model.addAttribute("list", service.listCriteria(cri));

    }

    /**
     * 실제 화면에서 올바르게 동작하는지 확인하기 위해. listPage()에서는 크게 목록 데이터를 Model에 저장하는 작업과, PageMaker를 구성해서 Model에 담는 작업이 이루어짐.
     *
     * @param cri   Criteria cri를 파라미터로 사용하고, Model 객체를 이용해서 발생하는 PageMaker를 저장.
     * @param model the model
     * @throws Exception the exception
     */
    @RequestMapping(value = "/listPage", method = RequestMethod.GET)
    public void listPage(@ModelAttribute("cri") Criteria cri,
                         Model model) throws Exception {

        logger.info("lll~~~" + cri.toString() + "lll~~~");

        model.addAttribute("list", service.listCriteria(cri));
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        // pageMaker.setTotalCount(131);

        pageMaker.setTotalCount(service.listCountCriteria(cri));

        model.addAttribute("pageMaker", pageMaker);
    }

    /**
     * '@RequestParam 애노테이션은 Servlet에서 request.getParameter()의 효과와 유사.
     * '@RequestParam("bno")는 과거 request.getParameter("bno")처럼 동작. Servlet의 HttpServletRequest와 다른점은 문자열, 숫자, 날짜 등의 형 변환이 가능하다는 점.
     *
     * @param bno   파라미터는 외부에서 전달될 bno 값을 전달받음. 좀 더 명확하게 표현하기 위해서 '@RequestParam'을 이용해서 구성. 조회된 결과 게시물을 JSP로 전달해야 하기 때문에 Model 객체를 사용.
     * @param cri   URI는 'readPage'로 설정했기 때문에 '/board/readPage?bno=xx&page=x&perPageNum=xxx'와 같은 식으로 접근하게 되는 상황. page와 perPageNum 파라미터의 경우 Criteria 타입의 객체로 처리. bno 파라미터만 별도로 처리해 주었음.
     * @param model 스프링의 Model은 addAttribute() 작업을 할 때 아무런 이름 없이 데이터를 넣으면 자동으로 클래스의 이름을 소문자로 시작해서 사용. 즉, 위의 코드에 들어가는 데이터는 BoardVO 클래스의 객체이므로, 'boardVO'라는 이름으로 저장.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/readPage", method = RequestMethod.GET)
    public void read(@RequestParam("bno") int bno,
                     @ModelAttribute("cri") Criteria cri,
                     Model model) throws Exception {

        model.addAttribute(service.read(bno));
    }

    /**
     * 삭제에 대한 처리는 POST 방식으로 조회 화면에서 처리. 삭제는 등록 기능과 유사한 부분이 많은데, 삭제 후 페이지의 이동을 제대로 처리하지 않으면 브라우저에서 '새로고침'을 통해 계속해서 동일한 데이터가 재전송될 수 있는 문제가 있음.
     *
     * @param bno  the bno
     * @param cri  파라미터로 Criteria를 사용하게 되었고, JSP로 전송되는 정보 역시 page와 perPageNum이 같이 전송되어야 함.
     * @param rttr 삭제 결과는 RedirectAttributes의 addFlashAttribute()를 이용해서 처리. 삭제 결과는 임시로 사용하는 데이터이므로 addFlashAttribute()를 이용해서 처리.
     * @return 등록 작업과 마찬가지로 리다이렉트 방식으로 리스트 페이지로 이동시켜 버리는 것을 볼 수 있음.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/removePage", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno,
                         Criteria cri,
                         RedirectAttributes rttr) throws Exception {

        service.remove(bno);

        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addFlashAttribute("msg", "success");

        return "redirect:/board/listPage";
    }

    /**
     * 수정 처리 역시 삭제와 유사하지만 다른점은 수정으로 들어가는 화면이 하나 더 존재한다는 점. 사용자는 조회 페이지로 이동한 후 'MODIFY' 버튼을 클릭해서 수정화면으로 들어가고, 수정 작업이 완료되면 원래의 목록 페이지로 이동.
     *
     * @param bno   the bno
     * @param cri   the cri
     * @param model the model
     * @throws Exception the exception
     */
    @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
    public void modifyPagingGET(@RequestParam("bno") int bno,
                                @ModelAttribute("cri") Criteria cri,
                                Model model) throws Exception {

        model.addAttribute(service.read(bno));
    }

    /**
     * 수정이 가능한 화면에서는 POST 방식으로 수정을 요청하게 되고, 작업이 완료된 후에는 원래의 정보가 유지된 채로 목록 페이지로 이동하게 됨.
     *
     * @param boardVO the board vo
     * @param cri     the cri
     * @param rttr    the rttr
     * @return 수정 작업 역시 삭제와 마찬가지로 모든 작업이 끝나면 다시 목록 페이지로 리다이렉트 되어야 하고, 수정된 결과에 대해서는 'msg'로 전송.
     * @throws Exception the exception
     */
    @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
    public String modifyPagingPOST(BoardVO boardVO,
                                   Criteria cri,
                                   RedirectAttributes rttr) throws Exception {

        service.modify(boardVO);

        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addFlashAttribute("msg", "success");

        return "redirect:/board/listPage";

    }

}