package com.korail.admin.reservation.vo;

public class TicketingVO {
	private int ticketingNo; 			//예매번호
    private int userNo;				//회원번호
    private String userName;		//회원성명
    private String trainName;		//차량번호
    private String trainNO;			//열차호수
    private String vehiclekndNm;	//열차종별
    private String depPlaceName;	//출발역
    private String depPlandTime;	//출발시각
    private String arrPlaceName;	//도착역
    private String arrPlandTime;	//도착시각
    private String reservationNo;	//예매매수
    private String rate;			//금액
    private String seatDivision;	//객실등급
    private String seat;			//좌석정보
    private String passengerType;	//승객유형
    private String ticketingDate; 	//예매일자
    private String ticketingETC;   	//티켓상황 0 - 대기, 1 - 취소, 2 - 진행, 3 - 완료, 4 ? 만료
    private String cnt;				//일자별 데이터
	public int getTicketingNo() {
		return ticketingNo;
	}
	public void setTicketingNo(int ticketingNo) {
		this.ticketingNo = ticketingNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTrainName() {
		return trainName;
	}
	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}
	public String getTrainNO() {
		return trainNO;
	}
	public void setTrainNO(String trainNO) {
		this.trainNO = trainNO;
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
	public String getSeatDivision() {
		return seatDivision;
	}
	public void setSeatDivision(String seatDivision) {
		this.seatDivision = seatDivision;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getPassengerType() {
		return passengerType;
	}
	public void setPassengerType(String passengerType) {
		this.passengerType = passengerType;
	}
	public String getTicketingDate() {
		return ticketingDate;
	}
	public void setTicketingDate(String ticketingDate) {
		this.ticketingDate = ticketingDate;
	}
	public String getTicketingETC() {
		return ticketingETC;
	}
	public void setTicketingETC(String ticketingETC) {
		this.ticketingETC = ticketingETC;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	
}
