package com.korail.client.reservation.dao;

import java.util.List;

import com.korail.client.reservation.vo.TicketingVO;

public interface TicketingDAO {
	/*승열*/
	public List<TicketingVO> getTicketingInfo(TicketingVO ticketingVO);
	public List<TicketingVO> getTicketInfo();
	public int setTicketing(TicketingVO ticketingVO);
}
