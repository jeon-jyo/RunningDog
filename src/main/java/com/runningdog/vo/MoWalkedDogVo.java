package com.runningdog.vo;

public class MoWalkedDogVo {
	
	private int walkedDogNo;
	private int walkLogNo;
	private int dogNo;
	
	public MoWalkedDogVo() {}

	public MoWalkedDogVo(int walkedDogNo, int walkLogNo, int dogNo) {
		super();
		this.walkedDogNo = walkedDogNo;
		this.walkLogNo = walkLogNo;
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

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	@Override
	public String toString() {
		return "MoWalkedDogVo [walkedDogNo=" + walkedDogNo + ", walkLogNo=" + walkLogNo + ", dogNo=" + dogNo + "]";
	}
	
	
	
		
	
	
	

}
