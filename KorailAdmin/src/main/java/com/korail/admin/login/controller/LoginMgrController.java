package com.korail.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.korail.admin.login.service.LoginService;
import com.korail.admin.login.vo.AdminVO;

@Controller
public class LoginMgrController {
	@Autowired
	private LoginService loginService;
	
	// 로그인 화면
	@RequestMapping("login")
	public String login(){
		return "/admin/login";
	}
	
	// 로그인 처리
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView adminLogin(AdminVO adminVO, HttpSession session, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		AdminVO loginAdmin = loginService.adminLogin(adminVO.getAdminId(), adminVO.getAdminPw());
		
		if(loginAdmin != null){
			session.setAttribute("login", loginAdmin);
			mav.setViewName("/admin/success");
		}else{
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	
	// 로그아웃 처리
	@RequestMapping("logout")
	public String logout(HttpSession session){
		session.setAttribute("adminLogin", null);
		return "redirect:login";
	}
}
