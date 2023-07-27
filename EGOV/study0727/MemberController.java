package egov.mywork1.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
   
   @RequestMapping("/loginWrite.do")
   public String loginWrite() {
	   return "member/loginWrite";
   }

   @RequestMapping("/mbrJoinWrite.do")
   public String mbrJoinWrite() {
      return "member/mbrJoinWrite";
   }
   
   @RequestMapping("/mbrJoinSave.do")
   @ResponseBody
   public String insertMember(MemberVO vo) throws Exception {      
      
      String str  = "3";
      int result = memberService.selectMemberUserId(vo.getUserid()); 
      if (result == 1 ) {
         str = "2";        // 아이디 중복
         } else {
         result = memberService.selectMemberNickname(vo.getNickname());
         if(result == 1) {
            str = "4";    // 닉네임 중복
         } else {
         memberService.insertMember(vo);
         str = "1";        //  저장 성공
         }
      }   
      return str;
   }
   
   @RequestMapping("/mbrUserIdCheck.do")
   @ResponseBody
   public String selectMemberUserId(String userid) throws Exception {
      System.out.println("controller"+userid);
      String msg = "3";
      int result = 0;
      String pattern = "[a-zA-Z]{1}[0-9a-zA-Z_]{2,19}";
      boolean pattern_chk = userid.matches(pattern);
      if(pattern_chk == true) {
         result = memberService.selectMemberUserId(userid);
         if(result == 0) { 
            msg = "1";    // 사용가능
         } else { 
            msg = "2";   // 사용불가 ( 중복 )
         }
      }
      return msg;
   }
   
   @RequestMapping("/logout.do")
   @ResponseBody
   public String logout(HttpSession session) {
	   session.removeAttribute("SessionUserID");
	   return "1";
   }
   @RequestMapping("/loginSession.do")
   @ResponseBody
   public String loginSession(MemberVO vo,HttpSession session) throws Exception{
	   
	   String str ="";
	   String name =memberService.selectMemberLogin(vo);
	   	if( name  == null) {
	   		str = null;
	   	} else {
	   		session.setAttribute("SessionUserID", vo.getUserid());
	   		str = name;
	   	}
	   	System.out.println("str::::::::::::"+str);
	   	return str;
   }
   
}