package com.korail.admin.cscenter.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.vo.FAQVO;

@Repository
public class FAQDAOImpl implements FAQDAO {

	@Inject
	private SqlSession session;

	public List<FAQVO> getFAQList(Map<String, Object> faqMap) throws Exception {

		return session.selectList("getadFAQList", faqMap);
	}

	public int getFAQTotalCnt(PagingComponent paging) throws Exception {

		return session.selectOne("getadFAQTotalCnt", paging);
	}

	// 글쓰기
	public int getFAQWrite(FAQVO faqVO) throws Exception {
		return session.insert("faqadWrite", faqVO);
	}

	// 상세 보기
	public FAQVO getFAQ(FAQVO faqVO) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("getadFAQ", faqVO);
	};

	// 게시물 삭제
	public int getFAQDelete(FAQVO faqVO) throws Exception {

		return session.delete("faqadDelete", faqVO);
	};

	// 게시물 수정
	public int getFAQUpdate(FAQVO faqVO) throws Exception {

		return session.update("faqadUpdate", faqVO);
	};
}
