package com.korail.client.reservation.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.vo.UserVO;

@Repository
public class TicketingDAOImpl implements TicketingDAO {
	/*승열*/

	@Inject
	SqlSession session;
	

	@Override
	/*예매정보 조회*/
	public List<TicketingVO> getTicketInfo(TicketingVO ticketingVO) throws Exception{
		return session.selectList("getTicketInfo", ticketingVO);
	}
	@Override
	/*선택 좌석 예약 조회*/
	public int resSearch(TicketingVO ticketingVO) throws Exception{
		return session.selectOne("resSearch", ticketingVO);
	}
	@Override
	/*열차 예약*/
	public int reservationKTX(TicketingVO ticketingVO) throws Exception {
		return session.insert("reservationKTX", ticketingVO);
	}

	@Override
	/*예매 변경*/
	public int resChange(TicketingVO ticketingVO) throws Exception {
		return session.update("resChange", ticketingVO);
	}
	@Override
	/*예매 취소*/
	public int resCancel(TicketingVO ticketingVO) throws Exception {
		return session.delete("resCancel", ticketingVO);
	}
	@Override
	/*마이페이지 예약정보조회*/
	public List<TicketingVO> getTicketingInfo(Map<String, Object> qnaMap) throws Exception{
		return session.selectList("getTicketingInfo", qnaMap);
	}
	@Override
	/*마이페이지 예약정보조회*/
	public int getResTotalCnt(Map<String, Object> qnaMap) throws Exception{
		return session.selectOne("getResTotalCnt", qnaMap);
	}
	
	
	@Override
	/*예매된 회원은 탈퇴불가*/
	public int isResUser(UserVO userVO) throws Exception{
		return session.selectOne("isResUser", userVO);
	}
	
}
