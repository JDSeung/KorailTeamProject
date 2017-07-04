package com.korail.admin.chart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.chart.dao.ChartMgrDAO;
import com.korail.admin.reservation.vo.TicketingVO;

@Service
public class ChartMgrServiceImpl implements ChartMgrService{

	@Autowired
	private ChartMgrDAO chartDAO;

	@Override
	public List<TicketingVO> getSalesList(TicketingVO ticketingVO) {
		List<TicketingVO> salesList = chartDAO.getSalesList(ticketingVO);
		return salesList;
	}
}
