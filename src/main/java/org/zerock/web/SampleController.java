package org.zerock.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * What :
 * Why :
 * How :
 */

/**
 * The type Sample controller.
 */
@Controller
public class SampleController {

	private static final Logger logger = 
			LoggerFactory.getLogger(SampleController.class);

	/**
	 * Do a.
	 */
	@RequestMapping("doA")
	public void doA(){
		
		logger.info("lll~~~ doA called.................... lll~~~");
		
	}

	/**
	 * Do b.
	 */
	@RequestMapping("doB")
	public void doB(){
		
		logger.info("lll~~~ doB called.................... lll~~~");
		
	}
	
}


