package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * Simply selects the home view to render by returning its name.
     *
     * @param locale the locale
     * @param model  the model
     * @return the string
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("~~~ Welcome home! The client locale is {}. ~~~", locale);

        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

        String formattedDate = dateFormat.format(date);

        model.addAttribute("serverTime", formattedDate);

        return "home";
    }

    /**
     * Ajax test.
     */
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public void ajaxTest() {


    }

    /**
     * Do a string. servlet-context.xml에 설정되어 있는 <interceptors></interceptors>의 경로 호출에 대한 테스트 메소드
     * 밑의 "/doB" 메소드와 동일
     *
     * @param locale the locale
     * @param model  the model
     * @return the string
     */
    @RequestMapping(value = "/doA", method = RequestMethod.GET)
    public String doA(Locale locale, Model model) {

        System.out.println("~~~ doA..................... ~~~");

        return "home";
    }

    /**
     * Do b string. "/doB"의 경우 Model에 'result'라는 이름으로 데이터 추가
     *
     * @param locale the locale
     * @param model  the model
     * @return the string
     */
    @RequestMapping(value = "/doB", method = RequestMethod.GET)
    public String doB(Locale locale, Model model) {

        System.out.println("~~~ doB..................... ~~~");

        model.addAttribute("result", "DOB RESULT");

        return "home";
    }

    /**
     * Docu string. UNIFY 프로젝트를 볼 수 있는 메소드
     *
     * @return the string /docu 폴더 안에 다큐멘트 작성 해놓음
     */
    @RequestMapping(value = "/docuunify", method = RequestMethod.GET)
    public String docu() {
        return "docu/docuunify";
    }

    /**
     * Doc string.
     *
     * @return the string
     */
    @RequestMapping(value = "/javadoc", method = RequestMethod.GET)
    public String doc() {
        return "redirect:/javadoc/index.html";
    }


}
