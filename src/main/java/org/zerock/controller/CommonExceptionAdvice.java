package org.zerock.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;


/**
 * Created by macbookpro on 2017. 2. 6.. PM 8:28
 * What : 예외가 발생하는 상황에 대한 처리를 위한 클래스.
 * Why : 게시물 관련한 Controller의 경우 최소한의 코드를 작성하는 것을 목적으로 했기 때문에 Exception에 대한 처리가 되지 않은 상태이고, 따라서 모든 메소드는 Exception 자체를 던지도록 설계.
 * How : 클래스의 선언을 보면 @ControllerAdvice 애노테이션을 통해서 이 클래스의 객체가 컨트롤러에서 발생하는 Exception을 전문적으로 처리하는 클래스라는 것을 명시.
 * '@ControllerAdvice 클래스의 메소드는 발생한 Exception 객체의 타입만을 파라미터로 사용할 수 있고, 일반 Controller와 같이 Model을 파라미터로 사용하는 것은 지원하지 않기 때문에 직접 ModelAndView 타입을 사용하는 형태로 작성.
 */
@ControllerAdvice
public class CommonExceptionAdvice {

    /**
     * The constant logger.
     */
    public static final Logger logger =
            LoggerFactory.getLogger(CommonExceptionAdvice.class);

    /**
     * Error model and view model and view.
     *
     * @param ex
     * @return ModelAndView는 하나의 객체에 Model 데이터와 View의 처리를 동시에 할 수 있는 객체.
     * 과거 스프링 MVC에서는 ModelAndView 타입을 이용해서 결과 데이터를 만들었지만, 최근의 스프링 MVC는 굳이 그렇게 할 필요는 없고, 지정된 파라미터를 사용하는 경우에 주로 사용.
     */
    @ExceptionHandler(Exception.class)
//    public String common(Exception e) {
//
//        logger.info(e.toString());
//
//        return "error_common";
    public ModelAndView errorModelAndView(Exception ex) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/error_common");
        modelAndView.addObject("exception", ex);

        return modelAndView;
    }

}
