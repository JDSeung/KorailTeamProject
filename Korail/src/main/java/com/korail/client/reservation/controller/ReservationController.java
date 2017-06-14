package com.korail.client.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korail.client.reservation.service.ReservationService;
import com.korail.client.reservation.vo.KTXInfoVO;
import com.korail.client.reservation.vo.KTXRateInfoVO;
import com.korail.client.reservation.vo.TicketingVO;

@Controller
@RequestMapping(value ="/reservation")
public class ReservationController {
	
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String reservation(Model model){
		return "reservation/searchTrain";
	}

	@ResponseBody
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public Map<String, Object> getTrainInfo(@ModelAttribute KTXInfoVO ktxInfoVO, String body, HttpServletRequest request) throws Exception{
		Map<String, Object> resInfoList = new HashMap<String, Object>();
		List<TicketingVO> ticketInfoList = new ArrayList<TicketingVO>();
		List<KTXRateInfoVO> ktxRateInfoList = new ArrayList<KTXRateInfoVO>();
		ticketInfoList = reservationService.getTicketInfo();
		resInfoList = reservationService.getTrainInfo(ktxInfoVO, request);
		ktxRateInfoList = reservationService.getTrainRate();
		resInfoList.put("ticketInfoList", ticketInfoList);
		resInfoList.put("ktxRateInfoList", ktxRateInfoList);
		return resInfoList;
	}
}
