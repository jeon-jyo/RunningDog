package com.runningdog.vo;

public class DogVo {

	private int dogNo;
	private UsersVo userNo;
	private String name;
	private String birth;
	private String gender;
	private float weight;
	private String kind;
	private String neuter;
	private String cert;
	private String color;
	private char status;
	
	public DogVo() {
		
	}
	
	public DogVo(int dogNo, UsersVo userNo, String name, String birth, String gender, float weight,
			String kind, String neuter, String cert, String color, char status) {
		super();
		this.dogNo = dogNo;
		this.userNo = userNo;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.weight = weight;
		this.kind = kind;
		this.neuter = neuter;
		this.cert = cert;
		this.color = color;
		this.status = status;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	public UsersVo getUserNo() {
		return userNo;
	}

	public void setUserNo(UsersVo userNo) {
		this.userNo = userNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getNeuter() {
		return neuter;
	}

	public void setNeuter(String neuter) {
		this.neuter = neuter;
	}

	public String getCert() {
		return cert;
	}

	public void setCert(String cert) {
		this.cert = cert;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "DogVo [dogNo=" + dogNo + ", userNo=" + userNo + ", name=" + name + ", birth=" + birth + ", gender="
				+ gender + ", weight=" + weight + ", kind=" + kind + ", neuter=" + neuter
				+ ", cert=" + cert + ", color=" + color + ", status=" + status + "]";
	}
	
	
}
