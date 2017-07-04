package com.korail.admin.cscenter.service;

import java.util.List;
import java.util.Map;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.vo.QnAVO;

public interface QnAMgrService {
	
	/*게시물 페이징*/
	public List<QnAVO> getQnAList(QnAVO qnaVO, PagingComponent paging)throws Exception;
	
	/*글쓰기 시 회원작성 게시물 출력*/
	public QnAVO getQnA(QnAVO qnaVO) throws Exception;
	
	/*답글 가져오기*/
	public Map<String, QnAVO> getQnAReply(QnAVO qnaVO) throws Exception;

	/*글쓰기*/
	public int qnaWrite(QnAVO qnaVO) throws Exception;
	
	/*글 삭제*/
	public int deleteQna(QnAVO qnaVO) throws Exception;
	
	/*글 수정*/
	public int qnaUpdate(QnAVO qnaVO) throws Exception;
}
