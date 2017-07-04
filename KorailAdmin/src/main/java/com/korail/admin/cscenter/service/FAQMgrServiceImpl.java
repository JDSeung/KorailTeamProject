package com.korail.admin.cscenter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.dao.FAQDAO;
import com.korail.admin.cscenter.vo.FAQVO;
import com.korail.admin.login.vo.AdminVO;

@Service
public class FAQMgrServiceImpl implements FAQMgrService {

	@Autowired
	private FAQDAO faqDAO;

	@Override
	public List<FAQVO> getFAQList(FAQVO faqVO, PagingComponent paging) throws Exception {
		Map<String, Object> faqMap = new HashMap<String, Object>();

		int totalContent = faqDAO.getFAQTotalCnt(paging);
		paging.setTotalContent(totalContent);

		faqMap.put("FAQVO", faqVO);
		faqMap.put("paging", paging);

		return faqDAO.getFAQList(faqMap);
	}

	// 글쓰기
	@Override
	public int getFAQWrite(FAQVO faqVO, HttpSession session) throws Exception {
		AdminVO admin = (AdminVO) session.getAttribute("adminVO");
		faqVO.setAdminNo(admin.getAdminNo());

		return faqDAO.getFAQWrite(faqVO);
	}

	// 게시물 조횐
	@Override
	public Map<String, FAQVO> getFAQ(FAQVO faqVO) throws Exception {
		Map<String, FAQVO> faqMap = new HashMap<String, FAQVO>();
		faqVO = faqDAO.getFAQ(faqVO);
		faqMap.put("faqVO", faqVO);
		return faqMap;
	}

	@Override
	public int getFAQDelete(FAQVO faqVO) throws Exception {

		int result = faqDAO.getFAQDelete(faqVO);

		return result;
	}

	@Override
	public int getFAQUpdate(FAQVO faqVO) throws Exception {
		int result = faqDAO.getFAQUpdate(faqVO);
		return result;
	}

}
