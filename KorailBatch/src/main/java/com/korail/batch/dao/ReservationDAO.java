package com.korail.batch.dao;

public interface ReservationDAO {

	/*예매 취소*/
	public int resUpdate();
	
	/*10분 이상 결제 안한 고객은 예매 취소*/
	public int resCancle();
}
