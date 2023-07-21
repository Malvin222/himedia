package egov.mywork1.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.AdminService;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.NoticeVO;

@Controller
public class MainController {
	
	@Resource(name="adminService")
	AdminService adminService;
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/main.do")
	public String main() {
		return "main/main";
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

	
}
