package egov.mywork1.service;

public interface MemberService {
	String insertMember (MemberVO vo) throws Exception;

	int selectMemberUserId(String userid) throws Exception;
	int selectMemberNickname(String nickname) throws Exception;

	String selectMemberLogin(MemberVO vo) throws Exception;

	MemberVO selectmemberDetail(String userid) throws Exception;

	int updateMember(MemberVO vo) throws Exception;
	
	int selectMemberNicknamech(MemberVO vo )throws Exception;
	
	String selectPreventName(int no) throws Exception;
	
	
}
