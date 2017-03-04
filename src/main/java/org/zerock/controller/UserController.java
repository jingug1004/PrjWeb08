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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

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
 */

@Controller
@RequestMapping("/user")
public class UserController {

//    @RequestMapping(value = "/shop-ui-login")
//    public String login() {
//
//        return "shop-ui-login";
//    }

    public static final Logger logger =
            LoggerFactory.getLogger(UserController.class);

//    @RequestMapping(value = "/shop-ui-login")
//    public void login() {
//
//    }
//
//    @RequestMapping(value = "/login_success")
//    public void login_success() {
//
//    }
//
//    @RequestMapping(value = "/login_duplicate")
//    public void login_duplicate() {
//
//    }
//
//    @RequestMapping(value = "/logout")
//    public void logout() {
//
//    }

    @Inject
    private UserService service;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("dto") LoginDTO dto) {

        return "user/shop-ui-login";
    }

    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO dto,
                          HttpSession session,
                          Model model) throws Exception {

        UserVO vo = service.login(dto);

        if (vo == null) {
            return;
        }

        model.addAttribute("userVO", vo);

        if (dto.isUseCookie()) {

            int amount = 60 * 60 * 24 * 7;

            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));

            service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
        }
    }

    @RequestMapping(value = "/shop-ui-register", method = RequestMethod.GET)
    public String registerGET() {

        return "user/shop-ui-register";
    }

    @RequestMapping(value = "/registPost", method = RequestMethod.POST)
    public String registerPOST(@Valid UserVO userVO,
                               RedirectAttributes rttr,
                               BindingResult bindingResult) throws Exception {

        logger.info("~~~ user regist post ........... ~~~");
        logger.info(userVO.toString());

        if (bindingResult.hasErrors()) {
            logger.info("~~~ Binding Result has error! ~~~");
            List<ObjectError> errors = bindingResult.getAllErrors();

            for (ObjectError error:errors) {
                logger.info("~~~ error : {}, {}", error.getCode(), error.getDefaultMessage() + " ~~~");
            }

            return "user/shop-ui-register";
        }

        service.regist(userVO);
        rttr.addFlashAttribute("msg", "SUCCESS");

//        return "redirect:/home";
        return "redirect:/home";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public void logout(HttpServletRequest request,
                       HttpServletResponse response,
                       HttpSession session) throws Exception {

        logger.info("~~~ logout.................................1 ~~~");

        Object obj = session.getAttribute("login");

        if (obj != null) {

            UserVO vo = (UserVO) obj;

            logger.info("~~~ logout.................................2 ~~~");

            session.removeAttribute("login");
            session.invalidate();

            logger.info("~~~ logout.................................3 ~~~");

            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

            if (loginCookie != null) {

                logger.info("~~~ logout.................................4 ~~~");

                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                service.keepLogin(vo.getUid(), session.getId(), new Date());
            }
        }
//        return "home";
    }
}
