package com.korail.admin.login.dao;

import com.korail.admin.login.vo.AdminVO;

public interface AdminDAO {
	public AdminVO adminLogin(String adminId, String adminPw);
}
