package com.korail.admin.login.service;

import javax.servlet.http.HttpSession;

import com.korail.admin.login.vo.AdminVO;

public interface LoginService {
	public void loginCheck(AdminVO adminVO, HttpSession session);
}
