package com.korail.client.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.client.encryption.BCrypt;
import com.korail.client.encryption.SHA256;
import com.korail.client.user.dao.UserInfoDAO;
import com.korail.client.user.vo.UserVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserInfoDAO userInfoDAO;

	/*회원로그인*/
	@Override
	public void getLogin(UserVO userVO, HttpSession session) {
		
		UserVO dbuserVO = userInfoDAO.getLogin(userVO);
		try {
			if (dbuserVO != null) {
				String orgPass = userVO.getUserPw();
				SHA256 sha = SHA256.getInsatnce();
				String shaPass = sha.getSha256(orgPass.getBytes());
				String dbPass = dbuserVO.getUserPw();
				if (BCrypt.checkpw(shaPass, dbPass)) {
					userVO = dbuserVO;
					userVO.setUserPw("");
					session.setAttribute("userVO", userVO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*비회원 로그인*/
	@Override
	public void getGuest(UserVO userVO, HttpSession session) {
		UserVO dbuserVO = userInfoDAO.getGuest(userVO);
		try {
			if (dbuserVO != null) {
				String orgPass = userVO.getUserPw();
				SHA256 sha = SHA256.getInsatnce();
				String shaPass = sha.getSha256(orgPass.getBytes());
				String dbPass = dbuserVO.getUserPw();
				if (BCrypt.checkpw(shaPass, dbPass)) {
					userVO = dbuserVO;
					userVO.setUserPw("");
					session.setAttribute("userVO", userVO);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
