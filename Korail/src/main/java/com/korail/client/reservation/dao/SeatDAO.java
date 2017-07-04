package com.korail.client.reservation.dao;

import java.util.List;

import com.korail.client.reservation.vo.SeatVO;

public interface SeatDAO {
	
	/*좌석정보조회*/
	public List<SeatVO> getSeatInfo();
}
