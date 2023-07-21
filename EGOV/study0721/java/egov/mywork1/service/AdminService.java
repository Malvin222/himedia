package egov.mywork1.service;

import java.util.List;

public interface AdminService {
	
	String insertNotice(NoticeVO vo) throws Exception;
	List<?> selectAdminNoticeList(DefaultVO vo) throws Exception;
	int selectNoticeTotal(DefaultVO vo)throws Exception;
	
}
