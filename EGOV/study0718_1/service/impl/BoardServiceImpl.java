package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.BoardService;
import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDAO") //다른클래스를 사용하기 위한 작업
	BoardDAO boardDAO;
	
	
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		
		return boardDAO.insertBoard(vo);
	}


	@Override
	public List<?> selectBoardList(DefaultVO vo) throws Exception {

		return boardDAO.selectBoardList(vo);
	}


	@Override
	public int selectBoardTotal(DefaultVO vo) throws Exception {
		return boardDAO.selectBoardTotal(vo);
	}

}