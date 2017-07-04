package com.korail.client.reservation.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.korail.client.paging.PagingComponent;
import com.korail.client.reservation.vo.KTXInfoVO;
import com.korail.client.reservation.vo.KTXRateInfoVO;
import com.korail.client.reservation.vo.SeatVO;
import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.vo.UserVO;

public interface ReservationService {
	/*승열*/
	/*열차 조회*/
	public Map<String, Object> getTrainInfo(KTXInfoVO ktxInfoVO, HttpServletRequest request) throws Exception;
	/*운임요금조회*/
	public List<KTXRateInfoVO> getTrainRate() throws Exception;
	/*예약 정보 조회*/
	public List<TicketingVO> getTicketInfo(TicketingVO ticketingVO, HttpServletRequest request) throws Exception;
	/*좌석 정보조회*/
	public List<SeatVO> getSeatInfo() throws Exception;
	/*예매*/
	public int reservationKTX(TicketingVO ticketingVO) throws Exception;
	/*예약취소*/
	public int resChange(TicketingVO ticketingVO) throws Exception;
	/*내 예약정보조회*/
	public List<TicketingVO> getTicketingInfo(TicketingVO ticketingVO, PagingComponent paging) throws Exception;
	/*로그인시 탑승 시간이 지난 정보를 만료로 변경*/
	public int updateResInfo(UserVO userVO) throws Exception;
}
