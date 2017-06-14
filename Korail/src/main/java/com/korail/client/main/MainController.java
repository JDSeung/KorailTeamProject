package com.korail.client.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.korail.client.cscenter.service.FAQService;
import com.korail.client.cscenter.vo.FAQVO;
import com.korail.client.notice.service.NoticeService;
import com.korail.client.notice.vo.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	/*도윤*/
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FAQService faqService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(@ModelAttribute NoticeVO noticeVO, Model model) {
		List<NoticeVO> noticeList = noticeService.getNoticeList(noticeVO);
		List<FAQVO> faqList = faqService.getFAQList();
		model.addAttribute("getNoticeList", noticeList);
		model.addAttribute("getFAQList", faqList);
		
		return "index";
	}

}
