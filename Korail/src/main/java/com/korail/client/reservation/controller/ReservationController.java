package com.korail.client.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.korail.client.reservation.service.ReservationService;
import com.korail.client.reservation.vo.KTXInfoVO;
import com.korail.client.reservation.vo.KTXRateInfoVO;
import com.korail.client.reservation.vo.SeatVO;
import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.vo.UserVO;

@Controller
@RequestMapping(value ="/reservation")
public class ReservationController {
	
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String reservation(Model model){
		return "reservation/searchTrain";
	}

	/*홈페이지에서 열차조회*/
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public ModelAndView getTrainInfo(@ModelAttribute KTXInfoVO ktxInfoVO, HttpServletRequest request) throws Exception{
		ModelAndView resHome = new ModelAndView("/reservation/searchTrain");
		resHome.addObject("depPlaceName", request.getParameter("depPlaceName"));
		resHome.addObject("arrPlaceName", request.getParameter("arrPlaceName"));
		resHome.addObject("depPlandTime", request.getParameter("depPlandTime"));
		resHome.addObject("cmbAdult", request.getParameter("cmbAdult"));
		resHome.addObject("cmbChild", request.getParameter("cmbChild"));
		resHome.addObject("cmbSenior", request.getParameter("cmbSenior"));
		resHome.addObject("cmbYear", request.getParameter("cmbYear"));
		resHome.addObject("cmbMonth", request.getParameter("cmbMonth"));
		resHome.addObject("cmbDay", request.getParameter("cmbDay"));
		resHome.addObject("cmbTime", request.getParameter("cmbTime"));
		return resHome;
	}
	
	/*열차조회*/
	@ResponseBody
	@RequestMapping(value = "/ajaxSearchTrain", method = RequestMethod.POST)
	public Map<String, Object> getAjaxTrainInfo(@ModelAttribute KTXInfoVO ktxInfoVO, TicketingVO ticketingVO, HttpServletRequest request) throws Exception{
		Map<String, Object> resInfoList = new HashMap<String, Object>();
		List<TicketingVO> ticketInfoList = new ArrayList<TicketingVO>();
		List<KTXRateInfoVO> ktxRateInfoList = new ArrayList<KTXRateInfoVO>();
		List<SeatVO> seatList = new ArrayList<SeatVO>();
		ticketInfoList = reservationService.getTicketInfo(ticketingVO, request);
		resInfoList = reservationService.getTrainInfo(ktxInfoVO, request);
		ktxRateInfoList = reservationService.getTrainRate();
		seatList = reservationService.getSeatInfo();
		resInfoList.put("ticketInfoList", ticketInfoList);
		resInfoList.put("ktxRateInfoList", ktxRateInfoList);
		resInfoList.put("seatList", seatList);
		
		return resInfoList;
	}
	
	/*예약버튼 클릭시 임시 예약 DB저장*/
	@RequestMapping(value = "/resinfo")
	public ModelAndView resInfo(@ModelAttribute TicketingVO ticketingVO, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView resPage = new ModelAndView("reservation/resInfo");
		if(session.getAttribute("ticketInfo") != null){
			ticketingVO = (TicketingVO) session.getAttribute("ticketInfo");
		}
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		ticketingVO.setUserNo(userVO.getUserNo());
		reservationService.reservationKTX(ticketingVO);
		resPage.addObject("ticketingVO",ticketingVO);
		return resPage;
	}
	
	/*예약버튼 클릭시 좌석 예매여부 조회*/
	@ResponseBody
	@RequestMapping(value = "/resSearch")
	public int resSearch(@ModelAttribute TicketingVO ticketingVO, HttpServletRequest request, HttpSession session) throws Exception {
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		ticketingVO.setUserNo(userVO.getUserNo());
		int result = reservationService.resSearch(ticketingVO);
		if(result == 1 ){
			return result;
		}
		return 0;
	}	
	/*예약 중 이전페이지 버튼 클릭, 예약 취소 버튼 클릭시.*/
	@ResponseBody
	@RequestMapping(value = "/cancelres", method = RequestMethod.POST)
	public int cancelRes(@ModelAttribute TicketingVO ticketingVO, HttpServletRequest request, HttpSession session) throws Exception {
		ticketingVO.setTicketingETC("1");
		UserVO user = (UserVO)session.getAttribute("userVO");
		if(user != null){
			ticketingVO.setUserNo(user.getUserNo());
		}
		int result = reservationService.resCancel(ticketingVO);
		ticketingVO = null;
		return result;
	}
	
	/*결제버튼 클릭시*/
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public String payment(@ModelAttribute TicketingVO ticketingVO, HttpSession session, Model model) throws Exception {
		ticketingVO.setTicketingETC("3");
		UserVO user = (UserVO) session.getAttribute("userVO");
		ticketingVO.setUserNo(user.getUserNo());
		reservationService.resChange(ticketingVO);
		return "reservation/payment";
	}
	
	
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String paymentGet(@ModelAttribute TicketingVO ticketingVO, HttpServletRequest request) throws Exception {
		return "reservation/payment";
	}
}
