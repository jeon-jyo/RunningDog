package com.runningdog.vo;

public class TrailUsedVo {
	
	private int trailUserdNo;
	private WalkLogVo walkLogVo;
	private TrailVo trailVo;
	
	public TrailUsedVo() {}
	
	public TrailUsedVo(int trailUserdNo, WalkLogVo walkLogVo, TrailVo trailVo) {
		this.trailUserdNo = trailUserdNo;
		this.walkLogVo = walkLogVo;
		this.trailVo = trailVo;
	}
	
	public int getTrailUserdNo() {
		return trailUserdNo;
	}
	public void setTrailUserdNo(int trailUserdNo) {
		this.trailUserdNo = trailUserdNo;
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
		return "TrailUsedVo [trailUserdNo=" + trailUserdNo + ", walkLogVo=" + walkLogVo + ", trailVo=" + trailVo + "]";
	}

}
