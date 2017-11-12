package org.zerock.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.SampleProductVO;

@Controller
public class SampleController5 {

	@RequestMapping("/doJSON")
	public @ResponseBody
    SampleProductVO doJSON(){
		
		SampleProductVO vo = new SampleProductVO("샘플상품",30000);
		
		return vo;
		
	}
}
