package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egov.mywork1.service.BoardService;
import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.NoticeVO;

@Service("boardService")
public class BoardServiceImpl   extends EgovAbstractServiceImpl
								implements BoardService {

	@Resource(name="boardDAO")
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

	@Override
	public BoardVO selectBoardDetail(String unq) throws Exception {
		return boardDAO.selectBoardDetail(unq);
	}

	@Override
	public int updateBoardHits(String unq) throws Exception {
		return boardDAO.updateBoardHits(unq);
	}

	@Override
	public int updateBoard(BoardVO vo) throws Exception {
		return boardDAO.updateBoard(vo);
	}

	@Override
	public int deleteBoard(BoardVO vo) throws Exception {
		return boardDAO.deleteBoard(vo);
	}

	@Override
	public List<?> selectNoticeList(DefaultVO vo) throws Exception {
		return boardDAO.selectNoticeList(vo);
	}

	@Override
	public int selectNoticeTotal(DefaultVO vo) throws Exception {
		return boardDAO.selectNoticeTotal(vo);
	}

	@Override
	public NoticeVO selectNoticeDetail(String unq) throws Exception {
		return boardDAO.selectNoticeDetail(unq);
	}

	@Override
	public int updateNoticeHits(String unq) throws Exception {
		return boardDAO.updateNoticeHits(unq);
	}

}


