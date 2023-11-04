package com.runningdog.vo;


public class ClubUsersVo {
	
	private int clubUserNo;
	private char auth;
	private String regDate;
	private char status;
	private int visits;
	private String lastVisit;
	private UsersVo usersVo;
	private ClubVo clubVo;
	
	public ClubUsersVo() {}
	public ClubUsersVo(int clubUserNo, char auth, String regDate, char status, int visits, String lastVisit, UsersVo usersVo,
			ClubVo clubVo) {
		this.clubUserNo = clubUserNo;
		this.auth = auth;
		this.regDate = regDate;
		this.status = status;
		this.visits = visits;
		this.lastVisit = lastVisit;
		this.usersVo = usersVo;
		this.clubVo = clubVo;
	}
	public int getClubUserNo() {
		return clubUserNo;
	}
	public void setClubUserNo(int clubUserNo) {
		this.clubUserNo = clubUserNo;
	}
	public char getAuth() {
		return auth;
	}
	public void setAuth(char auth) {
		this.auth = auth;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}
	public int getVisits() {
		return visits;
	}
	public void setVisits(int visits) {
		this.visits = visits;
	}
	public String getLastVisit() {
		return lastVisit;
	}
	public void setLastVisit(String lastVisit) {
		this.lastVisit = lastVisit;
	}
	public UsersVo getUserVo() {
		return usersVo;
	}
	public void setUserVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}
	public ClubVo getClubVo() {
		return clubVo;
	}
	public void setClubVo(ClubVo clubVo) {
		this.clubVo = clubVo;
	}
	@Override
	public String toString() {
		return "ClubUsersVo [clubUserNo=" + clubUserNo + ", auth=" + auth + ", regDate=" + regDate + ", status="
				+ status + ", visits=" + visits + ", lastVisit=" + lastVisit + ", clubVo=" + clubVo + "]";
	}

}
