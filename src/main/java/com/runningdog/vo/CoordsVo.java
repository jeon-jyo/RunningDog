package com.runningdog.vo;

public class CoordsVo {
	
	private int coordNo;	// 좌표번호
	private String type;	// 사용처타입
	private int useNo;		// 사용처번호
	private int coordOrder; // 좌표순서
	private double lat;		// y값 (위도)
	private double lng;		// x값 (경도)
	
	public CoordsVo() {}
	
	public CoordsVo(int coordNo, String type, int useNo, int coordOrder, double lat, double lng) {
		super();
		this.coordNo = coordNo;
		this.type = type;
		this.useNo = useNo;
		this.coordOrder = coordOrder;
		this.lat = lat;
		this.lng = lng;
	}
	
	public int getCoordNo() {
		return coordNo;
	}
	public void setCoordNo(int coordNo) {
		this.coordNo = coordNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getUseNo() {
		return useNo;
	}
	public void setUseNo(int useNo) {
		this.useNo = useNo;
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

	@Override
	public String toString() {
		return "CoordsVo [coordNo=" + coordNo + ", type=" + type + ", useNo=" + useNo + ", coordOrder=" + coordOrder
				+ ", lat=" + lat + ", lng=" + lng + "]";
	}

}
