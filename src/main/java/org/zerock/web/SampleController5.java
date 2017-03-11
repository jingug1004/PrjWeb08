package org.zerock.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.ProductVO;

/**
 * The type Sample controller 5.
 */
@Controller
public class SampleController5 {

	/**
	 * Do json product vo.
	 *
	 * @return the product vo
	 */
	@RequestMapping("/doJSON")
	public @ResponseBody ProductVO doJSON(){
		
		ProductVO vo = new ProductVO("샘플상품",30000);
		
		return vo;
		
	}
}
