package com.korail.client.cscenter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.korail.client.cscenter.dao.FAQDAO;
import com.korail.client.cscenter.vo.FAQVO;
import com.korail.client.paging.PagingComponent;

@Service
@Transactional
public class FAQServiceImpl implements FAQService{

	@Autowired
	private FAQDAO faqDAO;
	
	/*게시물 페이징*/
	@Override
	public List<FAQVO> getFAQList(FAQVO faqVO, PagingComponent paging) throws Exception {
		Map<String, Object> faqMap = new HashMap<String, Object>();
		int totalContent = faqDAO.getFAQTotalCnt(paging);
		paging.setTotalContent(totalContent);
		faqMap.put("faqVO", faqVO);
		faqMap.put("paging", paging);
		return faqDAO.getFAQList(faqMap);
	}
	
	/*글쓰기 시 회원작성 게시물 출력*/
	@Override
	public FAQVO getFAQ(FAQVO qnaVO) throws Exception{
		return faqDAO.getFAQ(qnaVO);
	}
}
