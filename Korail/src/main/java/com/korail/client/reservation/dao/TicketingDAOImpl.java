package com.korail.client.reservation.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.reservation.vo.TicketingVO;

@Repository
public class TicketingDAOImpl implements TicketingDAO {
	/*승열*/

	@Inject
	SqlSession session;
	
	@Override
	public List<TicketingVO> getTicketingInfo(TicketingVO ticketingVO) {
		//내 예매정보, 전체 예매 정보
		return session.selectList("getTicketingInfo", ticketingVO);
	}

	@Override
	public List<TicketingVO> getTicketInfo() {
		//현재 발권중인 사람 수
		return session.selectList("getTicketInfo");
	}

	@Override
	public int setTicketing(TicketingVO ticketingVO) {
		/*예매*/
		return session.insert("setTicketing", ticketingVO);
	}
	

}
