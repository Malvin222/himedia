package egov.mywork1.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egov.mywork1.service.AdminService;
import egov.mywork1.service.DefaultVO;
import egov.mywork1.service.MemberVO;
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

	@Override
	public int deleteNotice(String unq) throws Exception {
		return adminDAO.deleteNotice(unq);
	}

	@Override
	public int updateNotice(DefaultVO vo) throws Exception {
		return adminDAO.updateNotice(vo);
	}

	@Override
	public NoticeVO selectNoticeModify(String unq) throws Exception {
		return adminDAO.selectNoticeModify(unq);
	}

	@Override
	public List<?> selectMemberList(DefaultVO vo) throws Exception {
		return adminDAO.selectMemberList(vo);
	}

	@Override
	public int selectMemberTotal(DefaultVO vo) throws Exception {
		return adminDAO.selectMemberTotal(vo);
	}

	@Override
	public MemberVO selectMemberDetail(String userid) throws Exception {
		return adminDAO.selectMemberDetail(userid);
	}

	@Override
	public int updateMemberSave(MemberVO vo) throws Exception {
		return adminDAO.updateMemberSave(vo);
	}

	@Override
	public int deleteMemberUser(String userid) throws Exception {
		return adminDAO.deleteMemberUser(userid);
	}

	@Override
	public String insertMenu(String menuName) throws Exception {
		return adminDAO.insertMenu(menuName);
	}

	@Override
	public List<?> selectMenuList() throws Exception {
		return adminDAO.selectMenuList();
	}

}
