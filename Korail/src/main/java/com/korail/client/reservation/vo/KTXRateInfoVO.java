package com.korail.client.reservation.vo;

public class KTXRateInfoVO {
	private int trainNo;			//열차호수
	private String adminNo;			//사원번호
	private String seatDivision;	//좌석구분
	private String adultRate;		//어른요금
	private String childRate;		//어린이요금
	private String seniorRate;		//경로자 요금
	public int getTrainNo() {
		return trainNo;
	}
	public void setTrainNo(int trainNo) {
		this.trainNo = trainNo;
	}
	public String getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}
	public String getSeatDivision() {
		return seatDivision;
	}
	public void setSeatDivision(String seatDivision) {
		this.seatDivision = seatDivision;
	}
	public String getAdultRate() {
		return adultRate;
	}
	public void setAdultRate(String adultRate) {
		this.adultRate = adultRate;
	}
	public String getChildRate() {
		return childRate;
	}
	public void setChildRate(String childRate) {
		this.childRate = childRate;
	}
	public String getSeniorRate() {
		return seniorRate;
	}
	public void setSeniorRate(String seniorRate) {
		this.seniorRate = seniorRate;
	}
	
	
}
