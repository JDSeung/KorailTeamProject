package com.korail.client.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.reservation.vo.TicketingVO;
import com.korail.client.user.vo.EmailVO;
import com.korail.client.user.vo.UserVO;

@Repository
public class UserInfoDAOImpl implements UserInfoDAO {

	@Inject
	private SqlSession session;

	private String namespace = "com.korail.client.user.dao.UserInfoDAO";

	// 로그인 
	@Override
	public UserVO getLogin(UserVO userVO) {
		return session.selectOne(namespace + ".getLogin", userVO);
	}
	// 비밀번호 확인
	@Override
	public UserVO checkPw(UserVO userVO) {
		return session.selectOne("checkPw", userVO);
	}

	/*ID 찾기*/
	@Override
	public UserVO searchId(EmailVO emailVO){
		return session.selectOne("searchId", emailVO);
	}
	
	/*PW 찾기*/
	@Override
	public UserVO searchPw(UserVO userVO){
		return session.selectOne("searchPw", userVO);
	}
	/*PW 변경*/
	@Override
	public int updatePw(UserVO userVO){
		return session.update("updatePw", userVO);
	}
	/* 마이페이지 ticketing 정보 */
	@Override
	public TicketingVO myPageTicket(TicketingVO ticketingVO) {
		return session.selectOne("myPageInfo", ticketingVO);
	}
	
	/*회원정보 수정*/
	@Override
	public int updateUserInfo(UserVO userVO){
		return session.update("updateUserInfo", userVO);
	}
	
	/*회원 탈퇴*/
	@Override
	public int signOut(UserVO userVO){
		return session.update("signOut", userVO);
	}
	/*회원가입*/
	@Override
	public UserVO getGuest(UserVO userVO) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getGuest", userVO);
	}
}
