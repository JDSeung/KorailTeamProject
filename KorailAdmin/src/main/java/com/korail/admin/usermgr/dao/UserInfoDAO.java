package com.korail.admin.usermgr.dao;

import java.util.List;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.usermgr.vo.UserVO;

public interface UserInfoDAO {
	
	/*회원 정보*/
	public List<UserVO> getUserInfo(PagingComponent paging) throws Exception;
	
	/*회원 수 조회*/
	public int getUserInfoTotalCnt(PagingComponent paging) throws Exception;
	
	/*총 회원 수 탈퇴회원 제외*/
	public int getUserTotal() throws Exception;
	
	/*탈퇴 회원 수*/
	public int getUserDTotal() throws Exception;

	/*신규회원 수*/
	public int getNewUser() throws Exception;
}
