package com.korail.client.cscenter.dao;

import java.util.List;
import java.util.Map;

import com.korail.client.cscenter.vo.FAQVO;
import com.korail.client.paging.PagingComponent;

public interface FAQDAO {
	
	/*게시물 페이징*/
	public List<FAQVO> getFAQList(Map<String, Object> faqMap);
	
	/*게시물 총 게시물 수*/
	public int getFAQTotalCnt(PagingComponent paging)throws Exception;
	
	/*글 상세보기*/
	public FAQVO getFAQ(FAQVO faqVO) throws Exception;
}
