package com.runningdog.vo;

import java.util.List;

public class ShowLogVo {
	
	private int walkLogNo;
	private int userNo;
	private int locationNo;
	private String regDate;
	private String startTime;
	private String endTime;
	private long logTime;
	private double distance;
	private String distanceFormatted;
	private String logTimeFormatted;
	
	private String content;
	private String security;
	private char status;
	private String name;
	private String title;
	private String walkLogMap;
	private String userSavename;
	
	
	private List<UsedTrailVo> usedTrailList;
	private List<ShowLogCmtVo> showLogCmtList;
	private List<WalkLogConImgVo> imageList;
	private List<LogWalkedDogVo> walkedDogList;

	
	public ShowLogVo() {}













	public ShowLogVo(int walkLogNo, int userNo, int locationNo, String regDate, String startTime, String endTime,
			long logTime, double distance, String distanceFormatted, String logTimeFormatted, String content,
			String security, char status, String name, String title, String walkLogMap, String userSavename,
			List<UsedTrailVo> usedTrailList, List<ShowLogCmtVo> showLogCmtList, List<WalkLogConImgVo> imageList,
			List<LogWalkedDogVo> walkedDogList) {
		super();
		this.walkLogNo = walkLogNo;
		this.userNo = userNo;
		this.locationNo = locationNo;
		this.regDate = regDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.logTime = logTime;
		this.distance = distance;
		this.distanceFormatted = distanceFormatted;
		this.logTimeFormatted = logTimeFormatted;
		this.content = content;
		this.security = security;
		this.status = status;
		this.name = name;
		this.title = title;
		this.walkLogMap = walkLogMap;
		this.userSavename = userSavename;
		this.usedTrailList = usedTrailList;
		this.showLogCmtList = showLogCmtList;
		this.imageList = imageList;
		this.walkedDogList = walkedDogList;
	}













	public List<UsedTrailVo> getUsedTrailList() {
		return usedTrailList;
	}













	public void setUsedTrailList(List<UsedTrailVo> usedTrailList) {
		this.usedTrailList = usedTrailList;
	}













	public String getUserSavename() {
		return userSavename;
	}







	public void setUserSavename(String userSavename) {
		this.userSavename = userSavename;
	}







	public String getWalkLogMap() {
		return walkLogMap;
	}





	public void setWalkLogMap(String walkLogMap) {
		this.walkLogMap = walkLogMap;
	}





	public List<LogWalkedDogVo> getWalkedDogList() {
		return walkedDogList;
	}


	public void setWalkedDogList(List<LogWalkedDogVo> walkedDogList) {
		this.walkedDogList = walkedDogList;
	}


	public void setDistance(double distance) {
	    this.distance = distance;
	    this.distanceFormatted = String.format("%.2f", distance / 1000.0); // 미터를 킬로미터로 변환하고 소수점 둘째 자리까지 표시
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


	public int getLocationNo() {
		return locationNo;
	}


	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}


	public String getRegDate() {
		return regDate;
	}


	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}


	public String getStartTime() {
		return startTime;
	}


	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}


	public String getEndTime() {
		return endTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}


	public long getLogTime() {
		return logTime;
	}
	
	private String formatLogTime(long seconds) {
	    long hours = seconds / 3600;
	    long minutes = (seconds % 3600) / 60;
	    return String.format("%d시간 %02d분", hours, minutes);
	}


	public void setLogTime(long logTime) {
	    this.logTime = logTime;
	    this.logTimeFormatted = formatLogTime(logTime);
	}

	public double getDistance() {
		return distance;
	}


	

	public String getDistanceFormatted() {
		return distanceFormatted;
	}


	public void setDistanceFormatted(String distanceFormatted) {
		this.distanceFormatted = distanceFormatted;
	}


	public String getLogTimeFormatted() {
		return logTimeFormatted;
	}


	public void setLogTimeFormatted(String logTimeFormatted) {
		this.logTimeFormatted = logTimeFormatted;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getSecurity() {
		return security;
	}


	public void setSecurity(String security) {
		this.security = security;
	}


	public char getStatus() {
		return status;
	}


	public void setStatus(char status) {
		this.status = status;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public List<ShowLogCmtVo> getShowLogCmtList() {
		return showLogCmtList;
	}


	public void setShowLogCmtList(List<ShowLogCmtVo> showLogCmtList) {
		this.showLogCmtList = showLogCmtList;
	}


	public List<WalkLogConImgVo> getImageList() {
		return imageList;
	}


	public void setImageList(List<WalkLogConImgVo> imageList) {
		this.imageList = imageList;
	}













	@Override
	public String toString() {
		return "ShowLogVo [walkLogNo=" + walkLogNo + ", userNo=" + userNo + ", locationNo=" + locationNo + ", regDate="
				+ regDate + ", startTime=" + startTime + ", endTime=" + endTime + ", logTime=" + logTime + ", distance="
				+ distance + ", distanceFormatted=" + distanceFormatted + ", logTimeFormatted=" + logTimeFormatted
				+ ", content=" + content + ", security=" + security + ", status=" + status + ", name=" + name
				+ ", title=" + title + ", walkLogMap=" + walkLogMap + ", userSavename=" + userSavename
				+ ", usedTrailList=" + usedTrailList + ", showLogCmtList=" + showLogCmtList + ", imageList=" + imageList
				+ ", walkedDogList=" + walkedDogList + "]";
	}











	



	

	
	

}
