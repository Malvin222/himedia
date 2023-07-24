package egov.mywork1.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.NoticeVO;

@Repository("adminDAO")
public class AdminDAO extends EgovAbstractDAO {

	public String insertNotice(NoticeVO vo) {

		return (String) insert("adminDAO.insertNotice",vo);
	}

	public List<?> selectAdminNoticeList(DefaultVO vo) {
		return list("adminDAO.selectAdminNoticeList",vo);
	}

	public int selectNoticeTotal(DefaultVO vo) {
		return (int) select ("adminDAO.selectNoticeTotal",vo);
	}

	public NoticeVO selectNoticeDetail(String unq) {
		return (NoticeVO) select ("adminDAO.selectNoticeDetail",unq);
	}
	
}
