package com.korail.client.reservation.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.korail.client.reservation.vo.KTXInfoVO;
import com.korail.client.reservation.vo.KTXRateInfoVO;
import com.korail.client.reservation.vo.SeatVO;
import com.korail.client.reservation.vo.TicketingVO;

public interface ReservationService {
	/*승열*/
	public Map<String, Object> getTrainInfo(KTXInfoVO ktxInfoVO, HttpServletRequest request) throws Exception;
	public List<KTXRateInfoVO> getTrainRate() throws Exception;
	public List<TicketingVO> getTicketingInfo(TicketingVO ticketingVO) throws Exception;
	public List<TicketingVO> getTicketInfo() throws Exception;
	public int setTicketing(TicketingVO ticketingVO) throws Exception;
	public List<SeatVO> getSeatInfo() throws Exception;
}
