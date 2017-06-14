package com.korail.client.reservation.vo;

public class SeatVO {
	private int seatNO;
    private String seatDivision;
    private String seatRow;
    private String seatColumn;
	public int getSeatNO() {
		return seatNO;
	}
	public void setSeatNO(int seatNO) {
		this.seatNO = seatNO;
	}
	public String getSeatDivision() {
		return seatDivision;
	}
	public void setSeatDivision(String seatDivision) {
		this.seatDivision = seatDivision;
	}
	public String getSeatRow() {
		return seatRow;
	}
	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}
	public String getSeatColumn() {
		return seatColumn;
	}
	public void setSeatColumn(String seatColumn) {
		this.seatColumn = seatColumn;
	}
    
}
