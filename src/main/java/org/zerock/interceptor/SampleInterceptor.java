package org.zerock.interceptor;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * Created by macbookpro on 2017. 2. 26. PM 3:00
 * sp4chap11-Project / org.zerock.interceptor
 * No pain, No gain!
 * What : 'org.zerock.interceptor'패키지 안에 SampleInterceptor 클래스 작성
 * Why : HandlerInterceptorAdaptor를 상속해서 사용하는 클래스들을 보관 @org.zerock.interceptor
 * How : @org.zerock.interceptor 여러 로그인시 자기글의 삭제나 글 등록 가능한 권한 부여 가능한 클래스 작성
 */


public class SampleInterceptor extends HandlerInterceptorAdapter{

    @Override
    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response,
                           Object handler,
                           ModelAndView modelAndView) throws Exception {

        System.out.println("lll~~~ post handle........... lll~~~");

        Object result = modelAndView.getModel().get("result");

        if(result != null) {
            request.getSession().setAttribute("result", result);
            response.sendRedirect("/doA");
        }
    }


    /**
     * What : preHandle()의 경우 리턴 타입이 boolean으로 설계
     * Why : boolean을 이용해서 다음 Interceptor나 대상 컨트롤러를 호출하도록 할 것인지를 결정
     * How : 데이터 타입이 boolean
     */
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        System.out.println("lll~~~ pre handle............... lll~~~");

        HandlerMethod method = (HandlerMethod) handler;
        Method methodObj = method.getMethod();

        System.out.println("lll~~~ Bean: " + method.getBean() + " lll~~~");
        System.out.println("lll~~~ Method: " + methodObj + " lll~~~");

        return true;

    }
}
