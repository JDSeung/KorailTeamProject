package com.korail.client.user.vo;

public class UserVO {
	private String userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userBirth;
	private String userGender;
	private String userAddr;
	private String userJoinagree;
	private String userInfoagree;
	private String userEtc = "0";
	private String userJoindate;
	private String userEmail;
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserJoinagree() {
		return userJoinagree;
	}
	public void setUserJoinagree(String userJoinagree) {
		this.userJoinagree = userJoinagree;
	}
	public String getUserInfoagree() {
		return userInfoagree;
	}
	public void setUserInfoagree(String userInfoagree) {
		this.userInfoagree = userInfoagree;
	}
	public String getUserEtc() {
		return userEtc;
	}
	public void setUserEtc(String userEtc) {
		this.userEtc = userEtc;
	}
	public String getUserJoindate() {
		return userJoindate;
	}
	public void setUserJoindate(String userJoindate) {
		this.userJoindate = userJoindate;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "UserVO [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userBirth=" + userBirth + ", userGender=" + userGender + ", userAddr="
				+ userAddr + ", userJoinagree=" + userJoinagree + ", userInfoagree=" + userInfoagree + ", userEtc="
				+ userEtc + ", userJoindate=" + userJoindate + ", userEmail=" + userEmail + "]";
	}
	
}
