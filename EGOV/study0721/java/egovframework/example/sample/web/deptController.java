package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;
import egovframework.example.sample.service.EgovSampleService;

@Controller
public class deptController {
	
	@Resource(name = "DeptService")
	private DeptService DeptService;
	
	@RequestMapping("/deptWrite.do")
	public String deptWrite() {
		return "dept/deptWrite";
	}
	
	@RequestMapping("/deptWriteSave.do")
	public String insertDept(DeptVO vo) throws Exception {
		
		String result = DeptService.insertDept(vo);
		if (result == null) {
			System.out.println("저장완료");
		}else {
			System.out.println("저장실패");
		}
		return "dept/deptList";
		//return "redirect:/deptWrite";
	}
	
	@RequestMapping("/deptList.do")
	public String selectDeptList(DeptVO vo, ModelMap model) throws Exception{
		
		int total = DeptService.selectDeptTotal(vo);
		List<?> list = DeptService.selectDeptList(vo);
		
		model.addAttribute("resultList",list);
		model.addAttribute("total",total);
		
		return "dept/deptList";
	}
	
	@RequestMapping("/deptModify.do")
	public String selectDeptDetail(String deptno, ModelMap model) throws Exception{
		DeptVO vo = DeptService.selectDeptDetail(deptno);
		model.addAttribute("DeptVO",vo);
		return "dept/deptModify";
	}
	
	@RequestMapping("/deptModifySave.do")
	public String updateDept(DeptVO vo) throws Exception{
		int result = DeptService.updateDept(vo);
		return "redirect:/deptList.do";
	}
	
	@RequestMapping("/deptDelete.do")
	public String deleteDept(DeptVO vo) throws Exception{
		int result = DeptService.deleteDept(vo);
		System.out.println("삭제완료");
		return "redirect:/deptList.do";
	}
}
