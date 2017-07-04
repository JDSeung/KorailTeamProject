package com.korail.client.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.korail.client.paging.PagingComponent;
import com.korail.client.reservation.service.ReservationService;
import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.service.EmailService;
import com.korail.client.user.service.UserService;
import com.korail.client.user.vo.EmailVO;
import com.korail.client.user.vo.UserVO;

@Controller
@RequestMapping(value="/user")
public class UserInfoController {
	/*
	 * 비밀번호확인	-도윤
	 * My Page	-도윤
	 * 회원정보수정	-도윤
	 * 회원탈퇴	-슬기형 
	 * 아이디찾기	-도윤
	 * 비밀번호 찾기	-도윤
	 * 비밀번호 변경	-슬기형
	 * 예약 조회	-승열
	 * */

	static Logger logger = Logger.getLogger(UserInfoController.class);
	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private ReservationService resService;
	// 마이페이지 눌렀을 때 '비밀번호 확인' 창으로 이동
	@RequestMapping(value="/")
	public ModelAndView pw(HttpSession session){
		ModelAndView pwView = new ModelAndView();
		pwView.setViewName("/user/checkPW");
		return pwView;
	}

	
	// 비밀번호 확인 처리
	@RequestMapping(value="/page", method = RequestMethod.POST)
	public String passwordCheck(UserVO userVO, TicketingVO ticketingVO, HttpSession session, Model model, RedirectAttributes redirectAttributes){
		String viewName = "";
	    // 세션에 저장되어 있는 no를 userVO에 넣어준다. 그리고 입력된 비밀번호와 비교한다
	    UserVO user = (UserVO) session.getAttribute("userVO");
	    userVO.setUserNo(user.getUserNo());
	    ticketingVO.setUserNo(user.getUserNo());
	    if(userVO.getUserPw() != null){
	    	userVO = userService.checkPw(userVO, ticketingVO, session);
	    }else{
	    	userVO = userService.getUserInfo(userVO, ticketingVO, session);
	    }
	    // userVO안에 no로 비교하는게 아니라 vo를 들고 와서 null인지 아닌지 비교
	    if(userVO != null){
	    	userVO.setUserPw("");
	        model.addAttribute("userVO", userVO);
	        session.setAttribute("userNo", userVO.getUserNo());
	        session.setAttribute("userVO", userVO);
	        ticketingVO = (TicketingVO) session.getAttribute("ticketingVO");
	        session.removeAttribute("ticketingVO");
	        model.addAttribute("ticketingVO", ticketingVO);
	        viewName = "/user/myPage";
	    }else{
	    	redirectAttributes.addFlashAttribute("chkPw",false);
	        viewName = "redirect:/user/";
	    }
	    	return viewName;
	}
	
	
	// 아이디 찾기
	@RequestMapping(value="/searchid")
	public String searchId(){
		return "/user/searchId";
	}
	/*ID 메일 전송*/
	@ResponseBody
	@RequestMapping(value="/searchid", method = RequestMethod.POST)
	public void sendId(EmailVO emailVO){
		System.out.println("sendId 실행");
		logger.debug("sendId 실행");
		if(emailVO.getUserEmail() != null){
			logger.debug(emailVO.toString());
			emailService.sendId(emailVO);
			logger.debug(emailService.toString());
		}
	}
	
	/*PW변경*/
	@ResponseBody
	@RequestMapping(value="/searchpw", method = RequestMethod.POST)
	public int searchPw(UserVO userVO, HttpSession session){
		int result = 0;
		if(userVO.getUserEmail() != null){
			logger.debug(userVO.toString());
			result = userService.changePw(userVO, session);
			logger.debug("비밀번호변경 결과 " + result);
			System.out.println("비밀번호변경 결과 " + result);
		}
		return result;
	}
	
	/*@ResponseBody
	@RequestMapping(value="/checkmail")
	가입 회원 확인
	public String checkMail(EmailVO emailVO){
		logger.info("checkMail 호출 성공");
		String result = "";
		if(emailVO.getUserEmail() != null){
			result = emailService.getChkEmail(emailVO);
			logger.info("result 값" + result);
		}
		return result;
	}
	*/
	// 비밀번호 찾기
	@RequestMapping(value="/searchpw")
	public String searchPw(){
		return "/user/searchPw";
	}
	
	/*비밀번호 변경페이지*/ 
	@RequestMapping(value="/editpw")
	public String editPw(){
		return "/user/editPw";
	}
	
	/*비밀번호 변경*/
	@ResponseBody
	@RequestMapping(value="/changepw")
	public int chnagePw(UserVO userVO, HttpSession session){
		String userNo = (String) session.getAttribute("userNo");
		userVO.setUserNo(userNo);
		int result = 0;
		result = userService.updatePw(userVO);
		return result;
	}
	/*비밀번호 변경페이지*/ 
	@RequestMapping(value="/editinfo")
	public String editInfo(){
		return "/user/editInfo";
	}
	/*사용자 정보 변경페이지*/ 
	@ResponseBody
	@RequestMapping(value="/edituserinfo")
	public int editUserInfo(UserVO userVO, HttpServletRequest request){
		int result = 0;
		userVO.setUserEmail(request.getParameter("uemail"));
		result = userService.updateUserInfo(userVO, request);
		return result;
	}
	
	/*회원 탈퇴*/
	@ResponseBody
	@RequestMapping(value="/signout")
	public int signOut(UserVO userVO, HttpSession session)throws Exception{
		int result =-1;
		UserVO user = (UserVO) session.getAttribute("userVO");
		userVO.setUserNo(user.getUserNo());
		result = userService.signOut(userVO);
		if(result == 1){
			session.invalidate();
		}
		return result;
	}
	
	/*예매 내역 조회페이지 이동*/
	@RequestMapping(value="/resinfolist")
	public String resInfoList(TicketingVO ticketingVO, PagingComponent paging,HttpSession session, Model model)throws Exception{
		model.addAttribute("paging", paging);
		return "/user/resInfoList";
	}
	
	/*예매 내역 조회 List Ajax*/
	@ResponseBody
	@RequestMapping(value="/reslist", method = RequestMethod.POST)
	public Map<String, Object> reslist(TicketingVO ticketingVO, PagingComponent paging,HttpSession session)throws Exception{
		
		Map<String, Object> mapList = new HashMap<String, Object>();
		paging.setListSize(3);
		UserVO user = (UserVO) session.getAttribute("userVO");
		ticketingVO.setUserNo(user.getUserNo());
		List<TicketingVO> ticketList=  resService.getTicketingInfo(ticketingVO, paging);
		mapList.put("ticketList", ticketList);
		mapList.put("paging", paging);
		return mapList;
	}
}