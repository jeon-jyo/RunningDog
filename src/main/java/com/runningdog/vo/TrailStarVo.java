package com.runningdog.vo;

public class TrailStarVo {
	
	private int trailStarNo;
	private UsersVo usersVo;
	private TrailVo trailVo;
	private String StarDate;
	
	public TrailStarVo() {}
	
	public TrailStarVo(int trailStarNo, UsersVo usersVo, TrailVo trailVo, String starDate) {
		this.trailStarNo = trailStarNo;
		this.usersVo = usersVo;
		this.trailVo = trailVo;
		StarDate = starDate;
	}
	
	public int getTrailStarNo() {
		return trailStarNo;
	}
	public void setTrailStarNo(int trailStarNo) {
		this.trailStarNo = trailStarNo;
	}
	public UsersVo getUsersVo() {
		return usersVo;
	}
	public void setUsersVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}
	public TrailVo getTrailVo() {
		return trailVo;
	}
	public void setTrailVo(TrailVo trailVo) {
		this.trailVo = trailVo;
	}
	public String getStarDate() {
		return StarDate;
	}
	public void setStarDate(String starDate) {
		StarDate = starDate;
	}

	@Override
	public String toString() {
		return "TrailStarVo [trailStarNo=" + trailStarNo + ", usersVo=" + usersVo + ", trailVo=" + trailVo
				+ ", StarDate=" + StarDate + "]";
	}
	
}
