package com.korail.admin.login.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korail.admin.login.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSession session;
	
	@Override
	public AdminVO adminLogin(String adminId, String adminPw) {
		AdminVO adminVO = new AdminVO();
		adminVO.setAdminId(adminId);
		adminVO.setAdminPw(adminPw);
		
		return null;
	}

}
