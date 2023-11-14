package com.runningdog.vo;

//user, setting, main에서 사용할 Vo
public class MainImageVo {
	
	private int imagesNo;
	private String orgName;
	private String saveName;
	private String filePath;
	private long fileSize;
	private String type;
	private int useNo;
	private int imageOrder;
	
	public MainImageVo() {}
	
	public MainImageVo(String type, int useNo) {
		this.type = type;
		this.useNo = useNo;
	}
	
	public MainImageVo(int imagesNo, String orgName, String saveName, String filePath, long fileSize, String type,
			int useNo, int imageOrder) {
		super();
		this.imagesNo = imagesNo;
		this.orgName = orgName;
		this.saveName = saveName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.type = type;
		this.useNo = useNo;
		this.imageOrder = imageOrder;
	}
	
	public MainImageVo(String orgName, String saveName, String filePath, long fileSize, String type, int useNo) {
		super();
		this.orgName = orgName;
		this.saveName = saveName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.type = type;
		this.useNo = useNo;
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
		return "ImagesVo [imagesNo=" + imagesNo + ", orgName=" + orgName + ", saveName=" + saveName + ", filePath="
				+ filePath + ", fileSize=" + fileSize + ", type=" + type + ", useNo=" + useNo + ", imageOrder="
				+ imageOrder + "]";
	}
	
}
