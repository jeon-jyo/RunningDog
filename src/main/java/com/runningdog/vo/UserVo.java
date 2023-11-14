package com.runningdog.vo;

////////////////////////////
//회원, 설정 페이지에서 사용하는 vo//
////////////////////////////

public class UserVo {
	
	//필드
	private int userNo;
	private int locationNo;
	private String id;
	private String password;
	private String name;
	private String code;
	private String birth;
	private String gender;
	private char status;
	//시
	private String si;
	//구
	private String gu; 
	//동
	private String dong;
	//프로필경로
	private String saveName;
	
	//생성자
	public UserVo() {
		
	}
	
	public UserVo(int userNo, int locationNo, String id, String password, String name, String code, String birth,
			String gender, char status, String si, String gu, String dong, String saveName) {
		super();
		this.userNo = userNo;
		this.locationNo = locationNo;
		this.id = id;
		this.password = password;
		this.name = name;
		this.code = code;
		this.birth = birth;
		this.gender = gender;
		this.status = status;
		this.si = si;
		this.gu = gu;
		this.dong = dong;
		this.saveName = saveName;
	}

	//gs
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
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

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", locationNo=" + locationNo + ", id=" + id + ", password=" + password
				+ ", name=" + name + ", code=" + code + ", birth=" + birth + ", gender=" + gender + ", status=" + status
				+ ", si=" + si + ", gu=" + gu + ", dong=" + dong + ", saveName=" + saveName + "]";
	}

}


