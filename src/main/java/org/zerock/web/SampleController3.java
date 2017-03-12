package org.zerock.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.ProductVO;

/**
 * The type Sample controller 3. 첫번째 테스트 123 수정
 */
@Controller
public class SampleController3 {

	private static final Logger logger = 
			LoggerFactory.getLogger(SampleController3.class);

	/**
	 * Do d string. 두번째 테스트 123 수정
	 * 세번째 테스트 123 수정
	 * dfgx fgb fc 수정
	 *
	 * @param model the model 네번째 테스트 123zsfd bf bsf 수정
	 * @return the string 다섯번째 테스트 123 수정
	 */
	@RequestMapping("/doD")
	public String doD(Model model){
		
		//make sample data
		ProductVO product = new ProductVO("Sample Product", 10000);
		
		logger.info("~~~ doD ~~~");
	
		model.addAttribute(product);
		
		return "productDetail";
	}
}


