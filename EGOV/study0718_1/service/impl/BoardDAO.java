package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.BoardVO;
import egov.mywork1.service.DefaultVO;

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

}