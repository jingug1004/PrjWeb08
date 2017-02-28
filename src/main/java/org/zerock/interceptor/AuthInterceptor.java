package org.zerock.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by wtime on 2017-02-27. 오후 3:10
 * org.zerock.interceptor / Web03
 * It's now or never!
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    public static final Logger logger =
            LoggerFactory.getLogger(AuthInterceptor.class);

    @Inject
    private UserService service;

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession();

        if (session.getAttribute("login") == null) {

            logger.info("~~~ current user is not logined ~~~");

            saveDest(request);

            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

            if(loginCookie != null) {

                UserVO userVO = service.checkLoginBefore(loginCookie.getValue());

                logger.info("~~~ USERVO : " + userVO + " ~~~");

                if(userVO != null) {

                    session.setAttribute("login", userVO);
                    return true;
                }
            }
            response.sendRedirect("/user/login");
            return false;
        }
        return true;
    }

    public void saveDest(HttpServletRequest req) {

        String uri = req.getRequestURI();

        String query = req.getQueryString();

        if(query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }

        if(req.getMethod().equals("GET")) {

            logger.info("~~~ dest : " + (uri + query) + " ~~~");

            req.getSession().setAttribute("dest", uri + query);
        }
    }
}
