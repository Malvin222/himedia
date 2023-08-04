package egov.mywork1.service;

import java.util.List;

public interface AdminService {
	
	String insertNotice(NoticeVO vo) throws Exception;
	List<?> selectAdminNoticeList(DefaultVO vo) throws Exception;
	int selectNoticeTotal(DefaultVO vo)throws Exception;
	NoticeVO selectNoticeDetail( String unq ) throws Exception;

	int deleteNotice(String unq) throws Exception;
	int updateNotice(DefaultVO vo) throws Exception;
	NoticeVO selectNoticeModify(String unq) throws Exception;
	
	//일반회원목록
	List<?> selectMemberList(DefaultVO vo) throws Exception;
	//일반회원 멤버 토탈
	int selectMemberTotal(DefaultVO vo) throws Exception;
	//일반회원 상세
	MemberVO selectMemberDetail(String userid) throws Exception;
	//일반회원 수정 저장
	int updateMemberSave(MemberVO vo) throws Exception;
	//일반회원 삭제
	int deleteMemberUser(String userid) throws Exception;
	//메뉴등록
	String insertMenu(String menuName) throws Exception;
	//메뉴 리스트
	List<?> selectMenuList() throws Exception;
}
