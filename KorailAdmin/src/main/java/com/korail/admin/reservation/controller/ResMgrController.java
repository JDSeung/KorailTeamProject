package com.korail.admin.reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.reservation.service.ResMgrService;
import com.korail.admin.reservation.vo.TicketingVO;

@Controller
@RequestMapping(value="/res")
public class ResMgrController {
	
	@Autowired
	private ResMgrService resMgrService;
	
	/*예매 관리페이지 호출*/
	@RequestMapping(value="/")
	public String res(PagingComponent paging, Model model){
		model.addAttribute("paging", paging);
		return "/res/searchRes";
	}
	
	/*예매 내역 조회*/
	@ResponseBody
	@RequestMapping(value="/searchres")
	public Map<String, Object> getResInfo(PagingComponent paging){
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<TicketingVO> resList = resMgrService.getResInfo(paging);
		resMap.put("resList", resList);
		resMap.put("paging", paging);
		return resMap;
	}
	
	/*상세 예매내역*/
	@RequestMapping(value="/resdetail")
	public String resDetail( TicketingVO ticketingVO,  PagingComponent paging, Model model){
		ticketingVO = resMgrService.getResDetail(ticketingVO);
		model.addAttribute("ticketingVO", ticketingVO);
		model.addAttribute("paging", paging);
		return "/res/resDetail";
	}
	
	/*환불*/
	@ResponseBody
	@RequestMapping(value="/resCancel")
	public int resCancel( TicketingVO ticketingVO){
		return resMgrService.resCancel(ticketingVO);
	}

}
