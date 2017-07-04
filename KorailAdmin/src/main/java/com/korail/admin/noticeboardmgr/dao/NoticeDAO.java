package com.korail.admin.noticeboardmgr.dao;

import java.util.List;
import java.util.Map;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.noticeboardmgr.vo.NoticeVO;

public interface NoticeDAO {
	/*게시물 페이징*/
	public List<NoticeVO> getNoticeList(Map<String, Object> noticeMap) throws Exception;
	/* 총 게시물 */
	public int getNoticeTotalCnt(PagingComponent paging) throws Exception;
	/* 글쓰기  */
	public int noticeWrite(NoticeVO noticeVO) throws Exception;
	/* 글 상세보기 */
	public NoticeVO getNotice(NoticeVO noticeVO) throws Exception;
	/* 글 삭제 */
	public int noticeDelete(NoticeVO noticeVO) throws Exception;
	/* 글 수정 */
	public int noticeUpdate(NoticeVO noticeVO) throws Exception;
}
