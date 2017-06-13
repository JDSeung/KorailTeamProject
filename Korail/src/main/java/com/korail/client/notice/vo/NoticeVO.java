package com.korail.client.notice.vo;

public class NoticeVO {
	/*도윤*/
	private int noticeNO;
	private String adminNO;
	private String adminName;
	private String noticeTitle;
	private String noticeContent;
	private String noticeRegdate;
	private String noticeAttachments;
	private String noticeTbEtc;
	
	
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
	public String getNoticeTbEtc() {
		return noticeTbEtc;
	}
	public void setNoticeTbEtc(String noticeTbEtc) {
		this.noticeTbEtc = noticeTbEtc;
	}
}
