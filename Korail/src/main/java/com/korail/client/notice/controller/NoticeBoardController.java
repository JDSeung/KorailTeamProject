package com.korail.client.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.korail.client.notice.service.NoticeService;
import com.korail.client.notice.vo.NoticeVO;
import com.korail.client.paging.PagingComponent;

@Controller
@RequestMapping(value="/noticeboard")
public class NoticeBoardController {
	/*도윤*/
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/")
	public ModelAndView notice(NoticeVO noticeVO, PagingComponent pagingComponent){
		ModelAndView noticeView = new ModelAndView();
		noticeView.addObject("paging", pagingComponent);
		noticeView.setViewName("noticeboard/noticeList");
		return noticeView;
	}
	
	// 글 목록
	@ResponseBody
	@RequestMapping(value="/list")
	public Map<String, Object> noticeList(NoticeVO noticeVO, PagingComponent pagingComponent){
		/*ModelAndView notice = new ModelAndView();
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
		PagingComponent pagingComponent = new PagingComponent();
		noticeList = noticeService.getNoticeList(noticeVO, pagingComponent);
		notice.addObject("noticeList", noticeList);
		notice.addObject("paging", pagingComponent);
		notice.setViewName("/noticeboard/noticeList");
		return notice;*/
		
		/*ModelAndView notice = new ModelAndView();
		Map<String, Object> mapList = new HashMap<String, Object>();
		PagingComponent pagingComponent = new PagingComponent();
		List<NoticeVO> noticeList = noticeService.getNoticeList(noticeVO, pagingComponent);
		System.out.println(pagingComponent.getTotalPage());
		mapList.put("noticeList", noticeList);
		mapList.put("paging", pagingComponent);
		notice.addObject("mapList", mapList);
		notice.setViewName("/noticeboard/noticeList");
		return notice;*/
		
		Map<String, Object> mapList = new HashMap<String, Object>();
		List<NoticeVO> noticeList = noticeService.getNoticeList(noticeVO, pagingComponent);
		mapList.put("noticeList", noticeList);
		mapList.put("paging", pagingComponent);
		return mapList;
		
	}
	
	// 글 상세보기
	/* pagingComponent는 서비스쪽에서 넘겨 받을 필요가 없으므로 vo만 넘겨받음 */
	@RequestMapping(value="/noticedetail")
	public ModelAndView detail(NoticeVO noticeVO, PagingComponent pagingComponent, HttpServletRequest request){
		ModelAndView noticeView = new ModelAndView();
		noticeVO = noticeService.noticeDetail(noticeVO);
		noticeView.addObject("noticeVO", noticeVO);
		noticeView.addObject("paging", pagingComponent);
		noticeView.setViewName("noticeboard/noticeDetail");
		return noticeView;
		
	}
	/*게시물 검색*/
	@ResponseBody
	@RequestMapping(value = "/searchData")
	public Map<String, Object> searchData(NoticeVO noticeVO, PagingComponent paging) throws Exception{
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		List<NoticeVO>  noticeList = noticeService.getNoticeList(noticeVO, paging);
		noticeMap.put("noticeList", noticeList);
		noticeMap.put("paging", paging);
		return noticeMap;
	}
}
