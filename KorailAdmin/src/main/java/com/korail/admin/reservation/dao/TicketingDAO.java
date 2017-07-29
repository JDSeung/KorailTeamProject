package com.korail.admin.reservation.dao;

import java.util.List;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.reservation.vo.TicketingVO;

public interface TicketingDAO {
	
	/*예약 정보 조회*/
	public List<TicketingVO> getResInfo(PagingComponent paging);
	
	/*총 예약 수 조회*/
	public int getResTotalCnt(PagingComponent paging);
	
	/*예약 정보*/
	public TicketingVO getResDetail(TicketingVO ticketingVO);
	
	/*예약 취소*/
	public int resCancel(TicketingVO ticketingVO);
	
}
