package com.korail.client.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.korail.client.paging.PagingComponent;

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
	public String home(@ModelAttribute NoticeVO noticeVO, FAQVO faqVO, Model model, HttpServletRequest request) throws Exception {
		logger.info("home 실행");
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		List<NoticeVO> noticeEventList = new ArrayList<NoticeVO>();
		PagingComponent pagingComponent = new PagingComponent();
		pagingComponent.setListSize(5);
		noticeList = noticeService.getNoticeList(noticeVO, pagingComponent);
		logger.info("noticeList : " + noticeList.toString());
		noticeVO.setNoticeEtc("1");
		noticeEventList = noticeService.getNoticeList(noticeVO, pagingComponent);
		List<FAQVO> faqList = faqService.getFAQList(faqVO, pagingComponent);
		logger.info("faqList : " + faqList.toString());
		model.addAttribute("noticeEventList", noticeEventList);
		model.addAttribute("getNoticeList", noticeList);
		model.addAttribute("getFAQList", faqList);
		
		return "index";
	}
	@RequestMapping("**/favicon.ico")
    public String favicon() {
        return "forward:/resources/img/fav.ico";
    }
	@RequestMapping(value = "/company")
	public String compony() {
		return "/company/company";
	}
}
