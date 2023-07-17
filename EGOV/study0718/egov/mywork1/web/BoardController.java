package egov.mywork1.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.BoardService;
import egov.mywork1.service.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		return "board/boardWrite";
	}
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertBoard(BoardVO vo) throws Exception {
		
		//insert -> 성공:null, 실패:x
		String result = boardService.insertBoard(vo);
		String data = (result==null)?"true":"false";
		//System.out.println("boardController=================");
		return data;
		
	}
	
}