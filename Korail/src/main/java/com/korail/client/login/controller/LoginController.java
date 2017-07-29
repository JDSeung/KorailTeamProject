package com.korail.client.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.korail.client.login.service.LoginService;
import com.korail.client.user.vo.UserVO;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	Logger logger = Logger.getLogger(LoginController.class);

	@Autowired
	private LoginService loginService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginHome( HttpSession session,Model model) {
		if(session.getAttribute("userVO") != null){
			return"redirect:/";
		}
		return "/login/login";
	}
	@ResponseBody
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout( HttpSession session) {
		session.invalidate();
	}

	@ResponseBody
	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public ModelAndView login(UserVO userVO, HttpSession session, HttpServletRequest reqeust)throws Exception {
		userVO.setUserEtc("0");
		if (userVO.getUserPw() != null) {
			loginService.getLogin(userVO, session);
		}
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("userVO") == null) {
			session.setAttribute("loginCheck", 0);
			mav.setViewName("redirect:/login/");
		} else {
			/*로그인 했을경우
			 * 만료된 예매정보 업데이트(추후 관리자 측에서 해야할 일)
			 * 홈, 예약페이지로 이동*/
			userVO = (UserVO) session.getAttribute("userVO");
			String dest = (String) session.getAttribute("dest");
			dest = dest == null?"redirect:/":"redirect:"+dest;
			System.out.println(dest);
			mav.setViewName(dest);
		}
		return mav;
	}
	
	/*비회원예매버튼 클릭시 사용자 정보 입력 화면 출력*/
	@RequestMapping(value = "/guest", method = RequestMethod.GET)
	public String guest(Model model) {

		return "/login/guest";
	}

	/*정보 입력시*/
	@RequestMapping(value = "/guestinfo", method = RequestMethod.POST)
	public ModelAndView guestInfo(UserVO userVO, HttpSession session, Model model, HttpServletRequest request) {
		userVO.setUserEmail(request.getParameter("uemail"));
		loginService.getGuest(userVO, session);
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("userVO") == null) {
			mav.addObject("loginCheck", false);
			mav.setViewName("/login/login");
		} else {
			mav.setViewName("redirect:/reservation/");
		}
		
		return mav;
	}
	
	/*비회원 화면*/
	@RequestMapping(value = "/guestlogin")
	public String guest(UserVO userVO, HttpSession session, Model model, HttpServletRequest request) {	
		return "/login/guestLogin";
	}
	
	/*비회원 로그인 버튼 클릭시*/
	@ResponseBody
	@RequestMapping(value = "/guestlogin/login", method = RequestMethod.POST)
	public int guestLogin(UserVO userVO, HttpSession session, HttpServletRequest request) {
		userVO.setUserEtc("2");
		int result = loginService.getGuest(userVO, session);
		return result;
	}
}
