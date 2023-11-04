package com.runningdog.vo;

public class BlogVo {
	
	private int blogNo;
	private UsersVo userNo;
	
	public BlogVo() {}
	
	
	public BlogVo(int blogNo, UsersVo userNo) {
		super();
		this.blogNo = blogNo;
		this.userNo = userNo;
	}


	

	public int getBlogNo() {
		return blogNo;
	}


	public void setBlogNo(int blogNo) {
		this.blogNo = blogNo;
	}


	public UsersVo getUserNo() {
		return userNo;
	}


	public void setUserNo(UsersVo userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "BlogVo [blogNo=" + blogNo + "]";
	}
	
	
	
	
	

}
