package egov.mywork1.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import egov.mywork1.service.BoardService;
import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;

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
		// 암호체크 (6~12)
		String pass = vo.getPass();
		String str = "";
	
		if( pass.length() < 6 || pass.length() > 12 ) {
			str = "len_over";
		} else {
			// insert -> 성공:null, 실패:x
			String result = boardService.insertBoard(vo);
			str = (result==null)?"true":"false";
		}
		return str;
	}
	
	@RequestMapping("/boardList.do")
	public String selectBoardList(DefaultVO vo, ModelMap model) 
											throws Exception {
		// 화면에 출력할 개수
		int pageUnit = vo.getPageUnit();
		
		// 현재 페이지 번호
		int pageIndex = vo.getPageIndex();
		
		// firstIndex 값 계산 ;;  1->1 ; 2->11 ; 3->21
		int firstIndex = (pageIndex-1)*pageUnit + 1;
		
		// lastIndex 값 계산
		int lastIndex = pageIndex*pageUnit;
		
		vo.setFirstIndex(firstIndex);
		vo.setLastIndex(lastIndex);
		
		int total = boardService.selectBoardTotal(vo);
		
		// 화면출력 시작번호
		int recordCountPerPage = total - ((pageIndex-1)*pageUnit);
		vo.setRecordCountPerPage(recordCountPerPage);
		
		// 12/10 ->  ceil(1.2) -> 2
		int lastPage = (int) Math.ceil((double)total/pageUnit);
		vo.setLastPage(lastPage);

		List<?> list = boardService.selectBoardList(vo);
	
		model.addAttribute("defaultVO", vo);
		model.addAttribute("total", total);
		model.addAttribute("resultList", list);
		
		return "board/boardList";
	}
	
	@RequestMapping("/noticeList.do")
	public String selectNoticeList(DefaultVO vo, ModelMap model) throws Exception {
		return "board/noticeList";
	}

	public String selectBoardList22(DefaultVO vo, ModelMap model)  
					                               throws Exception {

		int total = boardService.selectBoardTotal(vo);
		List list = boardService.selectBoardList(vo);
		List list2 = new ArrayList();

		Map map = new HashMap();

		for(int i=0; i<list.size(); i++) {
			map = (Map) list.get(i);
			Object h1 = map.get("hits");
			int h2 = Integer.parseInt(h1.toString())+100;
			map.put("hits", h2);
			list2.add(map);
		}
		
		model.addAttribute("defaultVO", vo);
		model.addAttribute("total", total);
		model.addAttribute("resultList", list2);
		
		return "board/boardList";
	}
	
	/*
	 *  게시판 상세보기
	 */
	@RequestMapping("/boardDetail.do")
	public String selectBoardDetail( String unq
									,ModelMap model) throws Exception {
		// 조회수 증가
		boardService.updateBoardHits(unq);
		
		// 상세보기  
		BoardVO vo = boardService.selectBoardDetail(unq);
		model.addAttribute("vo", vo);
		
		return "board/boardDetail";
	}
	
	/*
	 *  게시판 수정화면
	 */
	@RequestMapping("/boardModify.do")
	public String selectBoardModify(String unq, ModelMap model) throws Exception {
		
		// 수정화면 상세보기  
		BoardVO vo = boardService.selectBoardDetail(unq);
		model.addAttribute("vo", vo);
		
		return "board/boardModify";
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateBoard(BoardVO vo) throws Exception {
		
		int result = boardService.updateBoard(vo);
		// 0 , 1
		String str = "";
		if(result == 0) str = "fail";
		else if(result == 1) str = "ok";
		
		return str;
	}
	
	@RequestMapping("/boardPass.do")
	public String boardPass(BoardVO vo, ModelMap model) {
		
		model.addAttribute("vo",vo);
		return "board/boardPass";
	}
	
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteBoard(BoardVO vo) throws Exception {
		
		int result = boardService.deleteBoard(vo);
		String str = "";
		if(result == 1) str = "ok";
		else str = "fail";
		
		return str;
	}
	
}
	