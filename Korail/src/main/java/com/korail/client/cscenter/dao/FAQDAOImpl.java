package com.korail.client.cscenter.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.korail.client.cscenter.vo.FAQVO;

@Repository
public class FAQDAOImpl implements FAQDAO {
	/*슬기형*/
	/*도윤*/
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<FAQVO> getFAQList() {
		return session.selectList("getFAQList");
	}
}
