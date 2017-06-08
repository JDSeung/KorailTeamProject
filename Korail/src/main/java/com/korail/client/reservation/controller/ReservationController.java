package com.korail.client.reservation.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.korail.client.reservation.vo.KTXInfoVO;

@Controller
@RequestMapping(value = "/reservation")
public class ReservationController {
	
	Logger logger = Logger.getLogger(ReservationController.class);
	
	@RequestMapping(value = "/searchtrain", method = RequestMethod.GET)
	public String a(@ModelAttribute KTXInfoVO ktxInfoVO, Model model){
		
		
		return "a";
	}
}
