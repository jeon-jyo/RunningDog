package com.runningdog.vo;

public class WalkedDogVo {
	
	private int walkedDogNo;
	private WalkLogVo walkLogVo;
	private DogVo dogVo;
	
	public WalkedDogVo() {}

	public WalkedDogVo(int walkedDogNo, WalkLogVo walkLogVo, DogVo dogVo) {
		super();
		this.walkedDogNo = walkedDogNo;
		this.walkLogVo = walkLogVo;
		this.dogVo = dogVo;
	}

	public int getWalkedDogNo() {
		return walkedDogNo;
	}

	public void setWalkedDogNo(int walkedDogNo) {
		this.walkedDogNo = walkedDogNo;
	}

	public WalkLogVo getWalkLogVo() {
		return walkLogVo;
	}

	public void setWalkLogVo(WalkLogVo walkLogVo) {
		this.walkLogVo = walkLogVo;
	}

	public DogVo getDogVo() {
		return dogVo;
	}

	public void setDogVo(DogVo dogVo) {
		this.dogVo = dogVo;
	}

	@Override
	public String toString() {
		return "WalkedDogVo [walkedDogNo=" + walkedDogNo + ", walkLogVo=" + walkLogVo + "]";
	};
	
	
	
	
	
	

}
