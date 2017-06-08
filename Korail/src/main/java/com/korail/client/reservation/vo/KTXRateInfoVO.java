package com.korail.client.reservation.vo;

public class KTXRateInfoVO {
	private int trainNo;				//열차호수
	private String AdminNo;				//사원번호
	private int seatNo;					//좌석번호
	private String VIPAdultRate;		//특실어른요금
	private String VIPChildRate;		//특실어린이요금
	private String VIPSeniorRate;		//특실 경로자 요금
	private String StandardAdultRate;	//일반실 어른요금
	private String StandardChildRate;	//일반실 어린이 요금
	private String StandardSeniorSrate;	//일반실 경로자 요금
	
	public int getTrainNo() {
		return trainNo;
	}
	public void setTrainNo(int trainNo) {
		this.trainNo = trainNo;
	}
	public String getAdminNo() {
		return AdminNo;
	}
	public void setAdminNo(String adminNo) {
		AdminNo = adminNo;
	}
	public int getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
	}
	public String getVIPAdultRate() {
		return VIPAdultRate;
	}
	public void setVIPAdultRate(String vIPAdultRate) {
		VIPAdultRate = vIPAdultRate;
	}
	public String getVIPChildRate() {
		return VIPChildRate;
	}
	public void setVIPChildRate(String vIPChildRate) {
		VIPChildRate = vIPChildRate;
	}
	public String getVIPSeniorRate() {
		return VIPSeniorRate;
	}
	public void setVIPSeniorRate(String vIPSeniorRate) {
		VIPSeniorRate = vIPSeniorRate;
	}
	public String getStandardAdultRate() {
		return StandardAdultRate;
	}
	public void setStandardAdultRate(String standardAdultRate) {
		StandardAdultRate = standardAdultRate;
	}
	public String getStandardChildRate() {
		return StandardChildRate;
	}
	public void setStandardChildRate(String standardChildRate) {
		StandardChildRate = standardChildRate;
	}
	public String getStandardSeniorSrate() {
		return StandardSeniorSrate;
	}
	public void setStandardSeniorSrate(String standardSeniorSrate) {
		StandardSeniorSrate = standardSeniorSrate;
	}
	
}
