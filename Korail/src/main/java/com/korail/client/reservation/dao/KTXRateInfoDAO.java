package com.korail.client.reservation.dao;

import java.util.List;

import com.korail.client.reservation.vo.KTXInfoVO;

public interface KTXRateInfoDAO {
	public List<KTXInfoVO> getTrainRate();

}
