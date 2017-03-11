package org.zerock.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * The type Sample controller 2. 첫번째 테스트 12
 */
@Controller
public class SampleController2 {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(SampleController2.class);

	/**
	 * Do c string. 두번째 테스트 12
	 *
	 * @param msg the msg 세번째 테스트 12
	 * @return the string 네번째 테스트 12
	 */
	@RequestMapping("doC")
	public String doC( @ModelAttribute("msg") String msg){
		
		logger.info("~~~ doC called.............................. ~~~");
		
		return "result";
		
	}
}


