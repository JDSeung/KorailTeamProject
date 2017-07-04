package com.korail.admin.cscenter.dao;

import java.util.List;
import java.util.Map;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.vo.FAQVO;

public interface FAQDAO {

	// 게시물 페이징
	public List<FAQVO> getFAQList(Map<String, Object> faqMap) throws Exception;

	/* 전체 게시물수 */
	public int getFAQTotalCnt(PagingComponent paging) throws Exception;

	/* 게시물 조회 */
	public FAQVO getFAQ(FAQVO faqVO) throws Exception;

	// 글쓰기
	public int getFAQWrite(FAQVO faqVO) throws Exception;

	// 게시물 삭제
	public int getFAQDelete(FAQVO faqVO) throws Exception;

	// 게시물 수정
	public int getFAQUpdate(FAQVO faqVO) throws Exception;
}
