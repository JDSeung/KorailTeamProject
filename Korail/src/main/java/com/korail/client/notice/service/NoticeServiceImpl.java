package com.korail.client.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.korail.client.notice.dao.NoticeDAO;
import com.korail.client.notice.vo.NoticeVO;
import com.korail.client.paging.PagingComponent;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
	/*도윤*/

	Logger logger = Logger.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	/*@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) {
		List<NoticeVO> list = null;
		list = noticeDAO.getNoticeList(noticeVO);
		return list;
	}*/

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO, PagingComponent pagingComponent) {
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		int totalContent = noticeDAO.getNoticeTotal(pagingComponent);
		pagingComponent.setTotalContent(totalContent);
		noticeMap.put("pagingComponent",pagingComponent);
		noticeMap.put("noticeVO", noticeVO);
		List<NoticeVO> noticeList = noticeDAO.getNoticeList(noticeMap);
		return noticeList;
	}

	@Override
	public NoticeVO noticeDetail(NoticeVO noticeVO) {
		return noticeDAO.noticeDetail(noticeVO);
	}
	

	
}
