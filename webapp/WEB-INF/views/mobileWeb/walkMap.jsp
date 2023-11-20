<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>맵 캡쳐</title>
	<!-- 네이버 지도 API 스크립트를 포함합니다. -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=b9b0wee2jf"></script>
    <!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">	
		
	<style>
		
		
	
		#map {
			width: 745px;
			height: 380px;
		}
		
	</style>


</head>

<body>
	
	<!-- 기록된 이동기록이 뜨는 맵 -->
	<div id="map"></div>
	
	
	
<script>

	// 경로로 표시할 배열(array)
	// naver.maps.LatLng 위도 경도 변수
	var polylinePath = [];	

	// 컨트롤러에서 전달한 lineList 데이터를 JSON 형식으로 파싱
    var jsonString = '${lineList}'; // JSON 형식의 문자열
    	    	
	var lineList = JSON.parse(jsonString);
    
    // lineList의 각 항목을 polylinePath 배열에 추가
    for (var i = 0; i < lineList.length; i++) {
        let xy={}
        xy.x = lineList[i].lng;  // x값 (경도)
        xy.y = lineList[i].lat;  // y값 (위도)
        polylinePath.push(xy);
    }
  
	// 중간 지점을 계산
	var totalLat = 0;
	var totalLng = 0;

	// 모든 좌표의 합을 계산
	for (var i = 0; i < polylinePath.length; i++) {
	    totalLat += polylinePath[i].y;
	    totalLng += polylinePath[i].x;
	}

	// 평균 좌표 계산
	var avgLat = totalLat / polylinePath.length;
	var avgLng = totalLng / polylinePath.length;

    //지도 표시
    var map = new naver.maps.Map('map', {
        zoom: 18,
        center: new naver.maps.LatLng(avgLat, avgLng),
		mapDataControl : false,
		scaleControl : false,
		caleControl: false,
        logoControl: false
    });	    
   
    //위의 배열을 이용해 라인 그리기
    var polyline = new naver.maps.Polyline({
        path: polylinePath,      //선 위치 변수배열
        strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
        strokeOpacity: 0.8, //선 투명도 0 ~ 1
        strokeWeight: 6,   //선 두께
        map: map           //오버레이할 지도
    });
    
 	// 배열 첫번째 위치를 마크로 표시함
    var firstMarker = new naver.maps.Marker({
	    position: polylinePath[0], // 첫 번째 위치
	    map: map
	});

    // 배열 마지막 위치를 마크로 표시함
    var marker = new naver.maps.Marker({
        position: polylinePath[polylinePath.length-1], //마크 표시할 위치 배열의 마지막 위치
        map: map
    }); // 지도 관련 함수들
		
</script>

	
</body>
</html>