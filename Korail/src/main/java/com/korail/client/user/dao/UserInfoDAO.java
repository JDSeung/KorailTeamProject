package com.korail.client.user.dao;

import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.vo.EmailVO;
import com.korail.client.user.vo.UserVO;

public interface UserInfoDAO {
	
	/*로그인*/
	public UserVO getLogin(UserVO userVO);
	/*비밀번호 확인*/
	public UserVO checkPw(UserVO userVO);
	/*ID 찾기*/
	public UserVO searchId(EmailVO emailVO);
	/*PW 찾기*/
	public UserVO searchPw(UserVO userVO);
	/*PW 변경*/
	public int updatePw(UserVO userVO);
	/*마이페이지 ticketing 정보 */
	public TicketingVO myPageTicket(TicketingVO ticketingVO);
	/*회원정보 수정*/
	public int updateUserInfo(UserVO userVO);
	/*회원 탈퇴*/
	public int signOut(UserVO userVO);
	/*비회원 로그인*/
	public UserVO getGuest(UserVO userVO);
}
