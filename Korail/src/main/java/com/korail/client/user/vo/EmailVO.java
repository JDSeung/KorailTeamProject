package com.korail.client.user.vo;

import javax.mail.Address;

public class EmailVO {
	/* 슬기형 */
	private Address from;// 보내는 메일주소
	private String authNum; // 난수값
	private String userEmail;// 받는 메일주소
	private String text; // 내용
	private String subject;// 제목

	public Address getFrom() {
		return from;
	}

	public void setFrom(Address from) {
		this.from = from;
	}

	public String getAuthNum() {
		return authNum;
	}

	public void setAuthNum(String authNum) {
		this.authNum = authNum;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

}
