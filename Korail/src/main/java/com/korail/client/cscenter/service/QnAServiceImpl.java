package com.korail.client.cscenter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.korail.client.cscenter.dao.QnADAO;
import com.korail.client.cscenter.vo.QnAVO;
import com.korail.client.paging.PagingComponent;

@Service
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADAO qnaDAO;
	
	@Override
	/*QnA페이징 처리 값 가져오기*/
	public List<QnAVO> getQnAList(QnAVO qnaVO, PagingComponent pagingComponent) throws Exception {
		Map<String, Object> qnaMap = new HashMap<String, Object>();
		int totalContent = qnaDAO.getQnATotalCnt(pagingComponent);
		pagingComponent.setTotalContent(totalContent);
		qnaMap.put("qnaVO", qnaVO);
		qnaMap.put("pagingComponent", pagingComponent);
		return qnaDAO.getQnAList(qnaMap);
	}
	@Override
	/*게시물 조회*/
	public Map<String, QnAVO> getQnA(QnAVO qnaVO) throws Exception{
		Map<String, QnAVO> qnaMap = new HashMap<String, QnAVO>();
		QnAVO qnaReply = qnaDAO.getQnAReply(qnaVO);
		qnaVO = qnaDAO.getQnA(qnaVO);
		qnaMap.put("qnaReply", qnaReply);
		qnaMap.put("qnaVO", qnaVO);
		return qnaMap;
	}
	@Override
	/*게시물 삭제*/
	public int deleteQnA(QnAVO qnaVO) throws Exception{
		return qnaDAO.deleteQnA(qnaVO);
	}
	@Override
	/*게시물 작성*/
	public int qnaWrite(QnAVO qnaVO) throws Exception{
		return qnaDAO.qnaWrite(qnaVO);
	}
	@Override
	/*게시물 업데이트*/
	public int qnaUpdate(QnAVO qnaVO) throws Exception{
		return qnaDAO.qnaUpdate(qnaVO);
	}
}
