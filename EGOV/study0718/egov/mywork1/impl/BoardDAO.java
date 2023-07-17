package egov.mywork1.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.BoardVO;

@Repository("boardDAO")
public class BoardDAO extends EgovAbstractDAO {
		
	public String insertBoard(BoardVO vo) {
		
		return (String) insert("boardDAO.insertBoard",vo);
	}

}
