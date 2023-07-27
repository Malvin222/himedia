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

}
