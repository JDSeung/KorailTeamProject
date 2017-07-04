package com.korail.client.cscenter.service;

import java.util.List;

import com.korail.client.cscenter.vo.FAQVO;
import com.korail.client.paging.PagingComponent;

public interface FAQService {
	
	/*게시물 페이징*/
	public List<FAQVO> getFAQList(FAQVO faqVO, PagingComponent paging)  throws Exception ;
	
	/*글쓰기 시 회원작성 게시물 출력*/
	public FAQVO getFAQ(FAQVO qnaVO) throws Exception;
}
