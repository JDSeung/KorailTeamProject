package com.korail.admin.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.korail.admin.login.service.LoginService;
import com.korail.admin.login.vo.AdminVO;

@Controller
public class LoginMgrController {
	@Autowired
	private LoginService loginService;
	
	// 로그인 화면
	@RequestMapping("/")
	public String login(){
		return "/admin/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/loginCheck")
	public ModelAndView loginCheck(AdminVO adminVO, HttpSession session, HttpServletRequest request){
		/*
		 * 비밀번호가 있을 경우 로그인을 한것으로 간주하여 ID와 비밀번호를 확인 한다.
		 * 즉 로그인 버튼을 눌렀을 경우만 들어온다.
		 * 이렇게 한 이유는 세션이 유지되어있을 경우는 PassWord의 값을 초기화 시켜주기 때문에
		 * */
		if(adminVO.getAdminPw()!=null){
			loginService.loginCheck(adminVO, session);
		}
		ModelAndView mav = new ModelAndView();
		/*세션에 adminVO의 이름을 갖은 속성이 있을 경우 로그인 성공, 없을경우 메인 페이지로 이동한다.*/
		if(session.getAttribute("adminVO")==null){
			mav.addObject("loginCheck",false);
			mav.setViewName("/admin/login");
		}else{
			mav.setViewName("redirect:/index");
		}
		return mav;
	}
}
