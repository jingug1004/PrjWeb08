package org.zerock.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * The type Sample controller 4. 첫번째 테스트 1234
 */
@Controller
public class SampleController4 {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(SampleController4.class);

	/**
	 * Do e string. 두번째 테스트 1234
	 * 세번째 테스트 1234
	 * @param rttr the rttr 네번째 1234
	 * @return the string 다섯번째 1234
	 */
	@RequestMapping("/doE")
	public String doE(RedirectAttributes rttr){
		logger.info("~~~ doE called but redirect to /doF............. ~~~");
		
		rttr.addFlashAttribute("msg", "This is the Message!! with redirected");
		return "redirect:/doF";
	}

	/**
	 * Do f. 여섯번째 1234
	 * 일곱번째 1234
	 * @param msg the msg 여덟번째 1234
	 */
	@RequestMapping("/doF")
	public void doF(String msg){
		
		logger.info("~~~ doF called..............." + msg + " ~~~");
	}
}


