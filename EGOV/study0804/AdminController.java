package egov.mywork1.web;

import java.io.File;
import java.util.Map.Entry;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egov.mywork1.service.AdminService;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MemberVO;
import egov.mywork1.service.NoticeVO;

@Controller
public class AdminController {
	
	@Resource(name="adminService")
	AdminService adminService;
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	@RequestMapping("/adminMemberList.do")
	public String selectMemberList(DefaultVO vo, ModelMap model) throws Exception{
		
		
		//출력페이지번호
		int pageIndex = vo.getPageIndex();
		
		//화면출력 개수
		int pageUnit = vo.getPageUnit();
		
		
		// firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		
		// lastIndex 값 계산
		int lastIndex = pageIndex*pageUnit;
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = adminService.selectMemberTotal(vo);
		
		//출력화면 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		List<?> list = adminService.selectMemberList(vo);
		model.addAttribute("list",list);
		model.addAttribute("vo",vo);
		model.addAttribute("total",total);
		return "admin/member/adminMemberList";
	}
	
	
	
	@RequestMapping("/adminNoticeList.do")
	public String selectAdminNoticeList(DefaultVO vo,ModelMap model ) throws Exception {
		
		//출력페이지번호
		int pageIndex = vo.getPageIndex();
		
		//화면출력 개수
		int pageUnit = vo.getPageUnit();
		
		
		// firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		
		// lastIndex 값 계산
		int lastIndex = pageIndex*pageUnit;
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = adminService.selectNoticeTotal(vo);
		
		//출력화면 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);
		
		List<?> list = adminService.selectAdminNoticeList(vo);
		
		model.addAttribute("resultList",list);
		model.addAttribute("vo",vo);
		model.addAttribute("total",total);
		
		return "admin/board/adminNoticeList";
	}
	
	@RequestMapping("/adminNoticeWrite.do")
	public String adminNoticeWrite() {
		return "admin/board/adminNoticeWrite";
	}
	
	@RequestMapping("/adminNoticeSave.do")
	@ResponseBody	//화면 글자출력
	public String insertNotice(NoticeVO vo) throws Exception {
		
		String emps = vo.getEmps();
		if( emps ==null || emps.equals("") ) emps="N";
		vo.setEmps(emps);
		
		String str="";
		String result= adminService.insertNotice(vo);
		if(result == null ) str="ok";
		
		return str;
	
	}
	
	@RequestMapping("/adminMemberModify.do")
	public String selectMemberModify(String userid,ModelMap model) throws Exception {
		
		MemberVO vo = adminService.selectMemberDetail(userid);
		model.addAttribute("vo",vo);
		
		return "admin/member/adminMemberModify";
	}
	
	//회원변경 저장처리
	@RequestMapping("/adminMemberModifySave.do")
	@ResponseBody
	public String updateMemberSave(MemberVO vo ) throws Exception{
		
		String str = "";
		
		String sms = vo.getSms();
		if(sms ==null || sms.equals("") ) sms ="N";
		vo.setSms(sms);
		
		String mail = vo.getMail();
		if(mail ==null || mail.equals("") ) mail ="N";
		vo.setMail(mail);
		
		int cnt = adminService.updateMemberSave(vo);
		if (cnt == 1 ) str = "ok";
		System.out.println("cnt::::::::"+cnt);
		return str;
	}
	
	@RequestMapping("/adminMemberdelete.do")
	@ResponseBody
	public String deleteMemberUser(String userid) throws Exception{
		
		String str ="";
		int cnt =adminService.deleteMemberUser(userid);
		if(cnt ==1) str ="ok";
		return str;
	}
	
	@RequestMapping("/adminNoticeDetail.do")
	public String selectNoticeDetail(String unq,ModelMap model) throws Exception {
		
		NoticeVO vo = adminService.selectNoticeDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\n", "<br>");
		content = content.replace(" ", "&nbsp;");
		vo.setContent(content);
		model.addAttribute("vo",vo);
		
		return "admin/board/adminNoticeDetail";
	}
	
