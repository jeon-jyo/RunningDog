package com.runningdog.vo;


//강아지 관련 처리하는 Vo
public class DogsVo {

	private int dogNo;
	private String dogName;
	private String birth;
	private String gender;
	private float weight;
	private String kind;
	private String neuter;
	private String personality;
	private String color;
	private char status;
	private String userName;
	private int userNo;
	private String saveName;
	
	
	public DogsVo() {
		
	}

	
	public DogsVo(int dogNo, String dogName, String birth, String gender, float weight, String kind, String neuter,
			String personality, String color, char status, String userName, int userNo, String saveName) {
		super();
		this.dogNo = dogNo;
		this.dogName = dogName;
		this.birth = birth;
		this.gender = gender;
		this.weight = weight;
		this.kind = kind;
		this.neuter = neuter;
		this.personality = personality;
		this.color = color;
		this.status = status;
		this.userName = userName;
		this.userNo = userNo;
		this.saveName = saveName;
	}


	public String getDogName() {
		return dogName;
	}

	public void setDogName(String dogName) {
		this.dogName = dogName;
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

	public String getPersonality() {
		return personality;
	}

	public void setPersonality(String personality) {
		this.personality = personality;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public int getDogNo() {
		return dogNo;
	}

	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}

	@Override
	public String toString() {
		return "DogListVo [dogNo=" + dogNo + ", dogName=" + dogName + ", birth=" + birth + ", gender=" + gender
				+ ", weight=" + weight + ", kind=" + kind + ", neuter=" + neuter + ", personality=" + personality
				+ ", color=" + color + ", status=" + status + ", userName=" + userName + ", userNo=" + userNo
				+ ", saveName=" + saveName + "]";
	}

}


