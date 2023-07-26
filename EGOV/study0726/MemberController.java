package egov.mywork1.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.MemberService;
import egov.mywork1.service.MemberVO;

@Controller
public class MemberController {
	@Resource(name="memberService")
	MemberService memberService;
	
	@RequestMapping("/mbrConditions.do")
	public String mbrConditions() {
		return "member/mbrConditions";
	}
	
	@RequestMapping("/mbrJoinWrite.do")
	public String mbrJoinWrite() {
		return "member/mbrJoinWrite";
	}
		
	@RequestMapping("/mbrJoinSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception{
		String str = "";
	
			// insert -> 성공:null, 실패:x
			String result = memberService.insertMember(vo);
			str = (result==null)?"ok":"false";
		return str;
	}
	@RequestMapping("/mbrUserIdCheck.do")
	@ResponseBody
	public String selectMemberUserId(String userid) throws Exception{
		String msg = "2";
		int result = memberService.selectMemberUserId(userid);
		if(result == 0) msg ="1";
		return msg;
	}
	
}
