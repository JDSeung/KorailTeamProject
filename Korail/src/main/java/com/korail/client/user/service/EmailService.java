package com.korail.client.user.service;

import com.korail.client.user.vo.EmailVO;

public interface EmailService {
	/* 슬기형 */

	/*메일 보내기*/
	public void sendMail(EmailVO emailVO);
	
	/*이메일 중복체크*/
	public String getChkEmail(EmailVO emailVO);
	
	/*인증번호생성*/
	public void makeKey(EmailVO emailVO);
	
	/*ID 발송*/
	public void sendId(EmailVO emailVO);
}
