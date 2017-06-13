package com.korail.client.reservation.vo;

/**
 * @author Sung
 * @trainName 열차번호
 * @depPlaceName 출발역
 * @depPlandTime 출발시각
 * @arrPlaceName 도착역
 * @arrPlandTime 도착시각
 * @takeTime 소요시간
 */
public class KTXInfoVO {
	private String trainName;		//열차번호
    private String depPlaceName;	//출발역
    private String depPlandTime;	//출발시각
    private String arrPlaceName;	//도착역
    private String arrPlandTime;	//도착시각
    private String takeTime;		//소요시간
	public String getTrainName() {
		return trainName;
	}
	public void setTrainName(String trainName) {
		this.trainName = trainName;
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
	public String getTakeTime() {
		return takeTime;
	}
	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}
	
}
