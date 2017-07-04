package com.korail.client.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korail.client.notice.vo.NoticeVO;
import com.korail.client.paging.PagingComponent;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	/*도윤*/
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<NoticeVO> getNoticeList(Map<String, Object> noticeMap) {
		Object p = noticeMap.get("pagingComponent");
		PagingComponent po = (PagingComponent) p;
		return session.selectList("getNoticeList", noticeMap);
	}

	@Override
	public int getNoticeTotal(PagingComponent paging) {
		return session.selectOne("getNoticeTotal", paging);
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO noticeVO) {
		return session.selectOne("noticeDetail", noticeVO);
	}
}
