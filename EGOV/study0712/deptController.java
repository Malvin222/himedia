package egovframework.example.sample.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
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
		return "dept/deptWrite";
	}
}
