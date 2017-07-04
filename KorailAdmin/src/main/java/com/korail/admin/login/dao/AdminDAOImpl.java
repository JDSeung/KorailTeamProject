package com.korail.admin.login.dao;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korail.admin.login.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Inject
	private SqlSession session;

	@Override
	public AdminVO loginCheck(AdminVO adminVO) {
		return session.selectOne("loginCheck", adminVO);
	}

}
