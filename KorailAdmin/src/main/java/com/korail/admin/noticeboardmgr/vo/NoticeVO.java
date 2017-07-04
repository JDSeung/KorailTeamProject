package com.korail.admin.noticeboardmgr.vo;

import org.springframework.web.multipart.MultipartFile;

public class NoticeVO {
	/*도윤*/
	private int noticeNO;
	private String adminNO;
	private String adminName;
	private String noticeTitle;
	private String noticeContent;
	private String noticeRegdate;
	private String noticeAttachments;
	private String noticeEtc;
	private MultipartFile file;   //첨부파일
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public int getNoticeNO() {
		return noticeNO;
	}
	public void setNoticeNO(int noticeNO) {
		this.noticeNO = noticeNO;
	}
	public String getAdminNO() {
		return adminNO;
	}
	public void setAdminNO(String adminNO) {
		this.adminNO = adminNO;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeRegdate() {
		return noticeRegdate;
	}
	public void setNoticeRegdate(String noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}
	public String getNoticeAttachments() {
		return noticeAttachments;
	}
	public void setNoticeAttachments(String noticeAttachments) {
		this.noticeAttachments = noticeAttachments;
	}
	public String getNoticeEtc() {
		return noticeEtc;
	}
	public void setNoticeEtc(String noticeEtc) {
		this.noticeEtc = noticeEtc;
	}
}

