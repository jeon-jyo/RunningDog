package com.runningdog.vo;


public class ClubVo {

	private int clubNo;
	private String name;
	private String description;
	private String startYear;
	private String endYear;
	private String gender;
	private String regDate;
	private char status;
	private char join;
	private char authNoti;
	private char authBoard;
	private char authJoin;
	private char authSece;
	private LocationVo locationVo;
	
	public ClubVo() {}
	public ClubVo(int clubNo, String name, String description, String startYear, String endYear, String gender,
			String regDate, char status, char join, char authNoti, char authBoard, char authJoin, char authSece,
			LocationVo locationVo) {
		this.clubNo = clubNo;
		this.name = name;
		this.description = description;
		this.startYear = startYear;
		this.endYear = endYear;
		this.gender = gender;
		this.regDate = regDate;
		this.status = status;
		this.join = join;
		this.authNoti = authNoti;
		this.authBoard = authBoard;
		this.authJoin = authJoin;
		this.authSece = authSece;
		this.locationVo = locationVo;
	}
	public int getClubNo() {
		return clubNo;
	}
	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
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
	public String getStartYear() {
		return startYear;
	}
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	public String getEndYear() {
		return endYear;
	}
	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public char getJoin() {
		return join;
	}
	public void setJoin(char join) {
		this.join = join;
	}
	public char getAuthNoti() {
		return authNoti;
	}
	public void setAuthNoti(char authNoti) {
		this.authNoti = authNoti;
	}
	public char getAuthBoard() {
		return authBoard;
	}
	public void setAuthBoard(char authBoard) {
		this.authBoard = authBoard;
	}
	public char getAuthJoin() {
		return authJoin;
	}
	public void setAuthJoin(char authJoin) {
		this.authJoin = authJoin;
	}
	public char getAuthSece() {
		return authSece;
	}
	public void setAuthSece(char authSece) {
		this.authSece = authSece;
	}
	public LocationVo getLocationVo() {
		return locationVo;
	}
	public void setLocationVo(LocationVo locationVo) {
		this.locationVo = locationVo;
	}
	@Override
	public String toString() {
		return "ClubVo [clubNo=" + clubNo + ", name=" + name + ", description=" + description + ", startYear="
				+ startYear + ", endYear=" + endYear + ", gender=" + gender + ", regDate=" + regDate + ", status="
				+ status + ", join=" + join + ", authNoti=" + authNoti + ", authBoard=" + authBoard + ", authJoin="
				+ authJoin + ", authSece=" + authSece + ", locationVo=" + locationVo + "]";
	};

}
