package com.korail.client.notice.service;

import java.util.List;

import com.korail.client.notice.vo.NoticeVO;
import com.korail.client.paging.PagingComponent;

public interface NoticeService {
	/*도윤*/
	/*공지사항 리스트 출력*/
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO, PagingComponent pagingComponent);
	/*공지사항 상세보기*/
	public NoticeVO noticeDetail(NoticeVO noticeVO);
	
}
