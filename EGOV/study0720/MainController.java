package egov.mywork1.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egov.mywork1.service.DefaultVO;

@Controller
public class MainController {
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
		
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
	}
	@RequestMapping("/adminNoticeList.do")
	public String selectNoticeList() {
		return "admin/board/adminNoticeList";
	}

}
