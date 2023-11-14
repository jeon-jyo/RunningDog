package com.runningdog.vo;

public class MonthlyStatsVo {
	
	private int walkCountThisMonth;
    private double totalDistanceThisMonth;
    private long totalLogTimeThisMonth;

    private int walkCountTotal;
    private double totalDistanceTotal;
    private long totalLogTimeTotal;

    private String totalDistanceThisMonthFormatted;
    private String totalLogTimeThisMonthFormatted;

    private String totalDistanceTotalFormatted;
    private String totalLogTimeTotalFormatted;
    
    public MonthlyStatsVo() {}
    
	public MonthlyStatsVo(int walkCountThisMonth, double totalDistanceThisMonth, long totalLogTimeThisMonth,
			int walkCountTotal, double totalDistanceTotal, long totalLogTimeTotal,
			String totalDistanceThisMonthFormatted, String totalLogTimeThisMonthFormatted,
			String totalDistanceTotalFormatted, String totalLogTimeTotalFormatted) {
		super();
		this.walkCountThisMonth = walkCountThisMonth;
		this.totalDistanceThisMonth = totalDistanceThisMonth;
		this.totalLogTimeThisMonth = totalLogTimeThisMonth;
		this.walkCountTotal = walkCountTotal;
		this.totalDistanceTotal = totalDistanceTotal;
		this.totalLogTimeTotal = totalLogTimeTotal;
		this.totalDistanceThisMonthFormatted = totalDistanceThisMonthFormatted;
		this.totalLogTimeThisMonthFormatted = totalLogTimeThisMonthFormatted;
		this.totalDistanceTotalFormatted = totalDistanceTotalFormatted;
		this.totalLogTimeTotalFormatted = totalLogTimeTotalFormatted;
	}
	
	
    // 추가된 메소드: 이번 달 통계를 포맷팅하는 메소드
    private void formatThisMonthStats() {
        this.totalDistanceThisMonthFormatted = String.format("%.2fKM", this.totalDistanceThisMonth / 1000.0);
        this.totalLogTimeThisMonthFormatted = formatLogTime(this.totalLogTimeThisMonth);
    }

    // 추가된 메소드: 전체 통계를 포맷팅하는 메소드
    private void formatTotalStats() {
        this.totalDistanceTotalFormatted = String.format("%.2fKM", this.totalDistanceTotal / 1000.0);
        this.totalLogTimeTotalFormatted = formatLogTime(this.totalLogTimeTotal);
    }

    // 추가된 메소드: logTime을 시간과 분으로 변환하는 메소드
    private String formatLogTime(long seconds) {
        long hours = seconds / 3600;
        long minutes = (seconds % 3600) / 60;
        return String.format("%d시간 %02d분", hours, minutes);
    }
    
 // 추가된 메소드: 이번 달 통계를 설정하는 메소드
    public void setThisMonthStats(int walkCount, double totalDistance, long totalLogTime) {
        this.walkCountThisMonth = walkCount;
        this.totalDistanceThisMonth = totalDistance;
        this.totalLogTimeThisMonth = totalLogTime;
        formatThisMonthStats();
    }

    // 추가된 메소드: 전체 통계를 설정하는 메소드
    public void setTotalStats(int walkCount, double totalDistance, long totalLogTime) {
        this.walkCountTotal = walkCount;
        this.totalDistanceTotal = totalDistance;
        this.totalLogTimeTotal = totalLogTime;
        formatTotalStats();
    }


	public int getWalkCountThisMonth() {
		return walkCountThisMonth;
	}

	public void setWalkCountThisMonth(int walkCountThisMonth) {
		this.walkCountThisMonth = walkCountThisMonth;
	}

	public double getTotalDistanceThisMonth() {
		return totalDistanceThisMonth;
	}

	public void setTotalDistanceThisMonth(double totalDistanceThisMonth) {
		this.totalDistanceThisMonth = totalDistanceThisMonth;
	}

	public long getTotalLogTimeThisMonth() {
		return totalLogTimeThisMonth;
	}

	public void setTotalLogTimeThisMonth(long totalLogTimeThisMonth) {
		this.totalLogTimeThisMonth = totalLogTimeThisMonth;
	}

	public int getWalkCountTotal() {
		return walkCountTotal;
	}

	public void setWalkCountTotal(int walkCountTotal) {
		this.walkCountTotal = walkCountTotal;
	}

	public double getTotalDistanceTotal() {
		return totalDistanceTotal;
	}

	public void setTotalDistanceTotal(double totalDistanceTotal) {
		this.totalDistanceTotal = totalDistanceTotal;
	}

	public long getTotalLogTimeTotal() {
		return totalLogTimeTotal;
	}

	public void setTotalLogTimeTotal(long totalLogTimeTotal) {
		this.totalLogTimeTotal = totalLogTimeTotal;
	}

	public String getTotalDistanceThisMonthFormatted() {
		return totalDistanceThisMonthFormatted;
	}

	public void setTotalDistanceThisMonthFormatted(String totalDistanceThisMonthFormatted) {
		this.totalDistanceThisMonthFormatted = totalDistanceThisMonthFormatted;
	}

	public String getTotalLogTimeThisMonthFormatted() {
		return totalLogTimeThisMonthFormatted;
	}

	public void setTotalLogTimeThisMonthFormatted(String totalLogTimeThisMonthFormatted) {
		this.totalLogTimeThisMonthFormatted = totalLogTimeThisMonthFormatted;
	}

	public String getTotalDistanceTotalFormatted() {
		return totalDistanceTotalFormatted;
	}

	public void setTotalDistanceTotalFormatted(String totalDistanceTotalFormatted) {
		this.totalDistanceTotalFormatted = totalDistanceTotalFormatted;
	}

	public String getTotalLogTimeTotalFormatted() {
		return totalLogTimeTotalFormatted;
	}

	public void setTotalLogTimeTotalFormatted(String totalLogTimeTotalFormatted) {
		this.totalLogTimeTotalFormatted = totalLogTimeTotalFormatted;
	}

	@Override
	public String toString() {
		return "MonthlyStatsVo [walkCountThisMonth=" + walkCountThisMonth + ", totalDistanceThisMonth="
				+ totalDistanceThisMonth + ", totalLogTimeThisMonth=" + totalLogTimeThisMonth + ", walkCountTotal="
				+ walkCountTotal + ", totalDistanceTotal=" + totalDistanceTotal + ", totalLogTimeTotal="
				+ totalLogTimeTotal + ", totalDistanceThisMonthFormatted=" + totalDistanceThisMonthFormatted
				+ ", totalLogTimeThisMonthFormatted=" + totalLogTimeThisMonthFormatted
				+ ", totalDistanceTotalFormatted=" + totalDistanceTotalFormatted + ", totalLogTimeTotalFormatted="
				+ totalLogTimeTotalFormatted + "]";
	}
	
	
    
    
	
	
	

}
