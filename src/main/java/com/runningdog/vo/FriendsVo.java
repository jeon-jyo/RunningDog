package com.runningdog.vo;


//친구 페이지에서 사용하는 Vo
public class FriendsVo {
	
	private String saveName;
	private int friendNo;
	private int userNo;
	private int applyUserNo;
	private int appliedUserNo;
	private String name;
	private String code;
	private String birth;
	private String gender;
	private String si;
	private String gu;
	private String dong;
	private int locationNo;
	
	public FriendsVo() {
		
	}
	
	public FriendsVo(int friendNo, int userNo) {
		this.friendNo = friendNo;
		this.userNo = userNo;
	}

	public FriendsVo(String saveName, int friendNo, int userNo, int applyUserNo, int appliedUserNo, String name,
			String code, String birth, String gender, String si, String gu, String dong, int locationNo) {
		super();
		this.saveName = saveName;
		this.friendNo = friendNo;
		this.userNo = userNo;
		this.applyUserNo = applyUserNo;
		this.appliedUserNo = appliedUserNo;
		this.name = name;
		this.code = code;
		this.birth = birth;
		this.gender = gender;
		this.si = si;
		this.gu = gu;
		this.dong = dong;
		this.locationNo = locationNo;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public int getFriendNo() {
		return friendNo;
	}

	public void setFriendNo(int friendNo) {
		this.friendNo = friendNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getApplyUserNo() {
		return applyUserNo;
	}

	public void setApplyUserNo(int applyUserNo) {
		this.applyUserNo = applyUserNo;
	}

	public int getAppliedUserNo() {
		return appliedUserNo;
	}

	public void setAppliedUserNo(int appliedUserNo) {
		this.appliedUserNo = appliedUserNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getSi() {
		return si;
	}

	public void setSi(String si) {
		this.si = si;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}

	@Override
	public String toString() {
		return "FriendsVo [saveName=" + saveName + ", friendNo=" + friendNo + ", userNo=" + userNo + ", applyUserNo="
				+ applyUserNo + ", appliedUserNo=" + appliedUserNo + ", name=" + name + ", code=" + code + ", birth="
				+ birth + ", gender=" + gender + ", si=" + si + ", gu=" + gu + ", dong=" + dong + ", locationNo="
				+ locationNo + "]";
	}
	
}

