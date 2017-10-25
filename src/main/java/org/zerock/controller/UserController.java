package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.PointInsertVO;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.PointService;
import org.zerock.service.UserService;
import org.zerock.util.PointUtils;
import org.zerock.util.UnifyMessage;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * Created by wtime on 2017-02-21. 오후 1:28
 * org.zerock.controller / Web03
 * It's now or never!
 * What : HttpSession을 이용하는 로그인 처리를 위한 UserController
 * Why : 회원가입 및 로그인시 회원정보를 계속 유지하려고(HttpSession)
 * How : 스프링 MVC는 컨트롤러에서 필요한 모든 자원을 파라미터에서 수집해서 처리하기 때문에 HttpServletRequest나 HttpSession과
 * 같은 자원들 역시 파라미터로 처리해도 아무런 문제가 없다. 컨트롤러 패키지에 있는 controller는 좀 더 순수하게 데이터를 만들어 내는데 집중하고,
 * 인터셉터를 이용해서 HttpSession을 처리하도록
 * UserController - UserService - UserDAO - LoginDTO, UserVO
 */

@Controller
@RequestMapping("/user")
public class UserController {

    /**
     * The constant logger.
     */
    public static final Logger logger =
            LoggerFactory.getLogger(UserController.class);

    @Inject
    private UserService userService;

    @Inject
    private PointService pointService;

