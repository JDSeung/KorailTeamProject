package com.korail.admin.chart.dao;

import java.util.List;

import com.korail.admin.reservation.vo.TicketingVO;

public interface ChartMgrDAO {
	/* 매출 리스트 */
	public List<TicketingVO> getSalesList(TicketingVO ticketingVO);
}
