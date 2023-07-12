package egovframework.example.sample.service.impl;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;

@Repository("DeptDAO")
public class DeptDAO extends EgovAbstractDAO {

	public String insertDept(DeptVO vo) {

		return (String) insert("DeptDAO.inserDept",vo);
	}

}
