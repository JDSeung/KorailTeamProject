package com.korail.client.reservation.vo;

import java.util.Date;

public class TicketingVO {
	/*승열*/
	private int ticketNo; 			//예매번호
    private int userNo;				//회원번호
    private String trainNo;			//열차호수
    private Date rideDate;			//승차일자
    private String vehiclekndId;	//열차번호
    private String vehiclekndNm;	//열차종별
    private String depPlaceName;	//출발역
    private String depPlandTime;	//출발시각
    private String arrPlaceName;	//도착역
    private String arrPlandTime;	//도착시각
    private String reservationNo;	//예약매수
    private String rate;			//금액
    private String roomRating;		//객실등급
    private String seatInfo;		//좌석정보
    private String passengerType;	//승객유형
    private String ticketingETC;   	//티켓상황
	public int getTicketNo() {
		return ticketNo;
	}
	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTrainNo() {
		return trainNo;
	}
	public void setTrainNo(String trainNo) {
		this.trainNo = trainNo;
	}
	public Date getRideDate() {
		return rideDate;
	}
	public void setRideDate(Date rideDate) {
		this.rideDate = rideDate;
	}
	public String getVehiclekndId() {
		return vehiclekndId;
	}
	public void setVehiclekndId(String vehiclekndId) {
		this.vehiclekndId = vehiclekndId;
	}
	public String getVehiclekndNm() {
		return vehiclekndNm;
	}
	public void setVehiclekndNm(String vehiclekndNm) {
		this.vehiclekndNm = vehiclekndNm;
	}
	public String getDepPlaceName() {
		return depPlaceName;
	}
	public void setDepPlaceName(String depPlaceName) {
		this.depPlaceName = depPlaceName;
	}
	public String getDepPlandTime() {
		return depPlandTime;
	}
	public void setDepPlandTime(String depPlandTime) {
		this.depPlandTime = depPlandTime;
	}
	public String getArrPlaceName() {
		return arrPlaceName;
	}
	public void setArrPlaceName(String arrPlaceName) {
		this.arrPlaceName = arrPlaceName;
	}
	public String getArrPlandTime() {
		return arrPlandTime;
	}
	public void setArrPlandTime(String arrPlandTime) {
		this.arrPlandTime = arrPlandTime;
	}
	public String getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(String reservationNo) {
		this.reservationNo = reservationNo;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getRoomRating() {
		return roomRating;
	}
	public void setRoomRating(String roomRating) {
		this.roomRating = roomRating;
	}
	public String getSeatInfo() {
		return seatInfo;
	}
	public void setSeatInfo(String seatInfo) {
		this.seatInfo = seatInfo;
	}
	public String getPassengerType() {
		return passengerType;
	}
	public void setPassengerType(String passengerType) {
		this.passengerType = passengerType;
	}
	public String getTicketingETC() {
		return ticketingETC;
	}
	public void setTicketingETC(String ticketingETC) {
		this.ticketingETC = ticketingETC;
	}
    
}
