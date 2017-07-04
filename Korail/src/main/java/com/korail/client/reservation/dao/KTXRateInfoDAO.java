package com.korail.client.reservation.dao;

import java.util.List;

import com.korail.client.reservation.vo.KTXRateInfoVO;

public interface KTXRateInfoDAO {
	/*운임요금 조회*/
	public List<KTXRateInfoVO> getTrainRate();

}
