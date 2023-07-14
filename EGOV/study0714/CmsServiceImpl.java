package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CmsService;
import egovframework.example.sample.service.CmsVO;
import egovframework.example.sample.service.SampleDefaultVO;



@Service("cmsService")
public class CmsServiceImpl extends EgovAbstractServiceImpl implements CmsService {

   
   @Resource(name = "cmsDAO")
   private CmsDAO cmsDAO;
   
   
   @Override
   public String insertCms(CmsVO vo) throws Exception {
      
      
      return cmsDAO.insertCms(vo);
   }


@Override
public List<?> selectCmsList(SampleDefaultVO vo) throws Exception {

	return cmsDAO.selectCmsList(vo);
}


@Override
public int deleteCms(String cms_no) throws Exception {
	
	return cmsDAO.deleteCms(cms_no);
}


@Override
public CmsVO selectCmsDetail(CmsVO vo) throws Exception {
	
	return cmsDAO.selectCmsDetail(vo);
}


@Override
public int updateCms(CmsVO vo) throws Exception {
	
	return cmsDAO.updateCms(vo);
}
}