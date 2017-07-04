package com.korail.client.reservation.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.reservation.vo.SeatVO;

@Repository
public class SeatDAOImpl implements SeatDAO{
	
	@Inject
	SqlSession session;

	@Override
	/*좌석정보조회*/
	public List<SeatVO> getSeatInfo(){
		return session.selectList("getSeatInfo");
	}
}
