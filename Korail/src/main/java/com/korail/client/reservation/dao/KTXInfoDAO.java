package com.korail.client.reservation.dao;

import java.util.List;

import com.korail.client.reservation.vo.KTXInfoVO;

public interface KTXInfoDAO {
	public List<KTXInfoVO> getTrainInfo(KTXInfoVO ktxInfoVO);
}
