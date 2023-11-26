package com.runningdog.vo;

import java.util.List;

// 손성진 사용

public class AdminXYVo {

	private List<XYVo> xyList;
	private int walkLogNo;
	
	private String title; // 제목
	private int logTime; // 시간
	private int distance;  // 거리
	
	public AdminXYVo() {
		super();
	}

	public AdminXYVo(List<XYVo> xyList, int walkLogNo, String title, int logTime, int distance) {
		super();
		this.xyList = xyList;
		this.walkLogNo = walkLogNo;
		this.title = title;
		this.logTime = logTime;
		this.distance = distance;
	}

	public List<XYVo> getXyList() {
		return xyList;
	}

	public void setXyList(List<XYVo> xyList) {
		this.xyList = xyList;
	}

	public int getWalkLogNo() {
		return walkLogNo;
	}

	public void setWalkLogNo(int walkLogNo) {
		this.walkLogNo = walkLogNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getLogTime() {
		return logTime;
	}

	public void setLogTime(int logTime) {
		this.logTime = logTime;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	@Override
	public String toString() {
		return "AdminXYVo [xyList=" + xyList + ", walkLogNo=" + walkLogNo + ", title=" + title + ", logTime=" + logTime
				+ ", distance=" + distance + "]";
	}
	
	
	

}
