package com.korail.client.reservation.service;

import java.util.List;

import com.korail.client.reservation.vo.KTXInfoVO;

public interface ReservationService {
	/*승열*/
	public List<KTXInfoVO> searchTrain(KTXInfoVO ktxInfoVO) throws Exception;
}
