package com.korail.client.signup.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.user.vo.EmailVO;
import com.korail.client.user.vo.UserVO;

@Repository
public class SignupDAOImpl implements SignupDAO{
	
	@Inject
	SqlSession session;
	
	private String namespace = "com.korail.client.signup.dao.SignupDAO";
	
	@Override
	public int getInsertSignup(UserVO userVO) {
		
		return session.insert(namespace + ".getInsertSignup", userVO);
	}
	/*슬기형*/

	@Override
	public int getIdChk(UserVO userVO) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getIdChk", userVO);
	}

	@Override
	public String getChkEmail(EmailVO emailVO) {
		// TODO Auto-generated method stub
		return session.selectOne(namespace+".getChkEmail", emailVO);
	}
	
	/*탈퇴회원 유무 검사*/
	@Override
	public int isSignOutUser(UserVO userVO){
		return session.selectOne("isSignOutUser", userVO);
	}
	
	/*탈퇴회원 갱신*/
	@Override
	public int updateSignup(UserVO userVO){
		return session.update("updateSignup", userVO);
	}
}
