package com.korail.admin.usermgr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.usermgr.dao.UserInfoDAO;
import com.korail.admin.usermgr.vo.UserVO;

@Service
public class UserInfoMgrServiceImpl implements UserInfoMgrService{

	@Autowired
	private UserInfoDAO userInfoDAO;
	/*회원 정보*/
	public List<UserVO> getUserInfo(PagingComponent paging) throws Exception{
		int totalContent = userInfoDAO.getUserInfoTotalCnt(paging);
		paging.setTotalContent(totalContent);
		return userInfoDAO.getUserInfo(paging);
	}
}
