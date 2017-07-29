package com.korail.admin.noticeboardmgr.service;

import java.util.List;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.noticeboardmgr.vo.NoticeVO;

public interface NoticeBoardMgrService {
	/*게시물 페이징*/
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO, PagingComponent paging) throws Exception;
	/* 글쓰기 */
	public int noticeWrite(NoticeVO noticeVO) throws Exception;
	/* 글 상세보기 */
	public NoticeVO getNotice(NoticeVO noticeVO) throws Exception;
	/* 글 삭제 */
	public int noticeDelete(NoticeVO noticeVO) throws Exception;
	/* 글 수정 */
	public int getNoticeUpdate(NoticeVO noticeVO) throws Exception;
	
}
