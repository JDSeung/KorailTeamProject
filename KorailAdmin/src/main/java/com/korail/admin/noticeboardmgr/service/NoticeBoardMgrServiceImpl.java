package com.korail.admin.noticeboardmgr.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.noticeboardmgr.dao.NoticeDAO;
import com.korail.admin.noticeboardmgr.vo.NoticeVO;

@Service
public class NoticeBoardMgrServiceImpl implements NoticeBoardMgrService{
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	/*게시물 페이징*/
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO, PagingComponent paging) throws Exception{
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		int totalContent = noticeDAO.getNoticeTotalCnt(paging);
		paging.setTotalContent(totalContent);
		noticeMap.put("noticeVO", noticeVO);
		noticeMap.put("paging", paging);
		return noticeDAO.getNoticeList(noticeMap);
	}
	/* 글쓰기  */
	public int noticeWrite(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeWrite(noticeVO);
	}
	/* 글 상세보기 */
	public NoticeVO getNotice(NoticeVO noticeVO) throws Exception{
		return noticeDAO.getNotice(noticeVO);
	}
	/* 글 삭제 */
	public int noticeDelete(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeDelete(noticeVO);
	}
	/* 글 수정 */
	public int getNoticeUpdate(NoticeVO noticeVO) throws Exception{
		return noticeDAO.noticeUpdate(noticeVO);
	}
}
