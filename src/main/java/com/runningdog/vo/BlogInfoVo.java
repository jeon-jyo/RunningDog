package com.runningdog.vo;

public class BlogInfoVo {
	
	private int no;
	private String name; 
	
	private String userSavename;
	private String  bannerSavename;
	private String authId;
	private String paramId;
	
	private int followerNum;
	private int followingNum;
	
	private int followNo;
	
	public BlogInfoVo() {}
	
	
	

	


	public BlogInfoVo(int no, String name, String userSavename, String bannerSavename, String authId, String paramId,
			int followerNum, int followingNum, int followNo) {
		super();
		this.no = no;
		this.name = name;
		this.userSavename = userSavename;
		this.bannerSavename = bannerSavename;
		this.authId = authId;
		this.paramId = paramId;
		this.followerNum = followerNum;
		this.followingNum = followingNum;
		this.followNo = followNo;
	}







	public int getFollowNo() {
		return followNo;
	}







	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}







	public String getAuthId() {
		return authId;
	}



	public void setAuthId(String authId) {
		this.authId = authId;
	}



	public String getParamId() {
		return paramId;
	}



	public void setParamId(String paramId) {
		this.paramId = paramId;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserSavename() {
		return userSavename;
	}

	public void setUserSavename(String userSavename) {
		this.userSavename = userSavename;
	}

	public String getBannerSavename() {
		return bannerSavename;
	}

	public void setBannerSavename(String bannerSavename) {
		this.bannerSavename = bannerSavename;
	}

	public int getFollowerNum() {
		return followerNum;
	}

	public void setFollowerNum(int followerNum) {
		this.followerNum = followerNum;
	}

	public int getFollowingNum() {
		return followingNum;
	}

	public void setFollowingNum(int followingNum) {
		this.followingNum = followingNum;
	}



	@Override
	public String toString() {
		return "BlogInfoVo [no=" + no + ", name=" + name + ", userSavename=" + userSavename + ", bannerSavename="
				+ bannerSavename + ", authId=" + authId + ", paramId=" + paramId + ", followerNum=" + followerNum
				+ ", followingNum=" + followingNum + "]";
	}

	



	
	
	
	
	
	
	
	
	

}
