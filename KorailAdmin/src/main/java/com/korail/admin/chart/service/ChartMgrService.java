package com.korail.admin.chart.service;

import java.util.List;

import com.korail.admin.reservation.vo.TicketingVO;

public interface ChartMgrService{
	public List<TicketingVO> getSalesList(TicketingVO ticketingVO);
}
