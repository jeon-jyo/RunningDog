package com.runningdog.vo;

public class FollowVo {
	
	private int followNo;
	private UsersVo followeeNo;
	private UsersVo followerNo;
	
	
	public FollowVo() {}
	
	
	public FollowVo(int followNo, UsersVo followeeNo, UsersVo followerNo) {
		super();
		this.followNo = followNo;
		this.followeeNo = followeeNo;
		this.followerNo = followerNo;
	}


	public int getFollowNo() {
		return followNo;
	}


	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}


	public UsersVo getFolloweeNo() {
		return followeeNo;
	}


	public void setFolloweeNo(UsersVo followeeNo) {
		this.followeeNo = followeeNo;
	}


	public UsersVo getFollowerNo() {
		return followerNo;
	}


	public void setFollowerNo(UsersVo followerNo) {
		this.followerNo = followerNo;
	}


	@Override
	public String toString() {
		return "FollowVo [followNo=" + followNo + ", followeeNo =" + followeeNo + ", followerNo =" +
				followerNo + "]";
	}


	
	

}
