package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.AdminService;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.NoticeVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource(name="adminDAO")
	AdminDAO adminDAO;
	
	@Override
	public String insertNotice(NoticeVO vo) throws Exception {

		return adminDAO.insertNotice(vo);
	}

	@Override
	public List<?> selectAdminNoticeList(DefaultVO vo) throws Exception {
		return adminDAO.selectAdminNoticeList(vo);
	}

	@Override
	public int selectNoticeTotal(DefaultVO vo) throws Exception {
		return adminDAO.selectNoticeTotal(vo);
	}

	@Override
	public NoticeVO selectNoticeDetail(String unq) throws Exception {
		return adminDAO.selectNoticeDetail(unq);
	}

}
