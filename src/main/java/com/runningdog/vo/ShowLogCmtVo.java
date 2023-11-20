package com.runningdog.vo;

public class ShowLogCmtVo {
	
	
	private int walkLogCmtNo;
	private int walkLogNo;
	private int userNo;
	private String name;
	private String content;
	private String regDate;
	private String userSavename;
	private char status;
	
	
	
	public ShowLogCmtVo(int walkLogCmtNo, int walkLogNo, int userNo, String name, String content, String regDate,
			String userSavename, char status) {
		super();
		this.walkLogCmtNo = walkLogCmtNo;
		this.walkLogNo = walkLogNo;
		this.userNo = userNo;
		this.name = name;
		this.content = content;
		this.regDate = regDate;
		this.userSavename = userSavename;
		this.status = status;
	}




	
	
	
	
	
	public ShowLogCmtVo() {}
	
	
	

	
	
	public String getUserSavename() {
		return userSavename;
	}









	public void setUserSavename(String userSavename) {
		this.userSavename = userSavename;
	}









	public int getWalkLogCmtNo() {
		return walkLogCmtNo;
	}
	public void setWalkLogCmtNo(int walkLogCmtNo) {
		this.walkLogCmtNo = walkLogCmtNo;
	}
	public int getWalkLogNo() {
		return walkLogNo;
	}
	public void setWalkLogNo(int walkLogNo) {
		this.walkLogNo = walkLogNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}









	@Override
	public String toString() {
		return "ShowLogCmtVo [walkLogCmtNo=" + walkLogCmtNo + ", walkLogNo=" + walkLogNo + ", userNo=" + userNo
				+ ", name=" + name + ", content=" + content + ", regDate=" + regDate + ", userSavename=" + userSavename
				+ ", status=" + status + "]";
	}

 

	
	
	
	
	

}
