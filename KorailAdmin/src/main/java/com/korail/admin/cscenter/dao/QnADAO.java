package com.korail.admin.cscenter.dao;

import java.util.List;
import java.util.Map;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.vo.QnAVO;

public interface QnADAO {
	
	/*게시물 페이징*/
	public List<QnAVO> getQnAList(Map<String, Object> qnaMap)throws Exception;

	/*게시물 총 게시물 수*/
	public int getQnATotalCnt(PagingComponent paging)throws Exception;
	
	/*글쓰기 시 회원이 적은 항목 가져오기*/
	public QnAVO getQnA(QnAVO qnaVO) throws Exception;
	
	/*답글 가져오기*/
	public QnAVO getQnAReply(QnAVO qnaVO) throws Exception;
	
	/*글쓰기*/
	public int qnaWrite(QnAVO qnaVO) throws Exception;
	
	/*글 삭제*/
	public int deleteQna(QnAVO qnaVO) throws Exception;
	
	/*글 수정*/
	public int qnaUpdate(QnAVO qnaVO) throws Exception;
}
