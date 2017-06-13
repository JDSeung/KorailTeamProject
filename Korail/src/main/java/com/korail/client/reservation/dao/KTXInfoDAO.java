package com.korail.client.reservation.dao;

import java.util.List;
import java.util.Map;

import com.korail.client.reservation.vo.KTXInfoVO;

public interface KTXInfoDAO {
	public List<KTXInfoVO> getTrainInfo(Map<String, Object>  ktxInfoMap);

	public int getTotalTrainList(KTXInfoVO ktxInfoVO);
}
