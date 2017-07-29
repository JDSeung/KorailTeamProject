package com.korail.admin.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.vo.QnAVO;
import com.korail.admin.main.service.MainMgrService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainMgrController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainMgrController.class);
	@Autowired
	private MainMgrService mgrService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/index")
	public String home(QnAVO qnaVO, Model model, PagingComponent paging) throws Exception {

		Map<String, Object> allMap = new HashMap<String, Object>();
		paging.setListSize(5);
		
		allMap = (Map<String, Object>) mgrService.getQnAandUser(qnaVO, paging);
		
		List<QnAVO> qnaList = (List<QnAVO>) allMap.get("qnaList");
		int userTotal = (Integer) allMap.get("userTotal");
		int deleteTotal = (Integer) allMap.get("deleteTotal");
		int newUser = (Integer) allMap.get("newUser");

		model.addAttribute("userTotal", userTotal);
		model.addAttribute("deleteTotal", deleteTotal);
		model.addAttribute("newUser", newUser);
		model.addAttribute("qnaList", qnaList);
		
		return "index";
	}
	@RequestMapping(value = "/company")
	public String compony() {
		return "/company/company";
	}
}
