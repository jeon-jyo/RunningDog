package com.runningdog.vo;

public class UsedTrailVo {
	
	private int trailNo;
	private String name;
	private long eta;
	private double distance;
	private String distanceFormatted;
	private String etaFormatted;
	private int trailHit;
	private int trailStar;
	private int trailCmt;
	
	
	public UsedTrailVo() {}
	
	public UsedTrailVo(int trailNo, String name, long eta, double distance, String distanceFormatted,
			String etaFormatted, int trailHit, int trailStar, int trailCmt) {
		super();
		this.trailNo = trailNo;
		this.name = name;
		this.eta = eta;
		this.distance = distance;
		this.distanceFormatted = distanceFormatted;
		this.etaFormatted = etaFormatted;
		this.trailHit = trailHit;
		this.trailStar = trailStar;
		this.trailCmt = trailCmt;
	}

	public int getTrailNo() {
		return trailNo;
	}

	public void setTrailNo(int trailNo) {
		this.trailNo = trailNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getEta() {
		return eta;
	}
	
	private String formatEta(long seconds) {
	    long hours = seconds / 3600;
	    long minutes = (seconds % 3600) / 60;
	    return String.format("%d:%02d", hours, minutes);
	}


	public void setEta(long eta) {
		this.eta = eta;
		this.etaFormatted = formatEta(eta);
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
	    this.distance = distance;
	    this.distanceFormatted = String.format("%.1f", distance / 1000.0); // 미터를 킬로미터로 변환하고 소수점 둘째 자리까지 표시
	}

	public String getDistanceFormatted() {
		return distanceFormatted;
	}

	public void setDistanceFormatted(String distanceFormatted) {
		this.distanceFormatted = distanceFormatted;
	}

	public String getEtaFormatted() {
		return etaFormatted;
	}

	public void setEtaFormatted(String etaFormatted) {
		this.etaFormatted = etaFormatted;
	}

	public int getTrailHit() {
		return trailHit;
	}

	public void setTrailHit(int trailHit) {
		this.trailHit = trailHit;
	}

	public int getTrailStar() {
		return trailStar;
	}

	public void setTrailStar(int trailStar) {
		this.trailStar = trailStar;
	}

	public int getTrailCmt() {
		return trailCmt;
	}

	public void setTrailCmt(int trailCmt) {
		this.trailCmt = trailCmt;
	}

	@Override
	public String toString() {
		return "UsedTrailVo [trailNo=" + trailNo + ", name=" + name + ", eta=" + eta + ", distance=" + distance
				+ ", distanceFormatted=" + distanceFormatted + ", etaFormatted=" + etaFormatted + ", trailHit="
				+ trailHit + ", trailStar=" + trailStar + ", trailCmt=" + trailCmt + "]";
	}
	
	
	
	
	
	
	
	
	
	

}
