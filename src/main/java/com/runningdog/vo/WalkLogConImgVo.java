package com.runningdog.vo;

public class WalkLogConImgVo {
	
	
		
	private int imagesNo;
	private String orgName;
	private String saveName;
	private String filePath;
	private long fileSize;
	private String type;
	private int useNo;
	private int imageOrder;
	
	public WalkLogConImgVo() {}


	public WalkLogConImgVo(String saveName, int imageOrder) {
		super();
		this.saveName = saveName;
		this.imageOrder = imageOrder;
	}
	
	


	public WalkLogConImgVo(int imagesNo, String orgName, String saveName, String filePath, long fileSize, String type,
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
	
	public WalkLogConImgVo(String orgName, String saveName, String filePath, long fileSize, String type, int useNo) {
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


	
	
	
	
	

}
