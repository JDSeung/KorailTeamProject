package com.korail.admin.cscenter.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.vo.QnAVO;

@Repository
public class QnADAOImpl implements QnADAO {
	
	@Inject
	private SqlSession session;
	
	/*게시물 페이징*/
	public List<QnAVO> getQnAList(Map<String, Object> qnaMap)throws Exception{
		return session.selectList("getadQnAList", qnaMap);
	}
	
	/*게시물 총 게시물 수*/
	public int getQnATotalCnt(PagingComponent paging)throws Exception{
		return session.selectOne("getadQnATotalCnt", paging);
	}
	
	/*글쓰기 시 회원작성 게시물 출력*/
	public QnAVO getQnA(QnAVO qnaVO) throws Exception{
		return session.selectOne("getQnA", qnaVO);
	}
	
	/*답글 가져오기*/
	public QnAVO getQnAReply(QnAVO qnaVO) throws Exception{
		return session.selectOne("getQnAReply", qnaVO);
	}
	
	/*글쓰기*/
	public int qnaWrite(QnAVO qnaVO) throws Exception{
		qnaVO.getQnaAttachments();
		session.insert("qnaWrite", qnaVO);
		
		return session.update("updateUserQna",qnaVO);
	}
	
	/*글 삭제*/
	public int deleteQna(QnAVO qnaVO) throws Exception{
		return session.delete("deleteQna", qnaVO);
	}
	
	/*글 수정*/
	public int qnaUpdate(QnAVO qnaVO) throws Exception{
		return session.update("qnaadUpdate", qnaVO);
	}
}
