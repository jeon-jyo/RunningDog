package com.runningdog.vo;


public class MeetingVo {
	
	private int meetingNo;
	private String name;
	private String description;
	private String meetingDate;
	private int maxPersonnel;
	private char openStatus;
	private char small;
	private char medium;
	private char large;
	private char status;
	private double lng;
	private double lat;
	private ClubVo clubVo;
	private UsersVo usersVo;
	private TrailVo trailVo;
	public MeetingVo() {}
	public MeetingVo(int meetingNo, String name, String description, String meetingDate, int maxPersonnel,
			char openStatus, char small, char medium, char large, char status, double lng, double lat, ClubVo clubVo,
			UsersVo usersVo, TrailVo trailVo) {
		this.meetingNo = meetingNo;
		this.name = name;
		this.description = description;
		this.meetingDate = meetingDate;
		this.maxPersonnel = maxPersonnel;
		this.openStatus = openStatus;
		this.small = small;
		this.medium = medium;
		this.large = large;
		this.status = status;
		this.lng = lng;
		this.lat = lat;
		this.clubVo = clubVo;
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
	public int getMaxPersonnel() {
		return maxPersonnel;
	}
	public void setMaxPersonnel(int maxPersonnel) {
		this.maxPersonnel = maxPersonnel;
	}
	public char getOpenStatus() {
		return openStatus;
	}
	public void setOpenStatus(char openStatus) {
		this.openStatus = openStatus;
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
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public ClubVo getClubVo() {
		return clubVo;
	}
	public void setClubVo(ClubVo clubVo) {
		this.clubVo = clubVo;
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
		return "meetingVo [meetingNo=" + meetingNo + ", name=" + name + ", description=" + description
				+ ", meetingDate=" + meetingDate + ", maxPersonnel=" + maxPersonnel + ", openStatus=" + openStatus
				+ ", small=" + small + ", medium=" + medium + ", large=" + large + ", status=" + status + ", lng=" + lng
				+ ", lat=" + lat + ", clubVo=" + clubVo + "]";
	}
	
	
	
}
