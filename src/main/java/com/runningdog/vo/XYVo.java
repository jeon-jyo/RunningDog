package com.runningdog.vo;

public class XYVo {

	private double x; // lng값 (경도)
	private double y; // lat값 (위도)

	public XYVo() {
	}

	public XYVo(double x, double y) {
		super();
		this.x = x;
		this.y = y;
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

	@Override
	public String toString() {
		return "XYVo [x=" + x + ", y=" + y + "]";
	}

}
