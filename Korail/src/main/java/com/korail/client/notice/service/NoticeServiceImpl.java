package com.korail.client.notice.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.korail.client.notice.dao.NoticeDAO;
import com.korail.client.notice.vo.NoticeVO;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{
	/*도윤*/

	Logger logger = Logger.getLogger(NoticeServiceImpl.class);
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) {
		List<NoticeVO> list = null;
		list = noticeDAO.getNoticeList(noticeVO);
		return list;
	}
}