    /**
     * Login get string.
     *
     * @param dto the dto
     * @return the string
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("dto") LoginDTO dto) {

        return "user/shop-ui-login";
    }

    /**
     * Login post. 기존의 컨트롤러 패키지의 controller들과 전혀 차이가 없이 POST 방식으로 파라미터를 이용해서 Model에 UserVO 객체 추가
     *
     * @param dto     the dto
     * @param session the session
     * @param model   the model Model에 UserVO 객체 추가
     *                model.addAttribute("userVO", vo); 실제로 로그인 처리가 이뤄지는 loginPost()에서는 Model 객체에 사용자가 존재하는 경우에 'userVO'라는 이름으로 저장
     * @throws Exception the exception
     */
    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO dto,
                          HttpSession session,
                          Model model) throws Exception {

        UserVO vo = userService.login(dto);

        if (vo == null) {
            return;
        }

        model.addAttribute("userVO", vo);

        if (dto.isUseCookie()) {

            int amount = 60 * 60 * 24 * 7;

            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

            userService.keepLogin(vo.getUid(), session.getId(), sessionLimit);
        }
    }

    /**
     * Register get string. 회원가입 페이지 Step01. 이용 약관 동의 후 정보 입력 화면으로 넘어가게
     *
     * @return the string
     */
    @RequestMapping(value = "/shop-ui-register", method = RequestMethod.GET)
    public String registerGET() {

        return "user/shop-ui-register";
    }

    /**
     * Register 02 컨트롤러를 구현할 때 처리 후 특정 페이지로 리다이렉트하고 싶다면 "redirect:경로"를
     * 뷰 이름 대신에 리턴하면 된다.
     *
     * @return the string /user/shop-ui-register02를 GET 방식으로 접근한 경우 약관 동의 화면인 /shop-ui-register 경로로 리다이렉트 시킬 수 있다.
     */
    @RequestMapping(value = "/shop-ui-register02", method = RequestMethod.GET)
    public String register02GEThadle() {
        return "redirect:/user/shop-ui-register";
    }

    /**
     * Register 02 post. Step01 약관 동의화면에서 form 액션/form으로 감싸서 여기로 post로 넘김
     * 요청 파라마터(Request Parameter)에 접근하는 방법은 HttpservletRequest request를 이용해도
     * 되겠지만 요청 파라미터 개수가 얼마 안 될 때에는 @RequestParam 애노테이션을 사용해도 된다.
     * shop-ui-register.jsp(약관 동의)에서 agree 요청 파라미터의 값을
     * 읽어와 agreeVal 파라미터에 할당하고 요청 파라미터 값이 없으면
     * "false" 문자열을 사용한다.
     *
     * @param agreeVal the agreeVal 스프링 MVC는 실제 파라미터의 타입에 맞게 String 값을 변환해준다 agree 요청  파라미터의 갑을 읽어와                 Boolean 타입으로 변환해서 agreeVal 파라미터에 전달한다.
     * @return the string 약관에 동의했다면 입력 폼을 보여주기 위해 "user/shop-ui-register02"를 뷰 이름으로 리턴한다.
     */
    @RequestMapping(value = "/shop-ui-register02", method = RequestMethod.POST)
    public String register02POST(
            @RequestParam(value = "agree", defaultValue = "false") Boolean agreeVal) {
        if (!agreeVal) {
            return "user/shop-ui-register";
        }
        return "user/shop-ui-register02";
    }

    /**
     * Register post string. /shop-ui-register02 에서 form action=/registPost /form 태그로 감싸져 있는 회원 개인정보 등록.
     * ModelAttribute 애노테이션은 모델에서 사용할 속성 이름을 값으로 설정하며,
     * 예를 들어, 뷰 코드에서 "formData"라는 이름을 사용해서 커맨드 객체에 접근할 수 있도록 만들어준다.
     *
     * @param userVO        the user vo
     * @param rttr          the rttr
     * @param bindingResult the binding result
     * @return the string 아무 이상 없이 회원가입 되었다면 /shop-ui-register03 가입 축하 페이지로 넘어간다
     * @throws Exception the exception
     */
    @RequestMapping(value = "/registPost", method = RequestMethod.POST)
    public String registerPOST(@Valid UserVO userVO,
                               RedirectAttributes rttr,
                               BindingResult bindingResult) throws Exception {

        logger.info("lll~~~ user regist post ........... lll~~~");
        logger.info("lll~~~ userVO.toString() ........... lll~~~" + userVO.toString() + "lll~~~ userVO.toString() ........... lll~~~");

        if (bindingResult.hasErrors()) {
            logger.info("lll~~~ Binding Result has error! lll~~~");
            List<ObjectError> errors = bindingResult.getAllErrors();

            for (ObjectError error : errors) {
                logger.info("lll~~~ error : {}, {}", error.getCode(), error.getDefaultMessage() + " lll~~~");
            }

            return "user/shop-ui-register02";
        }

        userService.regist(userVO);

        PointUtils pointUtils = new PointUtils(userVO.getUid(), "회원가입", Integer.parseInt(UnifyMessage.getMessage("RegisterPoint")));
        PointInsertVO pointInsertVO = new PointInsertVO();
        pointInsertVO.setPinsid(userVO.getUid());
        pointInsertVO.setPinspoint(Integer.parseInt(UnifyMessage.getMessage("RegisterPoint"))); // 회원가입시 100 포인트 증정
        pointInsertVO.setPinsdeldate(pointUtils.getDeleteScheduleDate());
        pointInsertVO.setPinscontent(pointUtils.getSavingPointContent());
        pointService.insertOperPoint(pointInsertVO);

        rttr.addFlashAttribute("msg", "SUCCESS");

//        return "redirect:/home";
//        return "redirect:/user/shop-ui-register03";
        return "user/shop-ui-register03";
    }

    /**
     * Modify get.
     */
    @RequestMapping(value = "/shop-ui-modify", method = RequestMethod.GET)
    public void modifyGET() {

    }

    /**
     * Modify post.
     */
    @RequestMapping(value = "/shop-ui-modify", method = RequestMethod.POST)
    public void modifyPOST() {

    }


    /**
     * Logout. HttpSession인 경우 login과 같이 저장된 정보를 삭제하고, invalidate()를 주는 작업과 쿠키의 유효시간을 변경하는 작업으로 이루어짐
     *
     * @param request  the request
     * @param response the response
     * @param session  the session
     * @throws Exception the exception
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request,
                       HttpServletResponse response,
                       HttpSession session) throws Exception {

        logger.info("lll~~~ logout..................1 lll~~~");

        Object obj = session.getAttribute("login");

        if (obj != null) {

            UserVO vo = (UserVO) obj;

            logger.info("lll~~~ logout.......................2 lll~~~");

            session.removeAttribute("login");
            session.invalidate();

            logger.info("lll~~~ logout............................3 lll~~~");

            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

            if (loginCookie != null) {

                logger.info("lll~~~ logout.................................4 lll~~~");

                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                userService.keepLogin(vo.getUid(), session.getId(), new Date());
            }
        }
//        밑의 리턴들은 모두 uri 맵핑오류 발생
//        return "/";
//        return "home";

        return "redirect:/home";
    }
}
