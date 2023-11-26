package com.runningdog.vo;

//모임에서 쓰는 Vo

public class TrailsVo {
	
	private int trailNo;
	private UsersVo usersVo;
	private LocationVo locationVo;
	private String name;
	private String spot;
	private String distance;
	private String eta;
	private char parking;
	private char restroom;
	private char trashCan;
	private String explanation;
	private String regDate;
	private String updateDate;
	private char status;
	private String saveName;
	
	public TrailsVo() {}
	
	public int getTrailNo() {
		return trailNo;
	}
	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}
	public UsersVo getUsersVo() {
		return usersVo;
	}
	public void setUsersVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}
	public LocationVo getLocationVo() {
		return locationVo;
	}
	public void setLocationVo(LocationVo locationVo) {
		this.locationVo = locationVo;
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
	public String getDistance() {
		return distance;
	}
	public void setDistance(String distance) {
		this.distance = distance;
	}
	public String getEta() {
		return eta;
	}
	public void setEta(String eta) {
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
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	@Override
	public String toString() {
		return "TrailsVo [trailNo=" + trailNo + ", usersVo=" + usersVo + ", locationVo=" + locationVo + ", name=" + name
				+ ", spot=" + spot + ", distance=" + distance + ", eta=" + eta + ", parking=" + parking + ", restroom="
				+ restroom + ", trashCan=" + trashCan + ", explanation=" + explanation + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + ", status=" + status + ", saveName=" + saveName + "]";
	}
	
}
