package com.runningdog.vo;

public class XYVo {

	private double x; // lng값 (경도)
	private double y; // lat값 (위도)
	
	private int userNo;
	private int trailStar;

	public XYVo() {
	}
	
	public XYVo(double x, double y) {
		super();
		this.x = x;
		this.y = y;
	}

	public XYVo(double x, double y, int userNo, int trailStar) {
		super();
		this.x = x;
		this.y = y;
		this.userNo = userNo;
		this.trailStar = trailStar;
	}

	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
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

	@Override
	public String toString() {
		return "XYVo [x=" + x + ", y=" + y + ", userNo=" + userNo + ", trailStar=" + trailStar + "]";
	}

	

}
