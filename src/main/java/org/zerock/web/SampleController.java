package org.zerock.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * The type Sample controller. 첫번째 테스트 1
 */
@Controller
public class SampleController {

	private static final Logger logger = 
			LoggerFactory.getLogger(SampleController.class);

	/**
	 * Do a. 두번째 테스트 1
	 */
	@RequestMapping("doA")
	public void doA(){
		
		logger.info("~~~ doA called.................... ~~~");
		
	}

	/**
	 * Do b. 세번째 테스트 1
	 */
	@RequestMapping("doB")
	public void doB(){
		
		logger.info("~~~ doB called.................... ~~~");
		
	}
	
}


