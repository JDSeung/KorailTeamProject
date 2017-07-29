package com.korail.client.reservation.dao;

import java.util.List;
import java.util.Map;

import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.vo.UserVO;

public interface TicketingDAO {
	
	/*예약시 정보조회*/
	public List<TicketingVO> getTicketInfo(TicketingVO ticketingVO) throws Exception;
	/*KTX예약*/
	public int reservationKTX(TicketingVO ticketingVO) throws Exception;
	/*예약변경*/
	public int resChange(TicketingVO ticketingVO) throws Exception;
	/*예약취소*/
	public int resCancel(TicketingVO ticketingVO) throws Exception;
	/*마이페이지 예약정보조회*/
	public List<TicketingVO> getTicketingInfo(Map<String, Object> qnaMap) throws Exception;
	/*마이페이지 예약정보조회*/
	public int getResTotalCnt(Map<String, Object> qnaMap) throws Exception;
	/*예매된 회원은 탈퇴불가*/
	public int isResUser(UserVO userVO) throws Exception; 
	/*선택 좌석 예약 조회*/
	public int resSearch(TicketingVO ticketingVO) throws Exception; 
}
