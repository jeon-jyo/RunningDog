package com.runningdog.vo;

public class MoStarVo {
	
	// 손성진 사용
	
	private int trailStarNo;
	private int userNo;
	private int trailNo;
	
	public MoStarVo() {}
	public MoStarVo(int trailStarNo, int userNo, int trailNo) {
		super();
		this.trailStarNo = trailStarNo;
		this.userNo = userNo;
		this.trailNo = trailNo;
	}
	public int getTrailStarNo() {
		return trailStarNo;
	}
	public void setTrailStarNo(int trailStarNo) {
		this.trailStarNo = trailStarNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getTrailNo() {
		return trailNo;
	}
	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}
	@Override
	public String toString() {
		return "MoStarVo [trailStarNo=" + trailStarNo + ", userNo=" + userNo + ", trailNo=" + trailNo + "]";
	}
	
	

}
