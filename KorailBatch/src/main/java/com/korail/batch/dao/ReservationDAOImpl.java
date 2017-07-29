package com.korail.batch.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO{

	@Inject
	private SqlSession session;
	
	/*예매 취소*/
	public int resUpdate(){
		return session.update("resUpdate");
	}
	/*10분 이상 결제 안한 고객은 예매 취소*/
	public int resCancle(){
		return session.delete("resCancle");
	}
}
