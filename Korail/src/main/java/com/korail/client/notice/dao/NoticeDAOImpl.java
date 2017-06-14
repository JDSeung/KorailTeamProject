package com.korail.client.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korail.client.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	/*도윤*/
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) {
		return session.selectList("getNoticeList");
	}
	
}
