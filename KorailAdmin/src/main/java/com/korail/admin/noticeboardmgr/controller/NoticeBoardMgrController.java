package com.korail.admin.noticeboardmgr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.fileupload.FileUploadUtil;
import com.korail.admin.login.vo.AdminVO;
import com.korail.admin.noticeboardmgr.service.NoticeBoardMgrService;
import com.korail.admin.noticeboardmgr.vo.NoticeVO;

@Controller
@RequestMapping(value="/boardmgr/notice")
public class NoticeBoardMgrController {
	
	@Autowired
	private NoticeBoardMgrService noticeService;
	
	/* NOTICELIST 페이지 활성화 */
	@RequestMapping(value = "/")
	public ModelAndView notice(NoticeVO noticeVO, PagingComponent pagingComponent) throws Exception{
		ModelAndView noticeView = new ModelAndView();
		noticeView.addObject("paging", pagingComponent);
		noticeView.setViewName("boardmgr/notice/noticeList");
		return noticeView;
	}
	
	 @ResponseBody
	 @RequestMapping(value = "/list")
	 public Map<String, Object> noticeList(NoticeVO noticeVO, PagingComponent paging) throws Exception{
		Map<String, Object> noticeMap = new HashMap<String, Object>(); 
		List<NoticeVO> noticeList = noticeService.getNoticeList(noticeVO, paging);
	    noticeMap.put("noticeList", noticeList);
	    noticeMap.put("paging", paging);
	    return noticeMap;
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
	
	/* 글쓰기 화면 */
	@RequestMapping(value="/noticewrite")
	public String noticeWrite(PagingComponent paging, Model model) throws Exception{
		model.addAttribute("paging", paging);
		return "boardmgr/notice/noticeWrite";
	}
	
	/* 글쓰기 */
	@ResponseBody
	@RequestMapping(value="/write")
	public int write(NoticeVO noticeVO, HttpSession session, HttpServletRequest request)throws Exception{
		if(noticeVO.getFile() != null){
	         String fileName = FileUploadUtil.fileUpload(noticeVO.getFile(), request);
	         noticeVO.setNoticeAttachments(fileName);
	      }
		AdminVO admin = (AdminVO) session.getAttribute("adminVO");
		noticeVO.setAdminName("관리자");
		noticeVO.setAdminNO(admin.getAdminNo());
		return noticeService.noticeWrite(noticeVO);
	}
	
	/* 글 상세보기 */
	@RequestMapping(value="/noticedetail")
	public ModelAndView noticeDetail(NoticeVO noticeVO, PagingComponent paging) throws Exception{
		ModelAndView model = new ModelAndView();
		noticeVO = noticeService.getNotice(noticeVO);
		model.addObject("noticeVO", noticeVO);
		model.addObject("paging", paging);
		model.setViewName("boardmgr/notice/noticeDetail");
		return model;
	}
	/* 글 삭제 */
	@ResponseBody
	@RequestMapping(value="/delete")
	public int noticeDelete(NoticeVO noticeVO) throws Exception{
		int result = noticeService.noticeDelete(noticeVO);
		return result;
	}
	
	
	
}
