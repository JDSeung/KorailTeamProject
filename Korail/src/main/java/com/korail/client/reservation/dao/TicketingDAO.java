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
	/*마이페이지 예약정보조회*/
	public List<TicketingVO> getTicketingInfo(Map<String, Object> qnaMap) throws Exception;
	/*마이페이지 예약정보조회*/
	public int getResTotalCnt(Map<String, Object> qnaMap) throws Exception;
	/*로그인시 탑승 시간이 지난 정보를 만료로 변경*/
	public int updateResInfo(UserVO userVO) throws Exception;
	/*예매된 회원은 탈퇴불가*/
	public int isResUser(UserVO userVO) throws Exception; 
}