	@RequestMapping("/adminNoticeDelete.do")
	@ResponseBody
	public String deleteNotice(String unq) throws Exception{
		
		int result =adminService.deleteNotice(unq);
		String str = "";
		if(result ==1) str ="ok";
		else str = "fail";
		
		return str;
	}
	
	@RequestMapping("/adminNoticeModify.do")
	public String selectNoticeModify(String unq,ModelMap model) throws Exception {
		
		NoticeVO vo = adminService.selectNoticeDetail(unq);
		
		String content = vo.getContent();
		content = content.replace("\n", "<br>");
		content = content.replace(" ", "&nbsp;");
		vo.setContent(content);
		model.addAttribute("vo",vo);
		
		return "admin/board/adminNoticeModify";
	}
	
	@RequestMapping("/adminNoticeModifySave.do")
	public String updateNotice(DefaultVO vo,ModelMap model) throws Exception{
		
		int result = adminService.updateNotice(vo);
		
		String str = "";
		if(result == 0) str = "fail";
		else if(result == 1) str = "ok";
		
		return str;
		
	}
	/** EgovPropertyService */

	
	@RequestMapping("/gdsWrite.do")
	public String gdsWrite() {
		return "admin/shop/gdsWrite";
	}
	
	
	@RequestMapping("/gdsWriteSave.do")
	@ResponseBody
	public String insertFileboard(MultipartHttpServletRequest multiRequest) 
															throws Exception {
		System.out.println("########## Controller ##########");
		
		
		//String path = "C:\eGovFrameDev-4.0.0-64bit\workspace\mywork1\src\main\webapp\carImage";
		String path = propertiesService.getString("Globals.fileStorePath");
		
		System.out.println("path:::::::::::"+path);
		Map<String,String> map1 = uploadProcess(multiRequest,path);
		
		//vo.setFilename(map1.get("f1"));
		//vo.setFilesize(map1.get("f2"));
		
		//String result = adminService.insertFileboard(vo);
	
		String message = "ok";
		
		//if( result != null ) message = "error"; 
		//map.put("filename", filename);
		//map.put("cnt", Integer.toString(cnt));
		//System.out.println("filename :::: " + filename);

		return message;
	}
	
	public static Map<String,String> uploadProcess( MultipartHttpServletRequest multiRequest , String path ) 
			throws Exception {

		MultipartFile file;
		String save_dir = path;
		String save_file  = "";
		String filenames = "";
		String filesizes = "";
		
		Map<String, String> map = new HashMap<String, String>();
		
		File dirname = new File(save_dir);  // 물리적인 위치로 인식
		if (!dirname.exists()) dirname.mkdirs();
		
		//   업로드 파일 인식 ;;;   files : 파일이름(오리지널,암호화된이름),파일크기,파일종류 
		//   /tmp 디렉토리에 임시시장 ( abc.jpg -> xxxefsdf.sdfdf)
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		// a.jpg  -->  /tmp/asfdasdfsadsadfxx11###.xxdfs
		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if (!"".equals(file.getOriginalFilename())) {
				save_file = save_dir + "/" + file.getOriginalFilename();
				file.transferTo(new File(save_file));
				
				filenames += file.getOriginalFilename() + "／";
				filesizes += file.getSize() + "／";
			}
		}
		
		Map<String,String> map1 = new HashMap<String,String>();
		map1.put("f1",filenames);  //  filenames = "index.jsp／1234.PNG／";
		map1.put("f2",filesizes);  //         137／28647／
		
		return map1;
	}
	
	@RequestMapping("menuAdmin.do")
	public String selectMenuList(ModelMap model) throws Exception{
		
		List<?> list = adminService.selectMenuList();
		model.addAttribute("list",list);
		
		
		return "admin/shop/menuAdmin";
	}
	
	@RequestMapping("menuRegister.do")
	@ResponseBody
	public String insertMenu(String menuName) throws Exception{

		String str = "";
		String result = adminService.insertMenu(menuName);
		
		if (result == null) str = "ok";		
		
		return str;
	}
	
	
}
