package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.NoticeVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {

	public String insertBoard(BoardVO vo) {
		return (String) insert("boardDAO.insertBoard",vo);
	}
	public List<?> selectBoardList(DefaultVO vo) {
		return list("boardDAO.selectBoardList",vo);
	}
	public int selectBoardTotal(DefaultVO vo) {
		return (int) select("boardDAO.selectBoardTotal",vo);
	}
	public BoardVO selectBoardDetail(String unq) {
		return (BoardVO) select("boardDAO.selectBoardDetail",unq);
	}
	public int updateBoardHits(String unq) {
		return update("boardDAO.updateBoardHits",unq);
	}
	public int updateBoard(BoardVO vo) {
		return update("boardDAO.updateBoard",vo);
	}
	public int deleteBoard(BoardVO vo) {
		return delete("boardDAO.deleteBoard",vo);
	}
	public List<?> selectNoticeList(DefaultVO vo) {
		return list("boardDAO.selectNoticeList",vo);
	}
	public int selectNoticeTotal(DefaultVO vo) {
		return (int) select("boardDAO.selectNoticeTotal",vo);
	}
	public NoticeVO selectNoticeDetail(String unq) {
		return (NoticeVO) select("boardDAO.selectNoticeDetail",unq);
	}
	public int updateNoticeHits(String unq) {
		return update("boardDAO.updateNoitceHits",unq);
	}

	
}
