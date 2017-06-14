package com.korail.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.korail.admin.login.dao.AdminDAO;
import com.korail.admin.login.vo.AdminVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public AdminVO adminLogin(String adminId, String adminPw) {
		return adminDAO.adminLogin(adminId, adminPw);
	}

}
