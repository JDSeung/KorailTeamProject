package com.korail.client.signup.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.korail.client.user.service.EmailServiceImpl;
import com.korail.client.user.vo.EmailVO;

@Controller
@RequestMapping(value = "/signup")
public class MailValidationController {
	/* 슬기형 */
	@Autowired
	private EmailServiceImpl emailService;

	Logger logger = Logger.getLogger(MailValidationController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return "/signup/mail";
	}
	@ResponseBody
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public EmailVO sendMailAuth(HttpServletRequest request, @ModelAttribute EmailVO emailVO, Model model) {

		logger.debug(emailVO.toString());
		emailVO = emailService.sendMail(emailVO);
		logger.debug(emailService.toString());
		System.out.println("아아아아아아아아아아아아아"+emailVO.getAuthNum());
		return emailVO;
	}
}
