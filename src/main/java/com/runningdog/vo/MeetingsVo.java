package com.runningdog.vo;

//모임에서 쓰는 Vo

import java.util.List;

public class MeetingsVo {

	private int meetingNo;
	private String name;
	private String description;
	private String meetingDate;
	private int maxMember;
	private int currentMember;
	private String small;
	private String medium;
	private String large;
	private String status;
	private int userNo;
	private int trailNo;
	private String spot;
	private String time;
	private List<Integer> dogNo;
	private String saveName;
	private String trailName;
	private String userName;
	private String code;
	
	public MeetingsVo() {
		
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}

	public int getMaxMember() {
		return maxMember;
	}

	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}

	public int getCurrentMember() {
		return currentMember;
	}

	public void setCurrentMember(int currentMember) {
		this.currentMember = currentMember;
	}

	public String getSmall() {
		return small;
	}

	public void setSmall(String small) {
		this.small = small;
	}

	public String getMedium() {
		return medium;
	}

	public void setMedium(String medium) {
		this.medium = medium;
	}

	public String getLarge() {
		return large;
	}

	public void setLarge(String large) {
		this.large = large;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getTrailNo() {
		return trailNo;
	}

	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}

	public String getSpot() {
		return spot;
	}

	public void setSpot(String spot) {
		this.spot = spot;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	public List<Integer> getDogNo() {
		return dogNo;
	}

	public void setDogNo(List<Integer> dogNo) {
		this.dogNo = dogNo;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getTrailName() {
		return trailName;
	}

	public void setTrailName(String trailName) {
		this.trailName = trailName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "MeetingsVo [meetingNo=" + meetingNo + ", name=" + name + ", description=" + description
				+ ", meetingDate=" + meetingDate + ", maxMember=" + maxMember + ", currentMember=" + currentMember
				+ ", small=" + small + ", medium=" + medium + ", large=" + large + ", status=" + status + ", userNo="
				+ userNo + ", trailNo=" + trailNo + ", spot=" + spot + ", time=" + time + ", dogNo=" + dogNo
				+ ", saveName=" + saveName + ", trailName=" + trailName + ", userName=" + userName + ", code=" + code
				+ "]";
	}

	

}


