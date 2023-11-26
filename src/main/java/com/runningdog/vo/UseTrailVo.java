package com.runningdog.vo;

public class UseTrailVo {

	// 손성진사용

	private int userNo;
	private int trailStar;
	private int trailStarNo;

	private int coordNo;
	private int trailNo;
	private String name;
	private int coordOrder;
	private double lat;
	private double lng;	

	private String saveName; // 산책로 이미지의 이름
	private String orgName;

	private int locationVo;

	public UseTrailVo() {
	}

	public UseTrailVo(int userNo, int trailStar, int trailStarNo, int coordNo, int trailNo, String name, int coordOrder,
			double lat, double lng, String saveName, String orgName, int locationVo) {
		super();
		this.userNo = userNo;
		this.trailStar = trailStar;
		this.trailStarNo = trailStarNo;
		this.coordNo = coordNo;
		this.trailNo = trailNo;
		this.name = name;
		this.coordOrder = coordOrder;
		this.lat = lat;
		this.lng = lng;
		this.saveName = saveName;
		this.orgName = orgName;
		this.locationVo = locationVo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTrailStar() {
		return trailStar;
	}

	public void setTrailStar(int trailStar) {
		this.trailStar = trailStar;
	}

	public int getTrailStarNo() {
		return trailStarNo;
	}

	public void setTrailStarNo(int trailStarNo) {
		this.trailStarNo = trailStarNo;
	}

	public int getCoordNo() {
		return coordNo;
	}

	public void setCoordNo(int coordNo) {
		this.coordNo = coordNo;
	}

	public int getTrailNo() {
		return trailNo;
	}

	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCoordOrder() {
		return coordOrder;
	}

	public void setCoordOrder(int coordOrder) {
		this.coordOrder = coordOrder;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public int getLocationVo() {
		return locationVo;
	}

	public void setLocationVo(int locationVo) {
		this.locationVo = locationVo;
	}

	@Override
	public String toString() {
		return "UseTrailVo [userNo=" + userNo + ", trailStar=" + trailStar + ", trailStarNo=" + trailStarNo
				+ ", coordNo=" + coordNo + ", trailNo=" + trailNo + ", name=" + name + ", coordOrder=" + coordOrder
				+ ", lat=" + lat + ", lng=" + lng + ", saveName=" + saveName + ", orgName=" + orgName + ", locationVo="
				+ locationVo + "]";
	}
	
	

	
}
