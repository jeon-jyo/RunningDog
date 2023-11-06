package com.runningdog.vo;

public class UsersVo {
	
	//필드
	private int userNo;
	private LocationVo locationVo;
	private String id;
	private String password;
	private String name;
	private String code;
	private String birth;
	private String gender;
	private char status;
	
	//생성자
	public UsersVo() {
		
	}
	
	public UsersVo(int userNo, LocationVo locationVo, String id, String password, String name, String code, String birth,
			String gender, char status) {
		super();
		this.userNo = userNo;
		this.locationVo = locationVo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.code = code;
		this.birth = birth;
		this.gender = gender;
		this.status = status;
	}
	
	//gs
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public LocationVo getLocationVo() {
		return locationVo;
	}
	public void setLocationVo(LocationVo locationVo) {
		this.locationVo = locationVo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public char getStatus() {
		return status;
	}
	public void setStatus(char status) {
		this.status = status;
	}

	//toString
	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", locationVo=" + locationVo + ", id=" + id + ", password=" + password
				+ ", name=" + name + ", code=" + code + ", birth=" + birth + ", gender=" + gender + ", status=" + status
				+ "]";
	}
	
}


