package com.runningdog.vo;

public class TrailCmtVo {
	
	private int trailCmtNo;
	private TrailVo trailVo;
	private UsersVo usersVo;
	private String regDate;
	private String content;
	private char status;
	
	public TrailCmtVo() {}
	
	public TrailCmtVo(int trailCmtNo, TrailVo trailVo, UsersVo usersVo, String regDate, String content, char status) {
		this.trailCmtNo = trailCmtNo;
		this.trailVo = trailVo;
		this.usersVo = usersVo;
		this.regDate = regDate;
		this.content = content;
		this.status = status;
	}
	
	public int getTrailCmtNo() {
		return trailCmtNo;
	}
	public void setTrailCmtNo(int trailCmtNo) {
		this.trailCmtNo = trailCmtNo;
	}
	public TrailVo getTrailVo() {
		return trailVo;
	}
	public void setTrailVo(TrailVo trailVo) {
		this.trailVo = trailVo;
	}
	public UsersVo getUsersVo() {
		return usersVo;
	}
	public void setUsersVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "TrailCmtVo [trailCmtNo=" + trailCmtNo + ", trailVo=" + trailVo + ", usersVo=" + usersVo + ", regDate="
				+ regDate + ", content=" + content + ", status=" + status + "]";
	}
	
}
