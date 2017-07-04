package com.korail.client.signup.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.client.encryption.BCrypt;
import com.korail.client.encryption.SHA256;
import com.korail.client.signup.dao.SignupDAO;
import com.korail.client.user.vo.UserVO;

@Service
public class SignUpServiceImpl implements SignUpService {
	/* 슬기형 */

	@Autowired
	private SignupDAO signDAO;

	// 회원가입
	@Override
	public int insertUser(UserVO userVO, HttpServletRequest request) {
		
		String orgPass = userVO.getUserPw();
		String shaPass = "";
		try {
			SHA256 sha = SHA256.getInsatnce();
		
		     shaPass = sha.getSha256(orgPass.getBytes());
		
		     String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
		
		     userVO.setUserPw(bcPass);
		} catch (Exception e) {
		     e.printStackTrace();
		}
		userVO.setUserBirth(request.getParameter("cmbYear") + "-" + request.getParameter("cmbMonth") + "-"
				+ request.getParameter("cmbDay"));
		userVO.setUserAddr(request.getParameter("dorozip") + "/" + request.getParameter("doroaddrVil") + "/"
				+ request.getParameter("doroaddrDit"));
		userVO.setUserPhone(request.getParameter("userphone1") + "-" + request.getParameter("userphone2") + "-"
				+ request.getParameter("userphone3"));
		int result = signDAO.isSignOutUser(userVO);
		if(result == 0){
			if(userVO.getUserId() == null){
				userVO.setUserEtc("2");
			}
			result = signDAO.getInsertSignup(userVO);
		}else{
			result = signDAO.updateSignup(userVO);
		}
		return result;
	}

	//중복체크
	@Override
	public int selectId(UserVO userVO) {
		
		return signDAO.getIdChk(userVO);
	}
}
