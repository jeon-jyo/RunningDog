package com.runningdog.vo;

import org.springframework.web.multipart.MultipartFile;

public class MoImagesVo {
	
	// 손성진 사용
	
	private MultipartFile images;
	
	private int userNo; // 유저번호
	
	private int imagesNo; // 이미지번호
	private String orgName;
	private String saveName;
	private String filePath;
	private long fileSize;
	private String type; // 사용처타입
	private int useNo; // 사용처이름
	private int imageOrder;
	
	public MoImagesVo() {}

	public MoImagesVo(MultipartFile images, int userNo, int imagesNo, String orgName, String saveName, String filePath,
			long fileSize, String type, int useNo, int imageOrder) {
		super();
		this.images = images;
		this.userNo = userNo;
		this.imagesNo = imagesNo;
		this.orgName = orgName;
		this.saveName = saveName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.type = type;
		this.useNo = useNo;
		this.imageOrder = imageOrder;
	}

	public MultipartFile getImages() {
		return images;
	}

	public void setImages(MultipartFile images) {
		this.images = images;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getUseNo() {
		return useNo;
	}

	public void setUseNo(int useNo) {
		this.useNo = useNo;
	}

	public int getImageOrder() {
		return imageOrder;
	}

	public void setImageOrder(int imageOrder) {
		this.imageOrder = imageOrder;
	}

	@Override
	public String toString() {
		return "MoImagesVo [images=" + images + ", userNo=" + userNo + ", imagesNo=" + imagesNo + ", orgName=" + orgName
				+ ", saveName=" + saveName + ", filePath=" + filePath + ", fileSize=" + fileSize + ", type=" + type
				+ ", useNo=" + useNo + ", imageOrder=" + imageOrder + "]";
	}

	

	
}
