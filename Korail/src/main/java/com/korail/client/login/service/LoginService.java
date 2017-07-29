package com.korail.client.login.service;

import javax.servlet.http.HttpSession;

import com.korail.client.user.vo.UserVO;

public interface LoginService {
	/*회원로그인*/
	public void getLogin(UserVO userVO, HttpSession session);
	/*비회원로그인*/
	public int getGuest(UserVO userVO, HttpSession session);
}
