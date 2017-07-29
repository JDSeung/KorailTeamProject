package com.korail.admin.reservation.service;

import java.util.List;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.reservation.vo.TicketingVO;

public interface ResMgrService {
	/*예약정보조회*/
	public List<TicketingVO> getResInfo(PagingComponent paging);
	
	/*예약 정보*/
	public TicketingVO getResDetail(TicketingVO ticketingVO);
	
	/*예약 취소*/
	public int resCancel(TicketingVO ticketingVO);
}
