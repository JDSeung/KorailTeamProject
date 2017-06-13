package com.korail.client.cscenter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.korail.client.cscenter.dao.FAQDAO;
import com.korail.client.cscenter.vo.FAQVO;

@Service
@Transactional
public class FAQServiceImpl implements FAQService{
	/*슬기형*/
	/*도윤*/

	@Autowired
	private FAQDAO faqDAO;
	
	@Override
	public List<FAQVO> getFAQList() {
		List<FAQVO> list = null;
		list = faqDAO.getFAQList();
		return list;
	}
}
