package com.runningdog.vo;

public class WalkLogConImgVo {
	
	
		
	private String saveName;	
	
	
	private int imageOrder;
	
	public WalkLogConImgVo() {}


	public WalkLogConImgVo(String saveName, int imageOrder) {
		super();
		this.saveName = saveName;
		this.imageOrder = imageOrder;
	}


	public String getSaveName() {
		return saveName;
	}


	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}


	public int getImageOrder() {
		return imageOrder;
	}


	public void setImageOrder(int imageOrder) {
		this.imageOrder = imageOrder;
	}


	@Override
	public String toString() {
		return "WalkLogConImg [saveName=" + saveName + ", imageOrder=" + imageOrder + "]";
	}
	
	
	
	
	
	

}
