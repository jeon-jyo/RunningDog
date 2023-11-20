package com.runningdog.vo;

public class BlogDogVo {
	
	private int dogNo;
	
	private String name;
	private char status;
	
	private String saveName;
	
	
	
	
	
	
	public BlogDogVo() {}





	public BlogDogVo(String name, char status, String saveName) {
		super();
		this.name = name;
		this.status = status;
		this.saveName = saveName;
	}





	public int getDogNo() {
		return dogNo;
	}





	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	public char getStatus() {
		return status;
	}





	public void setStatus(char status) {
		this.status = status;
	}





	public String getSaveName() {
		return saveName;
	}





	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}





	@Override
	public String toString() {
		return "BlogDogVo [dogNo=" + dogNo + ", name=" + name + ", status=" + status + ", saveName=" + saveName + "]";
	}
	
	




	
	
	
	
	
	
	

}
