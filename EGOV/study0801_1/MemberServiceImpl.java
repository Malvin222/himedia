package egov.mywork1.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egov.mywork1.service.MemberService;
import egov.mywork1.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl extends EgovAbstractServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	MemberDAO memberDAO;
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberUserId(String userid) throws Exception {
		System.out.println("service"+userid);
		return memberDAO.selectMemberUserId(userid);
	}

	@Override
	public int selectMemberNickname(String nickname) throws Exception {
		return memberDAO.selectMemberNickname(nickname);
	}

	@Override
	public String selectMemberLogin(MemberVO vo) throws Exception {
		return memberDAO.selectMemberLogin(vo);
	}

	@Override
	public MemberVO selectmemberDetail(String userid) throws Exception {
		return memberDAO.selectMemberDetail(userid);
	}

	@Override
	public int updateMember(MemberVO vo) throws Exception {
		return memberDAO.updateMember(vo);
	}

	@Override
	public int selectMemberNicknamech(MemberVO vo) throws Exception {
		return memberDAO.selectMemberNicknamech(vo);
	}

	@Override
	public String selectPreventName(int no) throws Exception {
		return memberDAO.selectPreventName(no);
	}

	@Override
	public String selectMemberUseridReturn(MemberVO vo) throws Exception {
		return memberDAO.selectMemberUseridReturn(vo);
	}

	@Override
	public int selectMemberExistCount(MemberVO vo) throws Exception{
		return memberDAO.selectMemberExistCount(vo);
	}

	@Override
	public void updateMemberPass(MemberVO vo) throws Exception {
		memberDAO.updateMemberPass(vo);
	}

}
