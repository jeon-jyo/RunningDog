package com.runningdog.vo;

public class ClubBoardVo {
	
	private int clubBoardNo;
	private String title;
	private String contents;
	private String regDate;
	private char status;
	private int visits;
	private ClubBoardCategoryVo categoryVo;
	private UsersVo usersVo;
	
	public ClubBoardVo() {}
	public ClubBoardVo(int clubBoardNo, String title, String contents, String regDate, char status, int visits,
			ClubBoardCategoryVo categoryVo, UsersVo usersVo) {
		this.clubBoardNo = clubBoardNo;
		this.title = title;
		this.contents = contents;
		this.regDate = regDate;
		this.status = status;
		this.visits = visits;
		this.categoryVo = categoryVo;
		this.usersVo = usersVo;
	}
	public int getClubBoardNo() {
		return clubBoardNo;
	}
	public void setClubBoardNo(int clubBoardNo) {
		this.clubBoardNo = clubBoardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public ClubBoardCategoryVo getCategoryVo() {
		return categoryVo;
	}
	public void setCategoryVo(ClubBoardCategoryVo categoryVo) {
		this.categoryVo = categoryVo;
	}
	public UsersVo getUserVo() {
		return usersVo;
	}
	public void setUserVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}
	@Override
	public String toString() {
		return "ClubBoardVo [clubBoardNo=" + clubBoardNo + ", title=" + title + ", contents=" + contents + ", regDate="
				+ regDate + ", status=" + status + ", visits=" + visits + ", categoryVo=" + categoryVo + "]";
	}
	
}
