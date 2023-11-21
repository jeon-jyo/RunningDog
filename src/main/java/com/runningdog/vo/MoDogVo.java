package com.runningdog.vo;

public class MoDogVo {
	
	// 손성진 사용
	
	private int dogNo;
	private String dogName;	
	private int userNo;
	private String userName;	

	private String saveName; // 강아지 이미지의 이름
	private String orgName;
	
	private String color;
	private char status;
	
	public MoDogVo() {}

	public MoDogVo(int dogNo, String dogName, int userNo, String userName, String saveName, String orgName,
			String color, char status) {
		super();
		this.dogNo = dogNo;
		this.dogName = dogName;
		this.userNo = userNo;
		this.userName = userName;
		this.saveName = saveName;
		this.orgName = orgName;
		this.color = color;
		this.status = status;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "MoDogVo [dogNo=" + dogNo + ", dogName=" + dogName + ", userNo=" + userNo + ", userName=" + userName
				+ ", saveName=" + saveName + ", orgName=" + orgName + ", color=" + color + ", status=" + status + "]";
	}

	
	
	

}
