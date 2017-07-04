package com.korail.admin.main.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.usermgr.dao.UserInfoDAO;

@Service
public class MainMgrServiceImpl implements MainMgrService {


	@Autowired
	private UserInfoDAO userDAO;

	@Override
	public Map<String, Object> getQnAandUser() throws Exception {
		Map<String, Object> allMap = new HashMap<String, Object>();

		int userTotal = userDAO.getUserTotal();
		int deleteTotal = userDAO.getUserDTotal();
		int newUser = userDAO.getNewUser();

		allMap.put("userTotal", userTotal);
		allMap.put("deleteTotal", deleteTotal);
		allMap.put("newUser", newUser);

		return allMap;
	}

}
