package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeptVO;

@Repository("DeptDAO")
public class DeptDAO extends EgovAbstractDAO {

	public String insertDept(DeptVO vo) {

		return (String) insert("DeptDAO.inserDept",vo);
	}
	
	public List<?> selectDeptList(DeptVO vo){
		return list("DeptDAO.selectDeptList",vo);
	}

	public int selectDeptTotal(DeptVO vo) {
		return  (int) select("DeptDAO.selectDeptTotal",vo);
	}

	public int deleteDept(DeptVO vo) {
		return (int) delete("DeptDAO.deleteDept", vo);
	}
	public DeptVO selectDeptDetail (String deptno) {
		return (DeptVO) select("DeptDAO.selectDeptDetail",deptno);
	}

	public int updateDept(DeptVO vo) {
		return update("DeptDAO.updateDept",vo);
	}
}
