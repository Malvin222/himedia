package egov.mywork1.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egov.mywork1.service.MemberVO;

@Repository("memberDAO")
public class MemberDAO extends EgovAbstractDAO {

	public String insertMember(MemberVO vo) {
		return (String) insert("memberDAO.insertMember",vo);
	}

	public int selectMemberUserId(String userid) {
		System.out.println("dao"+userid);
		return (int) select("memberDAO.selectMemberUserId",userid);
	}

	public int selectMemberNickname(String nickname) {
		return(int) select("memberDAO.selectMemberNickname",nickname);
	}

	public String selectMemberLogin(MemberVO vo) {
		return (String) select("memberDAO.selectMemberLogin",vo);
	}

	public MemberVO selectMemberDetail(String userid) {
		return (MemberVO) select("memberDAO.selectMemberDetail",userid);
	}

	public int updateMember(MemberVO vo) {
		return update("memberDAO.updateMember",vo);
	}

	public int selectMemberNicknamech(MemberVO vo) {
		return (int) select("memberDAO.selectMemberNicknamech",vo);
	}

	public String selectPreventName(int no) {
		return (String) select("memberDAO.selectPreventName",no);
	}

	
}
