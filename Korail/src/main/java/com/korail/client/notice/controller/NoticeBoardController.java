package com.korail.client.notice.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.korail.client.notice.service.NoticeService;
import com.korail.client.notice.vo.NoticeVO;

@Controller
@RequestMapping(value="/noticeboard")
public class NoticeBoardController {
	/*도윤*/
	Logger logger = Logger.getLogger(NoticeBoardController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	// 글 목록
	@RequestMapping(value="/noticelist", method=RequestMethod.GET)
	public String noticeList(@ModelAttribute NoticeVO noticeVO, Model model){
		logger.info("noticeList 호출 성공");
		
		List<NoticeVO> getNoticeList = noticeService.getNoticeList(noticeVO);
		model.addAttribute("getNoticeList", getNoticeList);
		
		return "/noticelist";
	}
}
