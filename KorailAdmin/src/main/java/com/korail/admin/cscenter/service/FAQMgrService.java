package com.korail.admin.cscenter.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.vo.FAQVO;

public interface FAQMgrService {

	public List<FAQVO> getFAQList(FAQVO faqVO, PagingComponent paging) throws Exception;

	// 글쓰끼
	public int getFAQWrite(FAQVO faqVO, HttpSession session) throws Exception;

	// 상세 보기
	public Map<String, FAQVO> getFAQ(FAQVO faqVO) throws Exception;

	// 게시물 삭제
	public int getFAQDelete(FAQVO faqVO) throws Exception;

	// 게시물 수정
	public int getFAQUpdate(FAQVO faqVO) throws Exception;

}
