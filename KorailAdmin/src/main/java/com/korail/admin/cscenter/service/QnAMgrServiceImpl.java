package com.korail.admin.cscenter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.dao.QnADAO;
import com.korail.admin.cscenter.vo.QnAVO;
import com.korail.admin.main.controller.MainMgrController;

@Service
public class QnAMgrServiceImpl implements QnAMgrService{
	
	@Autowired
	private QnADAO qnaDAO;
	private static final Logger logger = LoggerFactory.getLogger(MainMgrController.class);
	/*게시물 페이징*/
	@Override
	public List<QnAVO> getQnAList(QnAVO qnaVO, PagingComponent paging)throws Exception{
		Map<String, Object> qnaMap = new HashMap<String, Object>();
		int totalContent = qnaDAO.getQnATotalCnt(paging);
		paging.setTotalContent(totalContent);
		qnaMap.put("qnaVO", qnaVO);
		qnaMap.put("paging", paging);
		return qnaDAO.getQnAList(qnaMap);
	}
	
	/*글쓰기 시 회원작성 게시물 출력*/
	@Override
	public QnAVO getQnA(QnAVO qnaVO) throws Exception{
		return qnaDAO.getQnA(qnaVO);
	}
	
	/*답글 가져오기*/
	public Map<String, QnAVO> getQnAReply(QnAVO qnaVO) throws Exception{
		Map<String, QnAVO> qnaMap = new HashMap<String, QnAVO>();
		qnaVO = qnaDAO.getQnA(qnaVO);
		qnaMap.put("qnaVO", qnaVO);
		QnAVO qnaReply = qnaDAO.getQnAReply(qnaVO);
		qnaMap.put("qnaReply", qnaReply);
		return qnaMap;
	}
	
	/*글쓰기*/
	public int qnaWrite(QnAVO qnaVO) throws Exception{
		logger.info("qnaWrite 실행");
		logger.info(qnaVO.getQnaNo() + "");
		return qnaDAO.qnaWrite(qnaVO);
	}
	
	/*글 삭제*/
	public int deleteQna(QnAVO qnaVO) throws Exception{
		return qnaDAO.deleteQna(qnaVO);
	}
	
	/*글 수정*/
	public int qnaUpdate(QnAVO qnaVO) throws Exception{
		return qnaDAO.qnaUpdate(qnaVO);
	}

}
