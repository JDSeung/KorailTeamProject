package com.korail.client.reservation.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.client.reservation.dao.KTXInfoDAO;
import com.korail.client.reservation.dao.KTXRateInfoDAO;
import com.korail.client.reservation.dao.TicketingDAO;
import com.korail.client.reservation.vo.KTXInfoVO;
import com.korail.client.reservation.vo.TicketingVO;

@Service
public class ReservationServiceImpl implements ReservationService{
	/*승열*/
	
	@Autowired
	private KTXInfoDAO ktxInfoDAO;
	@Autowired
	private KTXRateInfoDAO ktxRateInfoDAO;
	@Autowired
	private TicketingDAO ticketingDAO;
	
	@Override
	public List<KTXInfoVO> getTrainInfo(KTXInfoVO ktxInfoVO, HttpServletRequest request) throws Exception {
		/*열차정보 조회*/
		String deptime = request.getParameter("cmbYear");
		if(request.getParameter("cmbMonth").length()== 1){
			deptime += ("0"+ request.getParameter("cmbMonth"));
		}else{
			deptime += (request.getParameter("cmbMonth"));
		}
		if(request.getParameter("cmbDay").length()== 1){
			deptime += ("0"+ request.getParameter("cmbDay"));
		}else{
			deptime += (request.getParameter("cmbDay"));
		}
		if(request.getParameter("cmbTime").length()== 1){
			deptime += ("0"+ request.getParameter("cmbTime"));
		}else{
			deptime += (request.getParameter("cmbTime"));
		}
		ktxInfoVO.setDepPlandTime(deptime);
		return ktxInfoDAO.getTrainInfo(ktxInfoVO);
	}

	@Override
	public List<KTXInfoVO> getTrainRate() throws Exception {
		/*요금가져오는항목*/
		return ktxRateInfoDAO.getTrainRate();
	}

	@Override
	public List<TicketingVO> getTicketingInfo(TicketingVO ticketingVO) throws Exception {
		/*내 예매정보, 전체 예매정보*/
		return ticketingDAO.getTicketingInfo(ticketingVO);
	}

	@Override
	public List<TicketingVO> getTicketInfo() throws Exception {
		/*현재 발권 중인 사람*/
		return ticketingDAO.getTicketInfo();
	}

	@Override
	public int setTicketing(TicketingVO ticketingVO) throws Exception {
		/*예매*/
		return ticketingDAO.setTicketing(ticketingVO);
	}
	
}
