package com.korail.client.reservation.dao;

import java.util.List;

import com.korail.client.reservation.vo.SeatVO;

public interface SeatDAO {
	public List<SeatVO> getSeatInfo();
}
