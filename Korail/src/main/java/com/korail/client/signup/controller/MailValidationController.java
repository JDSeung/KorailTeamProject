package com.korail.client.signup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping(value ="/signup")
public class MailValidationController {
	/*슬기형*/
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "/signup/mail";
	}
}
