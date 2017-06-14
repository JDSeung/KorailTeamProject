package com.korail.client.signup.service;

import com.korail.client.user.vo.EmailVO;
import com.korail.client.user.vo.UserVO;

public interface SignUpService {
	
	//회원가입
	public int signup(UserVO userVO,EmailVO emailVO);
	
	
	
}

