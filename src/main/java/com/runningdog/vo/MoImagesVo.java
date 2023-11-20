package com.runningdog.vo;

import org.springframework.web.multipart.MultipartFile;

public class MoImagesVo {
	
	// 손성진 사용
	
	private MultipartFile images;
	
	private int imagesNo;
	private String orgName;
	private String saveName;
	private String filePath;
	private int fileSize;
	private String type;
	private int userNo;
	private int imageOrder;
	
	public MoImagesVo() {}

	public MoImagesVo(MultipartFile images, int imagesNo, String orgName, String saveName, String filePath,
			int fileSize, String type, int userNo, int imageOrder) {
		super();
		this.images = images;
		this.imagesNo = imagesNo;
		this.orgName = orgName;
		this.saveName = saveName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.type = type;
		this.userNo = userNo;
		this.imageOrder = imageOrder;
	}

	public MultipartFile getImages() {
		return images;
	}

	public void setImages(MultipartFile images) {
		this.images = images;
	}

	public int getImagesNo() {
		return imagesNo;
	}

	public void setImagesNo(int imagesNo) {
		this.imagesNo = imagesNo;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getImageOrder() {
		return imageOrder;
	}

	public void setImageOrder(int imageOrder) {
		this.imageOrder = imageOrder;
	}

	@Override
	public String toString() {
		return "MoImagesVo [images=" + images + ", imagesNo=" + imagesNo + ", orgName=" + orgName + ", saveName="
				+ saveName + ", filePath=" + filePath + ", fileSize=" + fileSize + ", type=" + type + ", userNo="
				+ userNo + ", imageOrder=" + imageOrder + "]";
	}
	
	

	
}
