package com.korail.admin.noticeboardmgr.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.noticeboardmgr.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
	
	@Inject
	private SqlSession session;
	
	/*게시물 페이징*/
	public List<NoticeVO> getNoticeList(Map<String, Object> noticeMap) throws Exception{
		return session.selectList("getadNoticeList", noticeMap);
	}
	/* 총 게시물 */
	public int getNoticeTotalCnt(PagingComponent paging) throws Exception{
		return session.selectOne("getadNoticeTotalCnt", paging);
	}
	/* 글쓰기  */
	public int noticeWrite(NoticeVO noticeVO) throws Exception{
		return session.insert("noticeadWrite", noticeVO);
	}
	/* 글 상세보기 */
	public NoticeVO getNotice(NoticeVO noticeVO) throws Exception{
		return session.selectOne("getadNotice", noticeVO);
	}
	/* 글 삭제 */
	public int noticeDelete(NoticeVO noticeVO) throws Exception{
		return session.delete("noticeadDelete", noticeVO);
	}
	/* 글 수정 */
	public int noticeUpdate(NoticeVO noticeVO) throws Exception{
		return session.update("noticeadUpdate", noticeVO);
	}
}
