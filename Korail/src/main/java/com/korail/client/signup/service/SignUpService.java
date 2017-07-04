package com.korail.client.signup.service;

import javax.servlet.http.HttpServletRequest;

import com.korail.client.user.vo.UserVO;

public interface SignUpService {
	
	//회원가입
	public int insertUser(UserVO userVO, HttpServletRequest request);

	//아이디 중복체크
	public int selectId(UserVO userVO);
	
}

