package com.korail.batch.service;

public interface ResService {
	
	/*예약 정보 수정*/
	public void resChange() throws Exception;
	
	/*10이상 지연 예매 고객*/
	public void resCancle() throws Exception;
	
}
