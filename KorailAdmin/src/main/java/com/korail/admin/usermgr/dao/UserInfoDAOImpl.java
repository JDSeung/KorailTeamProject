package com.korail.admin.usermgr.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.usermgr.vo.UserVO;

@Repository
public class UserInfoDAOImpl  implements UserInfoDAO{

	@Inject
	private SqlSession session;
	private String namespace = "com.korail.admin.usermgr.dao.UserInfoDAO";
	
	/*회원정보*/
	@Override
	public List<UserVO> getUserInfo(PagingComponent paging) throws Exception{
		return session.selectList("getUserInfo", paging);
	}
	/*회원 수 조회*/
	@Override
	public int getUserInfoTotalCnt(PagingComponent paging) throws Exception{
		return session.selectOne("getUserInfoTotalCnt", paging);
	}
	
	/*총 회원 수 탈퇴회원 제외*/
	@Override
	public int getUserTotal() throws Exception {

		return session.selectOne(namespace + ".getUserTotal");
	}

	/*탈퇴 회원 수*/
	@Override
	public int getUserDTotal() throws Exception {

		return session.selectOne(namespace + ".getUserDTotal");
	}

	/*신규회원 수*/
	@Override
	public int getNewUser() throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getNewUser");
	}

}
