package com.runningdog.vo;

public class ClubJoinVo {
	
	private int joinNo;
	private String regDate;
	private UsersVo usersVo;
	private ClubVo clubVo;
	
	public ClubJoinVo() {}
	public ClubJoinVo(int joinNo, String regDate, UsersVo usersVo, ClubVo clubVo) {
		super();
		this.joinNo = joinNo;
		this.regDate = regDate;
		this.usersVo = usersVo;
		this.clubVo = clubVo;
	}
	public int getJoinNo() {
		return joinNo;
	}
	public void setJoinNo(int joinNo) {
		this.joinNo = joinNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
		return "ClubJoinVo [joinNo=" + joinNo + ", clubVo=" + clubVo + "]";
	}
	
}
