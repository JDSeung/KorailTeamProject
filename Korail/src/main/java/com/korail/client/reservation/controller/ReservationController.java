package com.korail.client.reservation.controller;

import java.util.ArrayList;
import java.util.List;

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
	public List<KTXInfoVO> getTrainInfo(@ModelAttribute KTXInfoVO ktxInfoVO, String body, HttpServletRequest request) throws Exception{
		List<KTXInfoVO> ktxInfoList = new ArrayList<KTXInfoVO>();
		ktxInfoList = reservationService.getTrainInfo(ktxInfoVO, request);
		return ktxInfoList;
	}
}
