package com.korail.admin.cscenter.controller;

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
import com.korail.admin.cscenter.service.QnAMgrService;
import com.korail.admin.cscenter.vo.QnAVO;
import com.korail.admin.fileupload.FileUploadUtil;
import com.korail.admin.login.vo.AdminVO;

@Controller
@RequestMapping(value = "/boardmgr/qna")
public class QnABoardMgrController {
	
	@Autowired
	private QnAMgrService qnaService;
	
	/*QnA페이지 활성화*/
	@RequestMapping(value = "/")
	public ModelAndView qna(QnAVO qnaVO, PagingComponent pagingComponent) throws Exception{
		ModelAndView qnaView = new ModelAndView();
		qnaView.addObject("paging", pagingComponent);
		qnaView.setViewName("boardmgr/qna/qnaList");
		return qnaView;
	}
	
	/*Ajax통신 페이징 처리*/
	@ResponseBody
	@RequestMapping(value = "/list")
	public Map<String, Object> qnaList(QnAVO qnaVO, PagingComponent paging) throws Exception{
		Map<String, Object> qnaMap = new HashMap<String, Object>();
		List<QnAVO> qnaList = qnaService.getQnAList(qnaVO, paging);
		qnaMap.put("qnaList", qnaList);
		qnaMap.put("paging", paging);
		return qnaMap;
	}
	
	/*게시물 검색*/
	@ResponseBody
	@RequestMapping(value = "/searchData")
	public Map<String, Object> searchData(QnAVO qnaVO, PagingComponent paging) throws Exception{
		Map<String, Object> qnaMap = new HashMap<String, Object>();
		List<QnAVO>  qnaList = qnaService.getQnAList(qnaVO, paging);
		qnaMap.put("qnaList", qnaList);
		qnaMap.put("paging", paging);
		return qnaMap;
	}
	
	/*글쓰기 화면 활성화*/
	@RequestMapping(value = "/qnawrite")
	public String qnaWrite(PagingComponent paging, Model model, QnAVO qnaVO) throws Exception{
		qnaVO = qnaService.getQnA(qnaVO);
		model.addAttribute("qnaVO", qnaVO);
		model.addAttribute("paging", paging);
		return "boardmgr/qna/qnaWrite";
	}
	
	/*글쓰기*/
	@ResponseBody
	@RequestMapping(value = "/write")
	public int write(QnAVO qnaVO, HttpSession session, HttpServletRequest request) throws Exception{
		if(qnaVO.getFile() != null){
			String fileName = FileUploadUtil.fileUpload(qnaVO.getFile(), request);
			qnaVO.setQnaAttachments(fileName);
		}
		AdminVO admin = (AdminVO) session.getAttribute("adminVO");
		qnaVO.setQnaWriter("관리자");
		qnaVO.setAdminNo(admin.getAdminNo());
		return qnaService.qnaWrite(qnaVO);
	}
	
	/*글 상세보기 페이지*/
	@RequestMapping(value = "/qnadetail")
	public String qnadetail(QnAVO qnaVO, PagingComponent paging, Model model) throws Exception{
		Map<String, QnAVO> qnaMap = new HashMap<String, QnAVO>();
		qnaMap = qnaService.getQnAReply(qnaVO);
		qnaVO = qnaMap.get("qnaVO");
		QnAVO qnaReply = qnaMap.get("qnaReply");
		model.addAttribute("qnaVO", qnaVO);
		model.addAttribute("qnaReply", qnaReply);		
		model.addAttribute("paging", paging);		
		return "boardmgr/qna/qnaDetail";
	}
	
	/*글 삭제*/
	@ResponseBody
	@RequestMapping(value = "/delete")
	public int deleteQna(QnAVO qnaVO, Model model) throws Exception{
		int result = qnaService.deleteQna(qnaVO);
		return result;
	}
	
	/*글 수정 화면 출력*/
	@RequestMapping(value = "/qnaEdit")
	public String qnaEdit(QnAVO qnaVO, PagingComponent paging, Model model, HttpSession session) throws Exception{
		Map<String, QnAVO> qnaMap = new HashMap<String, QnAVO>();
		qnaMap = qnaService.getQnAReply(qnaVO);
		qnaVO = qnaMap.get("qnaVO");
		QnAVO qnaReply = qnaMap.get("qnaReply");
		model.addAttribute("qnaVO", qnaVO);
		session.setAttribute("qnaVO", qnaReply);		
		model.addAttribute("paging", paging);
		model.addAttribute("qnaReply", qnaReply);	
		return "boardmgr/qna/qnaEdit";
	}
	/*글 수정 화면 출력*/
	@ResponseBody
	@RequestMapping(value = "/edit")
	public int edit(QnAVO qnaVO, HttpSession session, HttpServletRequest request) throws Exception{
		if(qnaVO.getFile() != null){
			String fileName = FileUploadUtil.fileUpload(qnaVO.getFile(), request);
			qnaVO.setQnaAttachments(fileName);
		}
		AdminVO admin = (AdminVO) session.getAttribute("adminVO");
		QnAVO qna = (QnAVO) session.getAttribute("qnaVO");
		qnaVO.setQnaWriter("관리자");
		qnaVO.setAdminNo(admin.getAdminNo());
		qnaVO.setPostNo(qna.getQnaNo());
		return qnaService.qnaUpdate(qnaVO);
	}
}






















