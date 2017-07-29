package com.korail.client.reservation.service;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.client.paging.PagingComponent;
import com.korail.client.reservation.dao.KTXInfoDAO;
import com.korail.client.reservation.dao.KTXRateInfoDAO;
import com.korail.client.reservation.dao.SeatDAO;
import com.korail.client.reservation.dao.TicketingDAO;
import com.korail.client.reservation.vo.KTXInfoVO;
import com.korail.client.reservation.vo.KTXRateInfoVO;
import com.korail.client.reservation.vo.SeatVO;
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
	
	@Autowired
	private SeatDAO seatDAO;
	@Override
	public Map<String, Object> getTrainInfo(KTXInfoVO ktxInfoVO, HttpServletRequest request) throws Exception {
		/*열차정보 조회*/
		PagingComponent pagingComponent = new PagingComponent();
		
		
		Map<String, Object>  ktxInfoMap =  new HashMap<String, Object>();
		
		String depTime = getDepTime(request);
		pagingComponent.setCurruntPage(Integer.parseInt(request.getParameter("curruntPage")));
		
		
		ktxInfoVO.setDepPlandTime(depTime);
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
	

	/*예매 정보 조회*/
	@Override
	public List<TicketingVO> getTicketInfo(TicketingVO ticketingVO, HttpServletRequest request) throws Exception {
		String depTime = getDepTime(request);
		ticketingVO.setDepPlandTime(depTime);
		return ticketingDAO.getTicketInfo(ticketingVO);
	}
	/*좌석 정보 조회*/
	@Override
	public List<SeatVO> getSeatInfo() throws Exception {
		return seatDAO.getSeatInfo();
	}
	
	/*선택좌석 예약 정보 조회*/
	public int resSearch(TicketingVO ticketingVO) throws Exception{
		return ticketingDAO.resSearch(ticketingVO);
	}
	
	/*예약 버튼 클릭시 예약으로 인서트*/
	@Override
	public int reservationKTX(TicketingVO ticketingVO) throws Exception {
		if(ticketingVO.getTicketingETC() == null){
			ticketingVO.setTicketingETC("2");
		}
		return ticketingDAO.reservationKTX(ticketingVO);
	}
	
	public String getDepTime(HttpServletRequest request) throws Exception{
		Calendar cal = Calendar.getInstance();
		String min = cal.get ( cal.MINUTE ) + "";
		
		String depTime = request.getParameter("cmbYear");
		if(request.getParameter("cmbMonth").length()== 1){
			depTime += ("0"+ request.getParameter("cmbMonth"));
		}else{
			depTime += (request.getParameter("cmbMonth"));
		}
		if(request.getParameter("cmbDay").length()== 1){
			depTime += ("0"+ request.getParameter("cmbDay"));
		}else{
			depTime += (request.getParameter("cmbDay"));
		}
		if(request.getParameter("cmbTime").length()== 1){
			depTime += ("0"+ request.getParameter("cmbTime"));
		}else{
			depTime += (request.getParameter("cmbTime"));
		}
		if(min.length()==1){
			depTime += ("0"+ min);
		}else{
			depTime += (min);
		}
		return depTime;
	}

	/*예약 정보 변경*/
	@Override
	public int resChange(TicketingVO ticketingVO) throws Exception {
		return ticketingDAO.resChange(ticketingVO);
	}
	
	/*예약취소*/
	@Override
	public int resCancel(TicketingVO ticketingVO) throws Exception{
		return ticketingDAO.resCancel(ticketingVO);
	}
	
	/*내 예약정보조회*/
	public List<TicketingVO> getTicketingInfo(TicketingVO ticketingVO, PagingComponent paging) throws Exception{
		Map<String, Object> qnaMap = new HashMap<String, Object>();
		qnaMap.put("ticketingVO", ticketingVO);
		qnaMap.put("paging", paging);
		System.out.println(paging.getKeyWordType());
		int totalContent = ticketingDAO.getResTotalCnt(qnaMap);
		paging.setTotalContent(totalContent);
		qnaMap.put("ticketingVO", ticketingVO);
		qnaMap.put("paging", paging);
		return ticketingDAO.getTicketingInfo(qnaMap);
	}

	
}
