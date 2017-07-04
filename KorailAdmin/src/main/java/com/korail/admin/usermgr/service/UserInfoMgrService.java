package com.korail.admin.usermgr.service;

import java.util.List;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.usermgr.vo.UserVO;

public interface UserInfoMgrService {
	
	/*회원 정보*/
	public List<UserVO> getUserInfo(PagingComponent paging) throws Exception;
	
}
