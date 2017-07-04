package com.korail.client.cscenter.service;

import java.util.List;
import java.util.Map;

import com.korail.client.cscenter.vo.QnAVO;
import com.korail.client.paging.PagingComponent;

public interface QnAService {
	/*승열*/
	
	/*QnA리스트 가져오기*/
	public List<QnAVO> getQnAList(QnAVO qnAVO, PagingComponent pagingComponent) throws Exception;
	/*게시물 상세보기 조회*/
	public Map<String, QnAVO> getQnA(QnAVO qnaVO) throws Exception;
	/*게시물 삭제*/
	public int deleteQnA(QnAVO qnaVO) throws Exception;
	/*게시물 작성*/
	public int qnaWrite(QnAVO qnaVO) throws Exception;
	/*게시물 업데이트*/
	public int qnaUpdate(QnAVO qnaVO) throws Exception;
}
