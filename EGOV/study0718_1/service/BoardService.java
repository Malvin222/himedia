package egov.mywork1.service;

import java.util.List;

public interface BoardService {
	
	String insertBoard(BoardVO vo) throws Exception;
	List<?> selectBoardList(DefaultVO vo) throws Exception;
	int selectBoardTotal(DefaultVO vo) throws Exception;
}