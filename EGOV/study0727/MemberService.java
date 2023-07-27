package egov.mywork1.service;

public interface MemberService {
	String insertMember (MemberVO vo) throws Exception;

	int selectMemberUserId(String userid) throws Exception;
	int selectMemberNickname(String nickname) throws Exception;

	String selectMemberLogin(MemberVO vo) throws Exception;
}
