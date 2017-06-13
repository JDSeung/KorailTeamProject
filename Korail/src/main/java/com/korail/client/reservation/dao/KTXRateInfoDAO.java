package com.korail.client.reservation.dao;

import java.util.List;

import com.korail.client.reservation.vo.KTXRateInfoVO;

public interface KTXRateInfoDAO {
	public List<KTXRateInfoVO> getTrainRate();

}
