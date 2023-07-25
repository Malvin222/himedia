package egov.mywork1.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/mbrConditions.do")
	public String mbrConditions() {
		return "member/mbrConditions";
	}
}
