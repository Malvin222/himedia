package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeptService;
import egovframework.example.sample.service.DeptVO;

@Service("DeptService")
public class DeptServiceImpl extends EgovAbstractServiceImpl implements DeptService {

	@Resource(name = "DeptDAO")
	private DeptDAO DeptDAO;
	
	@Override
	public String insertDept(DeptVO vo) throws Exception {
		
		return DeptDAO.insertDept(vo);
	}

}
