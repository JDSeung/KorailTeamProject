package com.korail.client.cscenter.dao;

import java.util.List;
import java.util.Map;

import com.korail.client.cscenter.vo.QnAVO;
import com.korail.client.paging.PagingComponent;

public interface QnADAO {
	/*승열*/
	/*게시물 페이징*/
	public List<QnAVO> getQnAList(Map<String, Object> qnaMap) throws Exception;
	/*전체 게시물수*/
	public int getQnATotalCnt(PagingComponent pagingComponent) throws Exception;
	/*게시물 조회*/
	public QnAVO getQnA(QnAVO qnaVO) throws Exception;
	/*게시물 답글조회*/
	public QnAVO getQnAReply(QnAVO qnaVO) throws Exception;
	/*게시물 삭제*/
	public int deleteQnA(QnAVO qnaVO) throws Exception;
	/*게시물 작성*/
	public int qnaWrite(QnAVO qnaVO) throws Exception;
	/*게시물 업데이트*/
	public int qnaUpdate(QnAVO qnaVO) throws Exception;
	
}
