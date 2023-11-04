package com.runningdog.vo;

public class UserLikeVo {
	
	private int userlikeNo;
	private UsersVo userNo;
	private String type;
	private String useNo;
	
	public UserLikeVo() {
		
	}
	
	public UserLikeVo(int userlikeNo, UsersVo userNo, String type, String useNo) {
		super();
		this.userlikeNo = userlikeNo;
		this.userNo = userNo;
		this.type = type;
		this.useNo = useNo;
	}

	public int getUserlikeNo() {
		return userlikeNo;
	}

	public void setUserlikeNo(int userlikeNo) {
		this.userlikeNo = userlikeNo;
	}

	public UsersVo getUserNo() {
		return userNo;
	}

	public void setUserNo(UsersVo userNo) {
		this.userNo = userNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUseNo() {
		return useNo;
	}

	public void setUseNo(String useNo) {
		this.useNo = useNo;
	}

	@Override
	public String toString() {
		return "UserLikeVo [userlikeNo=" + userlikeNo + ", userNo=" + userNo + ", type=" + type + ", useNo=" + useNo
				+ "]";
	}
	
	
	
	

}
