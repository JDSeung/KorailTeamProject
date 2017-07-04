package com.korail.client.notice.dao;

import java.util.List;
import java.util.Map;

import com.korail.client.notice.vo.NoticeVO;
import com.korail.client.paging.PagingComponent;

public interface NoticeDAO {
	/*도윤*/
	
	// 메인 페이지 공지사항 5개 리스트
	public List<NoticeVO> getNoticeList(Map<String, Object> noticeMap);
	// 글 상세보기
	//public NoticeVO noticeDetail(NoticeVO noticeVO);
	public int getNoticeTotal(PagingComponent paging);
	public NoticeVO noticeDetail(NoticeVO noticeVO);
	
}
