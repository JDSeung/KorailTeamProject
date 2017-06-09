package com.korail.client.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/reservation")
public class ReservationController {
	
	@RequestMapping(value = "/")
	public String reservation(Model model){
		return "reservation/searchTrain";
	}
}
