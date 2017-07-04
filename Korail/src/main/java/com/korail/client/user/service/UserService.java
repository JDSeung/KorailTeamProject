package com.korail.client.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.vo.UserVO;

public interface UserService {
	/*슬기형, 도윤 , 승열*/
	// 비밀번호 확인
	public UserVO checkPw(UserVO userVO, TicketingVO ticketingVO, HttpSession session);
	/*비밀번호 변경*/
	public int changePw(UserVO userVO, HttpSession session);
	/*PW 변경*/
	public int updatePw(UserVO userVO);
	/* 마이페이지 ticketing 정보 */
	public TicketingVO myPageTicket(TicketingVO ticketingVO);
	/*회원정보 수정*/
	public int updateUserInfo(UserVO userVO, HttpServletRequest request);
	/*회원 탈퇴*/
	public int signOut(UserVO userVO) throws Exception;
	/*회원정보 수정 또는 뒤로가기버튼 이동*/
	public UserVO getUserInfo(UserVO userVO, TicketingVO ticketingVO, HttpSession session) ;
}
