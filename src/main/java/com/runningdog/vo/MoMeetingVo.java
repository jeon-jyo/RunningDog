package com.runningdog.vo;

public class MoMeetingVo {
	
	private int meetingNo;  // 모임번호
	private String name;    // 모임제목
	private String meetingDate; // 모임날짜  
	private String time;    // 모임시간
	private int userCount;
	private int maxMember;
	private int dogCount;
		
	private int userNo; // 모임장 번호

	public MoMeetingVo() {}

	public MoMeetingVo(int meetingNo, String name, String meetingDate, String time, int userCount, int maxMember,
			int dogCount, int userNo) {
		super();
		this.meetingNo = meetingNo;
		this.name = name;
		this.meetingDate = meetingDate;
		this.time = time;
		this.userCount = userCount;
		this.maxMember = maxMember;
		this.dogCount = dogCount;
		this.userNo = userNo;
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

	public String getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getUserCount() {
		return userCount;
	}

	public void setUserCount(int userCount) {
		this.userCount = userCount;
	}

	public int getMaxMember() {
		return maxMember;
	}

	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}

	public int getDogCount() {
		return dogCount;
	}

	public void setDogCount(int dogCount) {
		this.dogCount = dogCount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "MoMeetingVo [meetingNo=" + meetingNo + ", name=" + name + ", meetingDate=" + meetingDate + ", time="
				+ time + ", userCount=" + userCount + ", maxMember=" + maxMember + ", dogCount=" + dogCount
				+ ", userNo=" + userNo + "]";
	}

	
	

}
