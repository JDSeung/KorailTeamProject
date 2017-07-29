package com.korail.admin.reservation.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.reservation.vo.TicketingVO;

@Repository
public class TicketingDAOImpl implements TicketingDAO{

	@Inject
	private SqlSession session;
	
	/*예약 정보 조회*/
	@Override
	public List<TicketingVO> getResInfo(PagingComponent paging){
		return session.selectList("getResInfo", paging);
	}
	/*총 예약 수 조회*/
	@Override
	public int getResTotalCnt(PagingComponent paging){
		return session.selectOne("getResTotalCnt", paging);
	}
	/*예약 정보*/
	@Override
	public TicketingVO getResDetail(TicketingVO ticketingVO){
		return session.selectOne("getResDetail", ticketingVO);
	}
	
	/*예약 취소*/
	@Override
	public int resCancel(TicketingVO ticketingVO){
		return session.update("resCancel", ticketingVO);
	}
}
