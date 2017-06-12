package com.korail.batch.vo;

public class CityAccotTrainVO {
	private String depID; //출발역ID
	private String arrID; //도착역ID
	private String depplaceName;//출발역명
	private String arrplaceName;//도착역명
	public String getDepID() {
		return depID;
	}
	public void setDepID(String depID) {
		this.depID = depID;
	}
	public String getArrID() {
		return arrID;
	}
	public void setArrID(String arrID) {
		this.arrID = arrID;
	}
	public String getDepplaceName() {
		return depplaceName;
	}
	public void setDepplaceName(String depplaceName) {
		this.depplaceName = depplaceName;
	}
	public String getArrplaceName() {
		return arrplaceName;
	}
	public void setArrplaceName(String arrplaceName) {
		this.arrplaceName = arrplaceName;
	}
}
