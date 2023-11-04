package com.runningdog.vo;

public class MeetingInfoVo {
	
	private int meetingInfoNo;
	private MeetingVo meetingVo;
	private UsersVo usersVo;
	private DogVo dogVo;
	
	public MeetingInfoVo() {}
	public MeetingInfoVo(int meetingInfoNo, MeetingVo meetingVo, UsersVo usersVo, DogVo dogVo) {
		this.meetingInfoNo = meetingInfoNo;
		this.meetingVo = meetingVo;
		this.usersVo = usersVo;
		this.dogVo = dogVo;
	}
	public int getMeetingInfoNo() {
		return meetingInfoNo;
	}
	public void setMeetingInfoNo(int meetingInfoNo) {
		this.meetingInfoNo = meetingInfoNo;
	}
	public MeetingVo getMeetingVo() {
		return meetingVo;
	}
	public void setMeetingVo(MeetingVo meetingVo) {
		this.meetingVo = meetingVo;
	}
	public UsersVo getUsersVo() {
		return usersVo;
	}
	public void setUsersVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}
	public DogVo getDogVo() {
		return dogVo;
	}
	public void setDogVo(DogVo dogVo) {
		this.dogVo = dogVo;
	}
	@Override
	public String toString() {
		return "MeetingInfoVo [meetingInfoNo=" + meetingInfoNo + ", meetingVo=" + meetingVo + "]";
	}
	
}
