package com.runningdog.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MoWalkLogVo {

	// 손성진 사용

	private int walkLogNo; // 산책기록 번호 (사용처번호)
	private int userNo;

	private int locationNo;
	private int meetingNo;
	private String title;

	private String regDate;
	private String startTime;
	private String endTime;
	private int logTime;
	private int distance;
	private String content;
	private String security;
	private char status;

	private List<Integer> dogNoList;
	private List<XYVo> polylinePath;
	private List<Integer> trailList; // 이용한 산책로
	private List<Integer> trailStar; // 찜한 산책로
	
	private MultipartFile mapImg;

	public MoWalkLogVo() {
	}

	public MoWalkLogVo(int walkLogNo, int userNo, int locationNo, int meetingNo, String title, String regDate,
			String startTime, String endTime, int logTime, int distance, String content, String security, char status,
			List<Integer> dogNoList, List<XYVo> polylinePath, List<Integer> trailList, List<Integer> trailStar,
			MultipartFile mapImg) {
		super();
		this.walkLogNo = walkLogNo;
		this.userNo = userNo;
		this.locationNo = locationNo;
		this.meetingNo = meetingNo;
		this.title = title;
		this.regDate = regDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.logTime = logTime;
		this.distance = distance;
		this.content = content;
		this.security = security;
		this.status = status;
		this.dogNoList = dogNoList;
		this.polylinePath = polylinePath;
		this.trailList = trailList;
		this.trailStar = trailStar;
		this.mapImg = mapImg;
	}

	public int getWalkLogNo() {
		return walkLogNo;
	}

	public void setWalkLogNo(int walkLogNo) {
		this.walkLogNo = walkLogNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSecurity() {
		return security;
	}

	public void setSecurity(String security) {
		this.security = security;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public List<Integer> getDogNoList() {
		return dogNoList;
	}

	public void setDogNoList(List<Integer> dogNoList) {
		this.dogNoList = dogNoList;
	}

	public List<XYVo> getPolylinePath() {
		return polylinePath;
	}

	public void setPolylinePath(List<XYVo> polylinePath) {
		this.polylinePath = polylinePath;
	}

	public List<Integer> getTrailList() {
		return trailList;
	}

	public void setTrailList(List<Integer> trailList) {
		this.trailList = trailList;
	}

	public List<Integer> getTrailStar() {
		return trailStar;
	}

	public void setTrailStar(List<Integer> trailStar) {
		this.trailStar = trailStar;
	}

	public MultipartFile getMapImg() {
		return mapImg;
	}

	public void setMapImg(MultipartFile mapImg) {
		this.mapImg = mapImg;
	}

	@Override
	public String toString() {
		return "MoWalkLogVo [walkLogNo=" + walkLogNo + ", userNo=" + userNo + ", locationNo=" + locationNo
				+ ", meetingNo=" + meetingNo + ", title=" + title + ", regDate=" + regDate + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", logTime=" + logTime + ", distance=" + distance + ", content=" + content
				+ ", security=" + security + ", status=" + status + ", dogNoList=" + dogNoList + ", polylinePath="
				+ polylinePath + ", trailList=" + trailList + ", trailStar=" + trailStar + ", mapImg=" + mapImg + "]";
	}

	
	

}
