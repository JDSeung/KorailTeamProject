package com.korail.client.cscenter.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korail.client.cscenter.vo.FAQVO;
import com.korail.client.paging.PagingComponent;

@Repository
public class FAQDAOImpl implements FAQDAO {
	
	@Autowired
	private SqlSession session;
	
	
	/*게시물 페이징*/
	@Override
	public List<FAQVO> getFAQList(Map<String, Object> faqMap) {
		return session.selectList("getFAQList", faqMap);
	}

	/*게시물 총 게시물 수*/

	@Override
	public int getFAQTotalCnt(PagingComponent paging)throws Exception{
		return session.selectOne("getFAQTotalCnt", paging);
	}
	
	/*글 상세보기*/
	@Override
	public FAQVO getFAQ(FAQVO faqVO) throws Exception{
		return session.selectOne("getFAQ", faqVO);
	}
}

