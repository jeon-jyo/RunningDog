package com.runningdog.vo;

public class MotrailUsedVo {
	
	private int trailUsedNo;
	private int trailNo;
	private int walkLogNo;
	
	public MotrailUsedVo() {}
	
	public MotrailUsedVo(int trailUsedNo, int trailNo, int walkLogNo) {
		super();
		this.trailUsedNo = trailUsedNo;
		this.trailNo = trailNo;
		this.walkLogNo = walkLogNo;
	}

	public int getTrailUsedNo() {
		return trailUsedNo;
	}

	public void setTrailUsedNo(int trailUsedNo) {
		this.trailUsedNo = trailUsedNo;
	}

	public int getTrailNo() {
		return trailNo;
	}

	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}

	public int getWalkLogNo() {
		return walkLogNo;
	}

	public void setWalkLogNo(int walkLogNo) {
		this.walkLogNo = walkLogNo;
	}

	@Override
	public String toString() {
		return "MotrailUsed [trailUsedNo=" + trailUsedNo + ", trailNo=" + trailNo + ", walkLogNo=" + walkLogNo + "]";
	}
	
	
	
	

}
