package com.runningdog.vo;

public class MoTrailVo {
	
	// 손성진 사용
	
	private int trailNo;
	private int usersNo;
	private int locationNo;
	
	private String name;
	private String spot;
	
	private int distance;
	private int eta;
	
	private char parking;
	private char restroom;
	private char trashCan;
	
	private String explanation;
	private String regDate;
	private String updateDate;
	
	private char status;
	
	public MoTrailVo() {}

	public MoTrailVo(int trailNo, int usersNo, int locationNo, String name, String spot, int distance, int eta,
			char parking, char restroom, char trashCan, String explanation, String regDate, String updateDate,
			char status) {
		super();
		this.trailNo = trailNo;
		this.usersNo = usersNo;
		this.locationNo = locationNo;
		this.name = name;
		this.spot = spot;
		this.distance = distance;
		this.eta = eta;
		this.parking = parking;
		this.restroom = restroom;
		this.trashCan = trashCan;
		this.explanation = explanation;
		this.regDate = regDate;
		this.updateDate = updateDate;
		this.status = status;
	}

	public int getTrailNo() {
		return trailNo;
	}

	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}

	public int getUsersNo() {
		return usersNo;
	}

	public void setUsersNo(int usersNo) {
		this.usersNo = usersNo;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpot() {
		return spot;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getEta() {
		return eta;
	}

	public void setEta(int eta) {
		this.eta = eta;
	}

	public char getParking() {
		return parking;
	}

	public void setParking(char parking) {
		this.parking = parking;
	}

	public char getRestroom() {
		return restroom;
	}

	public void setRestroom(char restroom) {
		this.restroom = restroom;
	}

	public char getTrashCan() {
		return trashCan;
	}

	public void setTrashCan(char trashCan) {
		this.trashCan = trashCan;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MoTrailVo [trailNo=" + trailNo + ", usersNo=" + usersNo + ", locationNo=" + locationNo + ", name="
				+ name + ", spot=" + spot + ", distance=" + distance + ", eta=" + eta + ", parking=" + parking
				+ ", restroom=" + restroom + ", trashCan=" + trashCan + ", explanation=" + explanation + ", regDate="
				+ regDate + ", updateDate=" + updateDate + ", status=" + status + "]";
	}
	
	

}
