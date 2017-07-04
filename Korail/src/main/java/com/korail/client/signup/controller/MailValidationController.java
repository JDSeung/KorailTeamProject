package com.korail.client.signup.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korail.client.user.service.EmailService;
import com.korail.client.user.vo.EmailVO;

@Controller
@RequestMapping(value = "/signup")
public class MailValidationController {
	/* 슬기형 */
	@Autowired
	private EmailService emailService;

	Logger logger = Logger.getLogger(MailValidationController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		if(session.getAttribute("userVO") != null){
			return "redirect:/";
		}
		return "/signup/mail";
	}

	@ResponseBody
	@RequestMapping(value = "/", method = RequestMethod.POST)
	/*메일 보내기*/
	public String sendMailAuth(HttpServletRequest request, @ModelAttribute EmailVO emailVO, Model model) {
		if(emailVO.getUserEmail() != null){
			logger.debug(emailVO.toString());
			emailService.makeKey(emailVO);
			logger.debug(emailService.toString());
		}
		
		model.addAttribute("emailVO",emailVO);
		model.addAttribute("authNum",emailVO.getAuthNum());
		
		return emailVO.getAuthNum();
	}
	@ResponseBody
	@RequestMapping(value = "/overlapid", method = RequestMethod.POST)
	/*이메일 중복체크*/
	public String overlapId(@ModelAttribute EmailVO emailVO) {
		String result = "";
		if(emailVO.getUserEmail() != null){
			result = emailService.getChkEmail(emailVO);
		}
		return result;
	}
	
	
}
