package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CmsController {

	@RequestMapping("/cmsWrite.do")
	public String cmsWrite() {
	
		return "cms/cmsWrite";
	}
	
}
