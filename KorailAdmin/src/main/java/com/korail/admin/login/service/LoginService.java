package com.korail.admin.login.service;

import com.korail.admin.login.vo.AdminVO;

public interface LoginService {
	public AdminVO adminLogin(String adminId, String adminPw);
}
