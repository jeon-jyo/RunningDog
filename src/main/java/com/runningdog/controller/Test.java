package com.runningdog.controller;

public class Test {
	
	// 좌표간 거리계산 함수
	
	public static void main(String[] args) {
		
		// 첫번째 좌표값
		double lat1 = 37.537951;
		double lon1 = 127.126325;
		
		// 두번째 좌표값
		double lat2 = 37.537558;
		double lon2 = 127.127610;
				
		double EARTH_R = 6371000.0;
		double rad = Math.PI / 180;
		double radLat1 = rad * lat1;
		double radLat2 = rad * lat2;
		double radDist = rad * (lon1 - lon2);
		
		double distance = Math.sin(radLat1) * Math.sin(radLat2);
		distance = distance + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radDist);
		double ret = EARTH_R * Math.acos(distance);
		
		double distance2 = Math.round(ret); // 미터 단위 변환
	   
		System.out.println(distance2); // 121미터 나옴
		
		
	}

}
