package egovframework.example.sample.service;

import java.util.List;

public interface CmsService {

   public String insertCms(CmsVO vo) throws Exception; 
   public List<?> selectCmsList(SampleDefaultVO vo) throws Exception;
   public int deleteCms(String cms_no) throws Exception;
   public CmsVO selectCmsDetail(CmsVO vo) throws Exception;
   public int updateCms(CmsVO vo) throws Exception;


}