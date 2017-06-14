package com.korail.client.notice.dao;

import java.util.List;

import com.korail.client.notice.vo.NoticeVO;

public interface NoticeDAO {
	/*도윤*/
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO);
}
