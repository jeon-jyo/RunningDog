package com.runningdog.vo;

public class CommCmtVo {
	
	private int commCmtNo; 		
	private String content;
	private String regDate; 
	private int groupNo;		
	private char status; 	
	
	private WalkLogVo walkLogVo;	
	private UsersVo usersVo;
	
	public CommCmtVo() {};
	
	public CommCmtVo(int commCmtNo, String content, String regDate, int groupNo, char status, WalkLogVo walkLogVo,
			UsersVo usersVo) {
		super();
		this.commCmtNo = commCmtNo;
		this.content = content;
		this.regDate = regDate;
		this.groupNo = groupNo;
		this.status = status;
		this.walkLogVo = walkLogVo;
		this.usersVo = usersVo;
	}

	public int getCommCmtNo() {
		return commCmtNo;
	}

	public void setCommCmtNo(int commCmtNo) {
		this.commCmtNo = commCmtNo;
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

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public WalkLogVo getWalkLogVo() {
		return walkLogVo;
	}

	public void setWalkLogVo(WalkLogVo walkLogVo) {
		this.walkLogVo = walkLogVo;
	}

	public UsersVo getUsersVo() {
		return usersVo;
	}

	public void setUsersVo(UsersVo usersVo) {
		this.usersVo = usersVo;
	}

	@Override
	public String toString() {
		return "CommCmtVo [commCmtNo=" + commCmtNo + ", content=" + content + ", regDate=" + regDate + ", groupNo="
				+ groupNo + ", status=" + status + ", walkLogVo=" + walkLogVo + "]";
	}
	
	
	
	
}
