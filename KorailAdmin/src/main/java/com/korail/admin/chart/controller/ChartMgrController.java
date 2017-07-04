package com.korail.admin.chart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.korail.admin.chart.service.ChartMgrService;
import com.korail.admin.reservation.vo.TicketingVO;

@Controller
@RequestMapping(value="/chart")
public class ChartMgrController {
	
	@Autowired
	private ChartMgrService chartService;
	
	@RequestMapping(value="/")
	public ModelAndView salesList(TicketingVO ticketingVO){
		ModelAndView model = new ModelAndView();
		List<TicketingVO> salesList = chartService.getSalesList(ticketingVO);
		model.addObject("salesList", salesList);
		model.setViewName("chart/chart");
		return model;
	}
	
	/*차트 표시 Ajax*/
	@ResponseBody
	@RequestMapping(value="/list")
	public List<TicketingVO> list(TicketingVO ticketingVO){
		return  chartService.getSalesList(ticketingVO);
	}
}
