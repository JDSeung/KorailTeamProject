package com.korail.batch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.batch.dao.ReservationDAO;

@Service
public class ResServiceImpl implements ResService {
	@Autowired
	private ReservationDAO reservationDAO;
	
	/*예약 정보 수정*/
	public void resChange() throws Exception{
		reservationDAO.resUpdate();
	}

	/*10이상 지연 예매 고객*/
	public void resCancle() throws Exception{
		reservationDAO.resCancle();
	}
}
