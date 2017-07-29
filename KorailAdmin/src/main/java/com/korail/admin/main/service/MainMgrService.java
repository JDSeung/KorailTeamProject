package com.korail.admin.main.service;

import java.util.Map;

import com.korail.admin.Paging.PagingComponent;
import com.korail.admin.cscenter.vo.QnAVO;

public interface MainMgrService {
	
	/*메인 화면 출력*/
	public Map<String, Object> getQnAandUser(QnAVO qnaVO, PagingComponent paging) throws Exception;

}
