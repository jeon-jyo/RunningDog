package com.runningdog.vo;

public class TrailTagVo {
	
	private int trailTagNo;
	private TrailVo trailVo;
	private String tagName;
	
	public TrailTagVo() {}
	
	public TrailTagVo(int trailTagNo, TrailVo trailVo, String tagName) {
		this.trailTagNo = trailTagNo;
		this.trailVo = trailVo;
		this.tagName = tagName;
	}
	
	public int getTrailTagNo() {
		return trailTagNo;
	}
	public void setTrailTagNo(int trailTagNo) {
		this.trailTagNo = trailTagNo;
	}
	public TrailVo getTrailVo() {
		return trailVo;
	}
	public void setTrailVo(TrailVo trailVo) {
		this.trailVo = trailVo;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	@Override
	public String toString() {
		return "TrailTagVo [trailTagNo=" + trailTagNo + ", trailVo=" + trailVo + ", tagName=" + tagName + "]";
	}
	
}
