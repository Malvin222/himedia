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
}
