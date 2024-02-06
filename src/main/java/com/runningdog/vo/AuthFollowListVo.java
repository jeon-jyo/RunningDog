package com.runningdog.vo;

public class AuthFollowListVo {
	
	private int followeeNo;
	private int followerNo;
	
	
	public AuthFollowListVo() {}
	
	public AuthFollowListVo(int followeeNo, int followerNo) {
		super();
		this.followeeNo = followeeNo;
		this.followerNo = followerNo;
	}


	public int getFolloweeNo() {
		return followeeNo;
	}


	public void setFolloweeNo(int followeeNo) {
		this.followeeNo = followeeNo;
	}


	public int getFollowerNo() {
		return followerNo;
	}


	public void setFollowerNo(int followerNo) {
		this.followerNo = followerNo;
	}


	@Override
	public String toString() {
		return "AuthFollowListVo [followeeNo=" + followeeNo + ", followerNo=" + followerNo + "]";
	}
	
	
	
	
	
	

}
