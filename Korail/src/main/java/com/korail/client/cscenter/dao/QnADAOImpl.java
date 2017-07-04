package com.korail.client.cscenter.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.korail.client.cscenter.vo.QnAVO;
import com.korail.client.paging.PagingComponent;

@Repository
public class QnADAOImpl implements QnADAO {
	/*승열*/
	
	@Inject
	private SqlSession session;
	
	@Override
	/*게시물 페이징*/
	public List<QnAVO> getQnAList(Map<String, Object> qnaMap) throws Exception {
		return session.selectList("getQnAList", qnaMap);
	}

	@Override
	/*게시물 전체*/
	public int getQnATotalCnt(PagingComponent pagingComponent) throws Exception {
		return session.selectOne("getQnATotalCnt", pagingComponent);
	}
	@Override
	/*게시물 조회*/
	public QnAVO getQnA(QnAVO qnaVO) throws Exception{
		 session.selectOne("getQnA", qnaVO);
		 System.out.println(qnaVO.getUserNo());
		return session.selectOne("getQnA", qnaVO);
	}
	@Override
	/*게시물 답글조회*/
	public QnAVO getQnAReply(QnAVO qnaVO) throws Exception{
		return session.selectOne("getQnAReply", qnaVO);
	}
	@Override
	/*게시물 삭제*/
	public int deleteQnA(QnAVO qnaVO) throws Exception{
		return session.delete("deleteQnA", qnaVO);
	}
	
	@Override
	/*게시물 작성*/
	public int qnaWrite(QnAVO qnaVO) throws Exception{
		return session.insert("qnaWrite", qnaVO);
	}
	@Override
	/*게시물 업데이트*/
	public int qnaUpdate(QnAVO qnaVO) throws Exception{
		return session.update("qnaUpdate", qnaVO);
	}
}
