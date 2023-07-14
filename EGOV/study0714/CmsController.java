package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.CmsService;
import egovframework.example.sample.service.CmsVO;
import egovframework.example.sample.service.SampleDefaultVO;


@Controller
public class CmsController {

   
   @Resource(name = "cmsService")
   public CmsService cmsService;
   
   @RequestMapping("/cmsWrite.do")
   public String cmsWrite() {
      return "cms/cmsWrite";
   }
   
   
   @RequestMapping("/cmsWriteSave.do")
   public String insertCms(CmsVO vo) throws Exception {
      
      String result = cmsService.insertCms(vo);
      return "redirect:/cmsList.do";
   }
   
   @RequestMapping("/cmsList.do")
   public String selectCmsList(SampleDefaultVO vo, ModelMap model) throws Exception{
	   
	   List<?> list = cmsService.selectCmsList(vo);
	   
	   model.addAttribute("resultList",list);
	   System.out.println("list :::::::::" +list);
	   return "cms/cmsList";
   }
   @RequestMapping("/cmsDelete.do")
   public String deleteCms(String cms_no) throws Exception{
	   
	   int result = cmsService.deleteCms(cms_no);
	
	   return "redirect:/cmsList.do";
   }
   @RequestMapping("/cmsModify.do")
   public String selectCmsDetail(CmsVO vo,ModelMap model) throws Exception{
	   
	   CmsVO cmsVO = cmsService.selectCmsDetail(vo);
	   model.addAttribute("vo",cmsVO);
	   
	   return "cms/cmsModify";
   }
   @RequestMapping("/cmsModifySave.do")
   public String updateCms(CmsVO vo) throws Exception{
	   int result = cmsService.updateCms(vo);
	   return "redirect:/cmsList.do";
   }
  
}