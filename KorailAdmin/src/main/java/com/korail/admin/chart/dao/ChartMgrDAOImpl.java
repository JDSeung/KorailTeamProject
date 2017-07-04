package com.korail.admin.chart.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.admin.reservation.vo.TicketingVO;

@Repository
public class ChartMgrDAOImpl implements ChartMgrDAO {
	
	@Inject
	private SqlSession session;

	/* 매출 리스트 */
	@Override
	public List<TicketingVO> getSalesList(TicketingVO ticketingVO) {
		return session.selectList("getSalesList", ticketingVO);
	}
}
