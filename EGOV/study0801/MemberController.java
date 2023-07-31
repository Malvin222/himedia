package egov.mywork1.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
   public String mbrJoinWrite(ModelMap model) throws Exception{
	   
	   //0~1
	   int n = (int) Math.ceil(Math.random()*10);
	   String filename = memberService.selectPreventName(n);
	   filename = filename.replace(".jpg", "");
	   
	   model.addAttribute("n",n);
	   model.addAttribute("filename",filename);
	   System.out.println("n::::"+n);
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
   
   @RequestMapping("/mbrModify.do")
   public String selectMemberDetail(HttpSession session, ModelMap model) throws Exception{
	   
	   String url = "member/Mofidy";
	   String userid = (String) session.getAttribute("SessionUserID");
	   if(userid ==null) {
		   url = "redirect:/mbrJoinWrtie.do";
	   }
	   
	   
	   MemberVO vo = memberService.selectmemberDetail(userid);
	   System.out.println("userid:::::::"+userid);
	   model.addAttribute("vo",vo);
	   
	   return "member/mbrModify";
   }
   @RequestMapping("/mbrModifySave.do")
   @ResponseBody
   public String updateMember(MemberVO vo,HttpSession session) throws Exception {
	   
	   String str="";
	   String userid = (String) session.getAttribute("SessionUserID");
	   if (userid ==null) {
		   str ="4";
	   }else {
		   //(1) DB의 별칭과 VO의 별칭의 일치여부
		   
		   //(2) 내용 불일치라면 타 사용자와의 중복여부 체크
		   //(3) 중복인경우 (화면으로 return) / 중복이 아닌경우 (저장서비스 실행)
		   if(vo.getNickname_change().equals("Y")) {
			   int cnt = memberService.selectMemberNicknamech(vo);
			   if(cnt ==1) {
				   str="3";
			   }
		   }
		   if( !str.equals("3") ) {
			   
		    //result = 1 ; (ok) result = 0;
		    int result = memberService.updateMember(vo);
	   		if(result == 1) {str = "1";}
	   		else if(result ==0 ) {str = "2";}  
	   		System.out.println("result::"+result);
		   }
	   }
	   System.out.println("str::"+str);
	   return str;
   }
   @RequestMapping("preventImg.do")
   @ResponseBody
   public String selectPreventImg(String no)throws Exception{
	   
	   int no1 = Integer.parseInt(no)+1;
	   if(no1 > 10 ) no1 = 1;
	   String filename = memberService.selectPreventName(no1);
	   filename = filename.replace(".jpg", "");
	   
	   return filename+","+no1;
   }
}