package com.runningdog.vo;

import java.util.List;

public class BlogInfoVo {
	
	private int no;
	private String name; 
	
	private String userSavename;
	private String  bannerSavename;
	private int authNo;
	private int ownerNo;
	private String paramCode;
	
	private int followerNum;
	private int followingNum;
	
	private int followNo;
	
	private MonthlyStatsVo monthlyStatsThisMonth;
	private MonthlyStatsVo monthlyStatsTotal;
	
	private List<BlogDogVo> blogDogList;
	private List<FollowListVo> followerList;
	private List<FollowListVo> followingList;
	
	
	public BlogInfoVo() {}


	










	public BlogInfoVo(int no, String name, String userSavename, String bannerSavename, int authNo, int ownerNo,
			String paramCode, int followerNum, int followingNum, int followNo, MonthlyStatsVo monthlyStatsThisMonth,
			MonthlyStatsVo monthlyStatsTotal, List<BlogDogVo> blogDogList, List<FollowListVo> followerList,
			List<FollowListVo> followingList) {
		super();
		this.no = no;
		this.name = name;
		this.userSavename = userSavename;
		this.bannerSavename = bannerSavename;
		this.authNo = authNo;
		this.ownerNo = ownerNo;
		this.paramCode = paramCode;
		this.followerNum = followerNum;
		this.followingNum = followingNum;
		this.followNo = followNo;
		this.monthlyStatsThisMonth = monthlyStatsThisMonth;
		this.monthlyStatsTotal = monthlyStatsTotal;
		this.blogDogList = blogDogList;
		this.followerList = followerList;
		this.followingList = followingList;
	}













	public List<FollowListVo> getFollowerList() {
		return followerList;
	}













	public void setFollowerList(List<FollowListVo> followerList) {
		this.followerList = followerList;
	}













	public List<FollowListVo> getFollowingList() {
		return followingList;
	}













	public void setFollowingList(List<FollowListVo> followingList) {
		this.followingList = followingList;
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


	public int getAuthNo() {
		return authNo;
	}


	public void setAuthNo(int authNo) {
		this.authNo = authNo;
	}


	public int getOwnerNo() {
		return ownerNo;
	}


	public void setOwnerNo(int ownerNo) {
		this.ownerNo = ownerNo;
	}


	public String getParamCode() {
		return paramCode;
	}


	public void setParamCode(String paramCode) {
		this.paramCode = paramCode;
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


	public int getFollowNo() {
		return followNo;
	}


	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}


	public MonthlyStatsVo getMonthlyStatsThisMonth() {
		return monthlyStatsThisMonth;
	}


	public void setMonthlyStatsThisMonth(MonthlyStatsVo monthlyStatsThisMonth) {
		this.monthlyStatsThisMonth = monthlyStatsThisMonth;
	}


	public MonthlyStatsVo getMonthlyStatsTotal() {
		return monthlyStatsTotal;
	}


	public void setMonthlyStatsTotal(MonthlyStatsVo monthlyStatsTotal) {
		this.monthlyStatsTotal = monthlyStatsTotal;
	}


	public List<BlogDogVo> getBlogDogList() {
		return blogDogList;
	}


	public void setBlogDogList(List<BlogDogVo> blogDogList) {
		this.blogDogList = blogDogList;
	}













	@Override
	public String toString() {
		return "BlogInfoVo [no=" + no + ", name=" + name + ", userSavename=" + userSavename + ", bannerSavename="
				+ bannerSavename + ", authNo=" + authNo + ", ownerNo=" + ownerNo + ", paramCode=" + paramCode
				+ ", followerNum=" + followerNum + ", followingNum=" + followingNum + ", followNo=" + followNo
				+ ", monthlyStatsThisMonth=" + monthlyStatsThisMonth + ", monthlyStatsTotal=" + monthlyStatsTotal
				+ ", blogDogList=" + blogDogList + ", followerList=" + followerList + ", followingList=" + followingList
				+ "]";
	}





	
	
	
	
	
	

	



	
	
	
	
	
	
	
	
	

}
