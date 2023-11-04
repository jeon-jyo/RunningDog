package com.runningdog.vo;

public class LocationVo {
	
	private int locationNo;
	private String si;
	private String gu;
	private String dong;
	
	public LocationVo() {}
	public LocationVo(int locationNo, String si, String gu, String dong) {
		this.locationNo = locationNo;
		this.si = si;
		this.gu = gu;
		this.dong = dong;
	}

	public int getLocationNo() {
		return locationNo;
	}

	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
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

	@Override
	public String toString() {
		return "LocationVo [locationNo=" + locationNo + ", si=" + si + ", gu=" + gu + ", dong=" + dong + "]";
	}

}
