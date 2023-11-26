package com.runningdog.vo;


public class MeetingVo {
	
	private int meetingNo;
	private String name;
	private String description;
	private String meetingDate;
	private int maxMember;
	private int currentMember;
	private char small;
	private char medium;
	private char large;
	private char status;
	private UsersVo usersVo;
	private TrailVo trailVo;
	
	public MeetingVo() {}
	public MeetingVo(int meetingNo, String name, String description, String meetingDate, int maxMember,
			int currentMember, char small, char medium, char large, char status, UsersVo usersVo, TrailVo trailVo) {
		this.meetingNo = meetingNo;
		this.name = name;
		this.description = description;
		this.meetingDate = meetingDate;
		this.maxMember = maxMember;
		this.currentMember = currentMember;
		this.small = small;
		this.medium = medium;
		this.large = large;
		this.status = status;
		this.usersVo = usersVo;
		this.trailVo = trailVo;
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
	public char getSmall() {
		return small;
	}
	public void setSmall(char small) {
		this.small = small;
	}
	public char getMedium() {
		return medium;
	}
	public void setMedium(char medium) {
		this.medium = medium;
	}
	public char getLarge() {
		return large;
	}
	public void setLarge(char large) {
		this.large = large;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public UsersVo getUsersVo() {
		return usersVo;
	}
	public void setUsersVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}
	public TrailVo getTrailVo() {
		return trailVo;
	}
	public void setTrailVo(TrailVo trailVo) {
		this.trailVo = trailVo;
	}
	
	@Override
	public String toString() {
		return "MeetingVo [meetingNo=" + meetingNo + ", name=" + name + ", description=" + description
				+ ", meetingDate=" + meetingDate + ", maxMember=" + maxMember + ", currentMember=" + currentMember
				+ ", small=" + small + ", medium=" + medium + ", large=" + large + ", status=" + status + ", usersVo="
				+ usersVo + ", trailVo=" + trailVo + "]";
	}
}
