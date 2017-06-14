package com.korail.client.signup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/signup")
public class SignInIUpController {
	
	
	@RequestMapping(value = "/agreement", method = RequestMethod.POST)
	public String home(Model model) {
		return "/signup/agreement";
	}
	
	
	@RequestMapping(value = "/enterInfo", method = RequestMethod.POST)
	public String enterInfo(Model model){
		
		return "/signup/enterInfo";
	}
}
