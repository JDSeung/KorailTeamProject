
package com.korail.client.cscenter.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.korail.client.cscenter.service.QnAService;
import com.korail.client.cscenter.vo.QnAVO;
import com.korail.client.fileupload.FileUploadUtil;
import com.korail.client.paging.PagingComponent;
import com.korail.client.user.vo.UserVO;

@Controller
@RequestMapping(value ="/qnaboard")
public class QnABoardController {

	@Autowired
	private QnAService qnaService;
	/*QnA페이지*/
	@RequestMapping(value = "/")
	public ModelAndView qna(QnAVO qnaVO, PagingComponent pagingComponent) throws Exception{
		ModelAndView qnaView = new ModelAndView();
		qnaView.addObject("paging", pagingComponent);
		qnaView.setViewName("qnaboard/qnaList");
		return qnaView;
	}
	
	/*ajax통신을 통한 페이징 처리*/
	@ResponseBody
	@RequestMapping(value = "/list")
	public Map<String, Object> qnaList(QnAVO qnaVO, PagingComponent pagingComponent) throws Exception{
		Map<String, Object> mapList = new HashMap<String, Object>();
		List<QnAVO>  qnaList = qnaService.getQnAList(qnaVO, pagingComponent);
		mapList.put("qnaList", qnaList);
		mapList.put("paging", pagingComponent);
		return mapList;
	}
	
	/*글 상세보기 답글도 가져옴*/
	@RequestMapping(value = "/qnadetail")
	public String detail(QnAVO qnaVO, PagingComponent pagingComponent, HttpSession session,RedirectAttributes redirectAttributes, Model qnaView) throws Exception{
		Map<String, QnAVO> qnaMap = new HashMap<String, QnAVO>();
		String viewName = "";
		if(session.getAttribute("userVO") != null){
			UserVO userVO = (UserVO) session.getAttribute("userVO");
			qnaVO.setUserNo(userVO.getUserNo());
		}
		if(qnaVO.getUserNo() == null && qnaVO.getIspublic().equals("1")){
			redirectAttributes.addFlashAttribute("tpublic", false);
			return "redirect:/qnaboard/";
		}
		qnaMap=qnaService.getQnA(qnaVO);
		qnaVO = qnaMap.get("qnaVO");
		QnAVO qnaReply = qnaMap.get("qnaReply");
		qnaView.addAttribute("qnaReply", qnaReply);
		qnaView.addAttribute("paging", pagingComponent);
		qnaView.addAttribute("qnaVO", qnaVO);
		if(qnaVO != null){
			viewName ="/qnaboard/qnaDetail";
		}else{
			
			redirectAttributes.addFlashAttribute("tpublic", false);
			return "redirect:/qnaboard/";
		}
		return viewName;
	}
	
	/*상세보기에서 수정버튼 클릭시*/
	@RequestMapping(value = "/qnaedit")
	public ModelAndView qnaedit(QnAVO qnaVO, PagingComponent pagingComponent, HttpSession session) throws Exception{
		ModelAndView qnaView = new ModelAndView();
		Map<String, QnAVO> qnaMap = new HashMap<String, QnAVO>();
		qnaMap=qnaService.getQnA(qnaVO);
		if(session.getAttribute("userVO") != null){
			UserVO user = (UserVO) session.getAttribute("userVO");
			qnaVO.setUserNo(user.getUserNo());
		}
		qnaVO = qnaMap.get("qnaVO");
		qnaView.addObject("qnaVO", qnaVO);
		qnaView.addObject("paging", pagingComponent);
		qnaView.setViewName("qnaboard/qnaEdit");
		return qnaView;
	}
	/*수정버튼 클릭시*/
	@RequestMapping(value = "/edit")
	public String edit(QnAVO qnaVO, PagingComponent pagingComponent, HttpSession session, HttpServletRequest request) throws Exception{
		Map<String, QnAVO> qnaMap = new HashMap<String, QnAVO>();
		if(!qnaVO.getFile().isEmpty()){
			FileUploadUtil.fileDelete(qnaVO.getQnaAttachments(), request);
			String fileName = FileUploadUtil.fileUpload(qnaVO.getFile(), request);
			qnaVO.setQnaAttachments(fileName);
		}else{
			qnaVO.setQnaAttachments("");
		}
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		qnaVO.setUserNo(userVO.getUserNo());
		qnaVO.setQnaWriter(userVO.getUserName());
		qnaVO.setUserNo(userVO.getUserNo());
		int result =qnaService.qnaUpdate(qnaVO);
		String url = "";
		if(result ==1){
			url = "/qnaboard/?curruntPage="+pagingComponent.getCurruntPage()+"&totalPage="+pagingComponent.getTotalPage()+"&ispublic=0&qnaNo=0";
		}
		qnaVO = qnaMap.get("qnaVO");
		return "redirect:"+url;
	}
	/*글쓰기 버튼 클릭시*/
	@RequestMapping(value = "/qnawrite")
	public String qnawrite(QnAVO qnaVO, HttpSession session) throws Exception{
		session.setAttribute("CSRF_TOKEN",	UUID.randomUUID().toString());
		return "qnaboard/qnaWrite";
	}
	
	/*글쓰기에서 작성 버튼 클릭시*/
	@ResponseBody
	@RequestMapping(value = "/qnawrite/write")
	public int write(QnAVO qnaVO, HttpServletRequest request, HttpSession session) throws Exception{
		String fileName = FileUploadUtil.fileUpload(qnaVO.getFile(), request);
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		qnaVO.setUserNo(userVO.getUserNo());
		qnaVO.setQnaWriter(userVO.getUserName());
		qnaVO.setQnaAttachments(fileName);
		return qnaService.qnaWrite(qnaVO);
	}
	/*게시물 삭제*/
	@ResponseBody
	@RequestMapping(value = "/qnadelete")
	public int deleteQnA(QnAVO qnaVO, PagingComponent pagingComponent, HttpSession session, Model qna, HttpServletRequest request) throws Exception{
		if(session.getAttribute("userVO") != null){
			UserVO user = (UserVO) session.getAttribute("userVO");
			qnaVO.setUserNo(user.getUserNo());
		}
		FileUploadUtil.fileDelete(qnaVO.getQnaAttachments(), request);
		int result = qnaService.deleteQnA(qnaVO);
		qna.addAttribute("qnaVO", qnaVO);
		qna.addAttribute("paging", pagingComponent);
		return result;
	}
	/*게시물 검색*/
	@ResponseBody
	@RequestMapping(value = "/searchData")
	public Map<String, Object> searchData(QnAVO qnaVO, PagingComponent pagingComponent) throws Exception{
		Map<String, Object> mapList = new HashMap<String, Object>();
		List<QnAVO>  qnaList = qnaService.getQnAList(qnaVO, pagingComponent);
		mapList.put("qnaList", qnaList);
		mapList.put("paging", pagingComponent);
		return mapList;
	}
    
}
