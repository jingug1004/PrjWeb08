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
 * What : HttpSession을 이용하는 로그인 처리를 위한 AuthInterceptor
 * Why : LoginInterceptor가 로그인한 사용자에 대해서 postHandle()을 이용해서
 *      HttpSession에 보관하는 처리를 담당한다면, 지금부터 작성하는 AuthInterceptor는
 *      특정경로에 접근하는 경우 현재 사용자가 로그인한 상태의 사용자인지를 체크하는 역할을
 *      처리하기 위해서 작성
 * How : preHandle()을 이용하여 현재 사용자가 로그인한 상태인지를 체크하고,
 *      컨트롤러를 호출하게 할 것인지를 결정. 만일 사용자가 로그인하지 않은 상태라면
 *      로그인하는 '/user/login'으로 이동
 * UserController ("userVO") - LoginInterceptor - AuthInterceptor - @Inject UserService userService
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

    /**
     * The constant logger.
     */
    public static final Logger logger =
            LoggerFactory.getLogger(AuthInterceptor.class);

    @Inject
    private UserService userService;

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession();

        if (session.getAttribute("login") == null) {

            logger.info("lll~~~ current user is not logined lll~~~");

            saveDest(request);

            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

            if (loginCookie != null) {

                UserVO userVO = userService.checkLoginBefore(loginCookie.getValue());

                logger.info("lll~~~ USERVO : " + userVO + " lll~~~");

                if (userVO != null) {

                    // login 이라는 이름으로 세션 생성 및 유지
                    session.setAttribute("login", userVO);
                    return true;
                }
            }
            response.sendRedirect("/user/login");
            return false;
        }
        return true;
    }

    /**
     * Save dest. 로그인하면 '/'경로로 이동하는데 사용자가 원하는 URI가 무엇이었는지를 보관했다가, 로그인 성공 후 해당 경로로 이동시켜주는 것
     *
     * @param req saveDest() 메소드를 이용해서 원래 사용자가 원하는 페이지의 정보는 HttpSession에 'dest'라는 이름으로 저장.
     *            GET 방식인 경우에는 URI 정보 뒤의 파라미터들을 함께 보관.
     *            후에 LoginInterceptor는 로그인 성공 후의 response.sendRedirect() 작업에 'dest' 정보를 사용하도록 수정.
     */
    public void saveDest(HttpServletRequest req) {

        String uri = req.getRequestURI();

        String query = req.getQueryString();

        if (query == null || query.equals("null")) {
            query = "";
        } else {
            query = "?" + query;
        }

        if (req.getMethod().equals("GET")) {

            logger.info("lll~~~ dest : " + (uri + query) + " lll~~~");

            req.getSession().setAttribute("dest", uri + query);
        }
    }
}
