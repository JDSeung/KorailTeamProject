package com.korail.client.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.client.reservation.dao.KTXInfoDAO;
import com.korail.client.reservation.vo.KTXInfoVO;

@Service
public class ReservationServiceImpl implements ReservationService{
	/*승열*/
	
	@Autowired
	private KTXInfoDAO ktxInfoDAO;
	
	@Override
	public List<KTXInfoVO> searchTrain(KTXInfoVO ktxInfoVO) throws Exception {
		return ktxInfoDAO.searchTrain(ktxInfoVO);
	}
	
}
