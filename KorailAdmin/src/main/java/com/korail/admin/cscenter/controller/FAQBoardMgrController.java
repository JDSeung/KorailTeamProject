package com.korail.admin.cscenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.service.FAQMgrService;
import com.korail.admin.cscenter.vo.FAQVO;
import com.korail.admin.login.vo.AdminVO;

@Controller
@RequestMapping(value = "/boardmgr/faq")
public class FAQBoardMgrController {

	@Autowired
	private FAQMgrService faqService;

	/* FAQ페이지 */
	@RequestMapping(value = "/")
	public ModelAndView faq(FAQVO faqVO, PagingComponent pagingComponent) throws Exception {
		ModelAndView faqView = new ModelAndView();
		faqView.addObject("paging", pagingComponent);
		faqView.setViewName("boardmgr/faq/faqList");
		return faqView;
	}

	// Ajax 통신 페이징 처리
	@ResponseBody
	@RequestMapping(value = "/list")
	public Map<String, Object> faqList(FAQVO faqVO, PagingComponent paging, Model model) throws Exception {
		Map<String, Object> faqMap = new HashMap<String, Object>();
		List<FAQVO> faqList = faqService.getFAQList(faqVO, paging);
		faqMap.put("faqList", faqList);
		faqMap.put("paging", paging);
		return faqMap;
	}

	/* 게시물 검색 */
	@ResponseBody
	@RequestMapping(value = "/searchData")
	public Map<String, Object> searchData(FAQVO faqVO, PagingComponent paging) throws Exception {
		Map<String, Object> mapList = new HashMap<String, Object>();
		List<FAQVO> faqList = faqService.getFAQList(faqVO, paging);
		mapList.put("faqList", faqList);
		mapList.put("paging", paging);
		return mapList;
	}

	// 글쓰기 폼 출력
	@RequestMapping(value = "/faqwrite")
	public String faqWrite(PagingComponent paging) throws Exception {

		return "/boardmgr/faq/faqWrite";
	}

	// 글쓰기
	@ResponseBody
	@RequestMapping(value = "/write")
	public int write(FAQVO faqVO, HttpSession session) throws Exception {

		return faqService.getFAQWrite(faqVO, session);
	}

	// 글 상세보기
	@RequestMapping(value = "/faqdetail")
	public String faqdetail(FAQVO faqVO, PagingComponent paging, HttpSession session, Model model) throws Exception {
		Map<String, FAQVO> faqMap = new HashMap<String, FAQVO>();
		String viewName = "";
		if (session.getAttribute("adminVO") != null) {
			AdminVO adminVO = (AdminVO) session.getAttribute("adminVO");
			faqVO.setAdminNo(adminVO.getAdminNo());
		}
		if (faqVO.getAdminNo() == null) {
			viewName = "redirect:boardmgr/faq/faqList";
			return viewName;
		}
		faqMap = faqService.getFAQ(faqVO);
		faqVO = faqMap.get("faqVO");
		model.addAttribute("paging", paging);
		model.addAttribute("faqVO", faqVO);

		if (faqVO != null) {
			viewName = "/boardmgr/faq/faqDetail";
		} else {
			viewName = "redirect: boardmgr/faq/faqList";
			return viewName;
		}
		return viewName;
	}

	// 글삭제
	@ResponseBody
	@RequestMapping(value = "/faqdelete")
	public int faqDelete(FAQVO faqVO) throws Exception {

		int result = faqService.getFAQDelete(faqVO);
		return result;
	}

	@RequestMapping(value = "/faqEdit")
	public ModelAndView faqEdit(FAQVO faqVO, PagingComponent pagingComponent, HttpSession session) throws Exception {
		ModelAndView faqView = new ModelAndView();
		Map<String, FAQVO> faqMap = new HashMap<String, FAQVO>();
		faqMap = faqService.getFAQ(faqVO);
		faqVO = faqMap.get("faqVO");
		faqView.addObject("faqVO", faqVO);
		faqView.addObject("paging", pagingComponent);
		faqView.setViewName("/boardmgr/faq/faqEdit");
		return faqView;
	}
	
	@ResponseBody
	@RequestMapping(value = "/edit")
	public int faqUpdate(FAQVO faqVO) throws Exception {
		int result = faqService.getFAQUpdate(faqVO);
		return result;
	}
}
