package egov.mywork1.service;

import java.util.List;

public interface BoardService {
	String insertBoard(BoardVO vo) throws Exception;
	List<?> selectBoardList(DefaultVO vo) throws Exception;
	int selectBoardTotal(DefaultVO vo) throws Exception;
	BoardVO selectBoardDetail(String unq) throws Exception; 
	int updateBoardHits(String unq) throws Exception;
    int updateBoard(BoardVO vo) throws Exception;
    int deleteBoard(BoardVO vo) throws Exception;
    
	List<?> selectNoticeList(DefaultVO vo) throws Exception;
	int selectNoticeTotal(DefaultVO vo) throws Exception;
}
