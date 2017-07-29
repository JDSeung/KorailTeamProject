package com.korail.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.reservation.dao.TicketingDAO;
import com.korail.admin.reservation.vo.TicketingVO;

@Service
public class ResMgrServiceImpl implements ResMgrService{

	@Autowired
	private TicketingDAO ticketingDAO;
	
	/*예약정보조회*/
	@Override
	public List<TicketingVO> getResInfo(PagingComponent paging){
		int totalContent = ticketingDAO.getResTotalCnt(paging);
		paging.setTotalContent(totalContent);
		return ticketingDAO.getResInfo(paging);
	}
	
	/*예약 정보*/
	@Override
	public TicketingVO getResDetail(TicketingVO ticketingVO){
		return ticketingDAO.getResDetail(ticketingVO);
	}
	
	/*예약 취소*/
	@Override
	public int resCancel(TicketingVO ticketingVO){
		return ticketingDAO.resCancel(ticketingVO);
	}
}
