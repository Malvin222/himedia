package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CmsVO;
import egovframework.example.sample.service.SampleDefaultVO;


@Repository("cmsDAO")
public class CmsDAO extends EgovAbstractDAO{

   
   

public String insertCms(CmsVO vo) {
      
      return (String) insert("cmsDAO.insertCms",vo);
   }

 
public List<?> selectCmsList(SampleDefaultVO vo) {

	return list ("cmsDAO.selectCmsList",vo);
}


public int deleteCms(String cms_no) {
	
	return delete ("cmsDAO.deleteCms",cms_no);
}

public CmsVO selectCmsDetail(CmsVO vo) {
	return (CmsVO) select("cmsDAO.selectCmsDetail",vo);
}


public int updateCms(CmsVO vo) {
	
	return update ("cmsDAO.updateCms",vo);
}

}