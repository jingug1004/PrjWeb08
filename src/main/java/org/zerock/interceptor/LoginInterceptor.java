package org.zerock.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * What : HttpSession을 이용하는 LoginInterceptor.class
 * Why : UserController에서 HttpSession과 관련된 아무런 작업도 처리된 적이 없기 때문에, HttpSession에 관련된 모든 설정은 고스란히 인터셉터에서 처리 / '/loginPost'로 접근하도록 설정하는 것을 목적으로 작성
 * How : postHandle()을 이용해서 HttpSession에 UserVO 타입의 객체를 보관. 이를 수정해서 중간에 쿠키를 생성하고 HttpServletResponse에 같이 담아서 전송
 * UserController ("userVO") -> LoginInterceptor
 */


/**
 * The type Login interceptor. servlet-context.xml에 연결되어 있음 beans:bean id="loginInterceptor" class="org.zerock.interceptor.LoginInterceptor"/beans:bean
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

    /**
     * The constant LOGIN.
     */
    public static final String LOGIN = "login";
    /**
     * The constant logger. constant 1.[주로 명사 앞에 씀] 끊임없는; 거듭되는 2.변함없는 3.(전문 용어) 정수, 항수
     */
    public static final Logger logger =
            LoggerFactory.getLogger(LoginInterceptor.class);

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object handler,
                           ModelAndView modelAndView) throws Exception {

        HttpSession session = request.getSession();

        ModelMap modelMap = modelAndView.getModelMap();
        Object userVO = modelMap.get("userVO");

        if (userVO != null) {

            logger.info("lll~~~ new login success............ lll~~~");
            session.setAttribute(LOGIN, userVO);

            if (request.getParameter("useCookie") != null) {

                logger.info("lll~~~ remember me....................... lll~~~");
                Cookie loginCookie = new Cookie("loginCookie", session.getId());
                loginCookie.setPath("/");
                loginCookie.setMaxAge(60 * 60 * 24 * 7);
                response.addCookie(loginCookie);
            }

//            response.sendRedirect("/");

            Object dest = session.getAttribute("dest");

            response.sendRedirect(dest != null ? (String) dest : "/");
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession();

        if (session.getAttribute(LOGIN) != null) {
            logger.info("lll~~~ clear login data before.......... lll~~~");
            session.removeAttribute(LOGIN);
        }

        return true;
    }

}
