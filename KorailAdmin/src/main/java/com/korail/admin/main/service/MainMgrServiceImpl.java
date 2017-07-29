package com.korail.admin.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.dao.QnADAO;
import com.korail.admin.cscenter.vo.QnAVO;
import com.korail.admin.usermgr.dao.UserInfoDAO;

@Service
public class MainMgrServiceImpl implements MainMgrService {


	@Autowired
	private UserInfoDAO userDAO;
	
	@Autowired
	private QnADAO qnaDAO;

	
	@Override
	public Map<String, Object> getQnAandUser(QnAVO qnaVO, PagingComponent paging) throws Exception {
		Map<String, Object> allMap = new HashMap<String, Object>();

		int userTotal = userDAO.getUserTotal();
		int deleteTotal = userDAO.getUserDTotal();
		int newUser = userDAO.getNewUser();
		paging.setKeyWord(" ");
		paging.setKeyWordType("main");
		int totalContent = qnaDAO.getQnATotalCnt(paging);
		paging.setTotalContent(totalContent);
		allMap.put("paging", paging);
		allMap.put("qnaVO", qnaVO);

		List<QnAVO> qnaList = qnaDAO.getQnAList(allMap);
		
		allMap.put("qnaList", qnaList);
		allMap.put("userTotal", userTotal);
		allMap.put("deleteTotal", deleteTotal);
		allMap.put("newUser", newUser);


		return allMap;
	}

}
