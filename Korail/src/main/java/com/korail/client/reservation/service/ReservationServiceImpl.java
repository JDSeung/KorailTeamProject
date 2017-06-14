package com.korail.client.reservation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.client.paging.PagingComponent;
import com.korail.client.reservation.dao.KTXInfoDAO;
import com.korail.client.reservation.dao.KTXRateInfoDAO;
import com.korail.client.reservation.dao.TicketingDAO;
import com.korail.client.reservation.vo.KTXInfoVO;
import com.korail.client.reservation.vo.KTXRateInfoVO;
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
	public Map<String, Object> getTrainInfo(KTXInfoVO ktxInfoVO, HttpServletRequest request) throws Exception {
		/*열차정보 조회*/
		PagingComponent pagingComponent = new PagingComponent();
		
		
		String deptime = request.getParameter("cmbYear");
		Map<String, Object>  ktxInfoMap =  new HashMap<String, Object>();
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
		
		pagingComponent.setCurruntPage(Integer.parseInt(request.getParameter("curruntPage")));
		ktxInfoVO.setDepPlandTime(deptime);
		int totalContent=getTotalTrainList(ktxInfoVO);
		pagingComponent.setTotalContent(totalContent);
		ktxInfoMap.put("pagingComponent", pagingComponent);
		ktxInfoMap.put("ktxInfoVO", ktxInfoVO);
		System.out.println(pagingComponent.getStartPage());
		System.out.println(pagingComponent.getEndPage());
		List<KTXInfoVO> ktxInfoList =ktxInfoDAO.getTrainInfo(ktxInfoMap);
		ktxInfoMap.remove("ktxInfoVO");
		ktxInfoMap.put("ktxInfoList", ktxInfoList);
		return ktxInfoMap;
	}

	/**
	 * 열차 검색 조건에 따른 전체 열차수
	 * @param ktxInfoVO 열차 검색 조건 항목
	 * @return  전체 열차수
	 * */
	private int getTotalTrainList(KTXInfoVO ktxInfoVO) {
		
		return ktxInfoDAO.getTotalTrainList(ktxInfoVO);
	}

	@Override
	public List<KTXRateInfoVO> getTrainRate() throws Exception {
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
		/*현재 발권 중인 사람 및 전체 인원*/
		return ticketingDAO.getTicketInfo();
	}

	@Override
	public int setTicketing(TicketingVO ticketingVO) throws Exception {
		/*예매*/
		return ticketingDAO.setTicketing(ticketingVO);
	}
	
}
