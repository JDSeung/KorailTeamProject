package com.korail.admin.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.login.dao.AdminDAO;
import com.korail.admin.login.vo.AdminVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void loginCheck(AdminVO adminVO, HttpSession session) {
		/*로그인 확인*/
		adminVO = adminDAO.loginCheck(adminVO);
		/*DB에서 검색을 통해 데이터를 가져오고 검색한 데이터가 없을경우 Null*/
		if (adminVO!= null) {
			// 세션 등록
			/*비밀번호는 검사한 뒤 필요하지 않기 때문에 보안상 비밀번호를 지운다.*/
			adminVO.setAdminPw("");
			session.setAttribute("adminVO", adminVO);
		}
	}
}
