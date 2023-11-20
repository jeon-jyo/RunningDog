package com.runningdog.vo;

public class LogWalkedDogVo {
	
	private String name;
	private String saveName;
	private int dogNo;
	private int walkedDogNo;
	private int walkLogNo;
	
	public LogWalkedDogVo() {}
	
	public LogWalkedDogVo(String name, String saveName, int dogNo, int walkedDogNo, int walkLogNo) {
		super();
		this.name = name;
		this.saveName = saveName;
		this.dogNo = dogNo;
		this.walkedDogNo = walkedDogNo;
		this.walkLogNo = walkLogNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	public int getWalkedDogNo() {
		return walkedDogNo;
	}

	public void setWalkedDogNo(int walkedDogNo) {
		this.walkedDogNo = walkedDogNo;
	}

	public int getWalkLogNo() {
		return walkLogNo;
	}

	public void setWalkLogNo(int walkLogNo) {
		this.walkLogNo = walkLogNo;
	}

	@Override
	public String toString() {
		return "LogWalkedDogVo [name=" + name + ", saveName=" + saveName + ", dogNo=" + dogNo + ", walkedDogNo="
				+ walkedDogNo + ", walkLogNo=" + walkLogNo + "]";
	}
	
	
	
	

}
