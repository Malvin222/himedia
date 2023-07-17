package egov.mywork1.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.BoardService;
import egov.mywork1.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDAO") //다른클래스를 사용하기 위한 작업
	BoardDAO boardDAO;
	
	
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		
		return boardDAO.insertBoard(vo);
	}

}
