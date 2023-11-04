package com.runningdog.vo;

public class ClubBoardCategoryVo {

	private int categoryNo;
	private String name;
	private int orderNo;
	private String regDate;
	private char status;
	private char defaultCategory;
	private ClubVo clubVo;
	
	public ClubBoardCategoryVo() {}
	public ClubBoardCategoryVo(int categoryNo, String name, int orderNo, String regDate, char status,
			char defaultCategory, ClubVo clubVo) {
		this.categoryNo = categoryNo;
		this.name = name;
		this.orderNo = orderNo;
		this.regDate = regDate;
		this.status = status;
		this.defaultCategory = defaultCategory;
		this.clubVo = clubVo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
	public char getDefaultCategory() {
		return defaultCategory;
	}
	public void setDefaultCategory(char defaultCategory) {
		this.defaultCategory = defaultCategory;
	}
	public ClubVo getClubVo() {
		return clubVo;
	}
	public void setClubVo(ClubVo clubVo) {
		this.clubVo = clubVo;
	}
	@Override
	public String toString() {
		return "ClubBoardCategoryVo [categoryNo=" + categoryNo + ", name=" + name + ", orderNo=" + orderNo
				+ ", regDate=" + regDate + ", status=" + status + ", defaultCategory=" + defaultCategory + ", clubVo="
				+ clubVo + "]";
	}
	
	
}
