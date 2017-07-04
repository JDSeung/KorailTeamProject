package com.korail.admin.cscenter.vo;

public class FAQVO {
	/* 슬기형 */
	/* 도윤 */
	private int faqNo; // 글번호
	private String adminNo; // 사원번호
	private String adminName; // 사원명
	private String faqTitle; // 글제목
	private String faqContent; // 글내용
	private String faqRegDate; // 작성일

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqRegDate() {
		return faqRegDate;
	}

	public void setFaqRegDate(String faqRegDate) {
		this.faqRegDate = faqRegDate;
	}

}
