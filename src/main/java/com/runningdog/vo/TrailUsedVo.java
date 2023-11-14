package com.runningdog.vo;

public class TrailUsedVo {
	
	private int trailUsedNo;
	private WalkLogVo walkLogVo;
	private TrailVo trailVo;
	
	public TrailUsedVo() {}
	
	public TrailUsedVo(int trailUsedNo, WalkLogVo walkLogVo, TrailVo trailVo) {
		this.trailUsedNo = trailUsedNo;
		this.walkLogVo = walkLogVo;
		this.trailVo = trailVo;
	}
	
	public int gettrailUsedNo() {
		return trailUsedNo;
	}
	public void settrailUsedNo(int trailUsedNo) {
		this.trailUsedNo = trailUsedNo;
	}
	public WalkLogVo getWalkLogVo() {
		return walkLogVo;
	}
	public void setWalkLogVo(WalkLogVo walkLogVo) {
		this.walkLogVo = walkLogVo;
	}
	public TrailVo getTrailVo() {
		return trailVo;
	}
	public void setTrailVo(TrailVo trailVo) {
		this.trailVo = trailVo;
	}

	@Override
	public String toString() {
		return "TrailUsedVo [trailUsedNo=" + trailUsedNo + ", walkLogVo=" + walkLogVo + ", trailVo=" + trailVo + "]";
	}

}
