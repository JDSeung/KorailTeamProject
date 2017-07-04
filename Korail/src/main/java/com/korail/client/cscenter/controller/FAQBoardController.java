package com.korail.client.cscenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.korail.client.cscenter.service.FAQService;
import com.korail.client.cscenter.vo.FAQVO;
import com.korail.client.paging.PagingComponent;


@Controller
@RequestMapping(value="faqboard")
public class FAQBoardController {
	
	@Autowired
	private FAQService faqService;
	
	/*faq페이지*/
	@RequestMapping(value = "/")
	public ModelAndView faq(FAQVO faqVO, PagingComponent paging) throws Exception{
		ModelAndView faqView = new ModelAndView();
		faqView.addObject("paging", paging);
		faqView.setViewName("faqboard/faqList");
		return faqView;
	}
	
	/*Ajax통신 페이징 처리*/
	@ResponseBody
	@RequestMapping(value = "/list")
	public Map<String, Object> faqList(FAQVO faqVO, PagingComponent paging) throws Exception{
		Map<String, Object> faqMap = new HashMap<String, Object>();
		List<FAQVO> faqList = faqService.getFAQList(faqVO, paging);
		faqMap.put("faqList", faqList);
		faqMap.put("paging", paging);
		return faqMap;
	}
	
	/*글 상세보기 페이지*/
	@RequestMapping(value = "/faqdetail")
	public String faqdetail(FAQVO faqVO, PagingComponent paging, Model model) throws Exception{
		faqVO = faqService.getFAQ(faqVO);
		model.addAttribute("faqVO", faqVO);
		model.addAttribute("paging", paging);
		return "faqboard/faqDetail";
	}
	/*게시물 검색*/
	@ResponseBody
	@RequestMapping(value = "/searchData")
	public Map<String, Object> searchData(FAQVO faqVO, PagingComponent paging) throws Exception{
		Map<String, Object> faqMap = new HashMap<String, Object>();
		List<FAQVO>  faqList = faqService.getFAQList(faqVO, paging);
		faqMap.put("faqList", faqList);
		faqMap.put("paging", paging);
		return faqMap;
	}
}
