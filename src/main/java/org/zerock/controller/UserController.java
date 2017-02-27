package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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

    @RequestMapping(value = "/shop-ui-login")
    public void login() {

    }

    @RequestMapping(value = "/login_success")
    public void login_success() {

    }

    @RequestMapping(value = "/login_duplicate")
    public void login_duplicate() {

    }

    @RequestMapping(value = "/logout")
    public void logout() {

    }

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

    }

    @RequestMapping(value = "/shop-ui-register")
    public String register () {

        return "user/shop-ui-register";
    }

//    @RequestMapping(value = "/shop-ui-register", method = RequestMethod.POST)
//    public String register () {
//
//        return "user/shop-ui-register";
//    }

}
