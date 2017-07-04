package com.korail.client.signup.dao;


import com.korail.client.user.vo.EmailVO;
import com.korail.client.user.vo.UserVO;

public interface SignupDAO {
	//회원가입
	public int getInsertSignup(UserVO userVO);
	
	//중복체크
	public int getIdChk(UserVO userVO);
	
	//이메일 중복체크
	public String getChkEmail(EmailVO emailVO);
	
	/*탈퇴회원 유무 검사*/
	public int isSignOutUser(UserVO userVO);
	
	/*탈퇴회원 갱신*/
	public int updateSignup(UserVO userVO);
}
