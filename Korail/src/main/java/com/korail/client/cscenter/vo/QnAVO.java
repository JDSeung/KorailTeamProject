package com.korail.client.cscenter.vo;

import org.springframework.web.multipart.MultipartFile;

public class QnAVO {
	private int qnaNo;				//글번호
	private String userNo;				//회원번호
    private String adminNo;			//사원번호
    private int postNo;				//게시글번호
    private String qnaWriter;		//작성자
    private String qnaRegDate;		//작성일
    private String qnaTitle;		//제목
    private String qnaContent;		//내용
    private String qnaAttachments;	//첨부파일
    private MultipartFile file;	//첨부파일
    private String ispublic;		//글공개여부0-공개 1-비공개
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaRegDate() {
		return qnaRegDate;
	}
	public void setQnaRegDate(String qnaRegDate) {
		this.qnaRegDate = qnaRegDate;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaAttachments() {
		return qnaAttachments;
	}
	public void setQnaAttachments(String qnaAttachments) {
		this.qnaAttachments = qnaAttachments;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getIspublic() {
		return ispublic;
	}
	public void setIspublic(String ispublic) {
		this.ispublic = ispublic;
	}
	
}
