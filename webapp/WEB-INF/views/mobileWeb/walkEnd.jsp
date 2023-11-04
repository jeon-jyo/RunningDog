<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<!-- 모바일용 웹페이지로 변환 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>산책종료</title>
    <!-- 네이버 지도 API 스크립트를 포함합니다. -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=b9b0wee2jf"></script>
    <!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<!-- css -->
	<link href="${pageContext.request.contextPath}/assets/css/mobileWeb/walkEnd.css" rel="stylesheet" type="text/css">	
	
	<!-- 부트스트랩 cdn , 폰트어썸 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/109d7bd609.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</head>
<body>

	<div id="allBox">
	
		<!-- 헤더박스 -->
		<div class="headerBox" style="" >
		
			<div class="end" id="text01">산책종료</div>
			
			<div class="recordBox">
				<div class="date" id="text02">2023년 10월 25일(화)</div>
				<div class="record" id="text02"> 거리:34m  시간:0:45</div>
			</div>		
			
		</div>
		
			
		<!-- 컨텐츠 모음 -->
		<div class="content" >
		
			<!-- 기록된 이동기록이 뜨는 맵 -->
			<div id="map"></div>
			
			<!-- 기록된 라인과 일치율이 높은 산책로 사진 3개 -->
			<div class="mapImages" >
				<div class="mapNameBox">
					이 산책로를 이용하셨습니다.
		        </div>				
				<div class="mapImageContainer" >
					<div class="mapImageBox">
						<img class="mapImage" src="${pageContext.request.contextPath}/assets/images/map1.jpg"></img>
						<i id="likeIcon" class="fa-solid fa-heart"></i>
						<div class="mapName"> 산책로 이름 </div>
			        </div>
			        <div class="mapImageBox">
						<img class="mapImage" src="${pageContext.request.contextPath}/assets/images/map1.jpg">
						<i id="likeIcon" class="fa-regular fa-heart"></i>
						<div class="mapName"> 산책로 이름 </div>
			        </div>
			        <div class="mapImageBox">
						<img id="mapImageClick" class="mapImage" src="${pageContext.request.contextPath}/assets/images/map1.jpg">
						<i id="likeIcon" class="fa-solid fa-heart"></i>
						<div class="mapName"> 산책로 이름 </div>
			        </div>
				</div>				
			</div>
			
			<!-- 파일첨부 버튼 -->
			<div class="pictures"> 
				<i class="fa-regular fa-image"></i>&nbsp; 사진첨부
			</div>	
			
			<!-- 텍스트작성박스 -->
			<td colspan="1"><textarea  class="textBox" name="content" rows="4" placeholder="내용을 입력해주세요." value="" ></textarea></td>
			
			<!-- 체크박스라인 -->
			<div class="checkBox">
			
				<i class="fa-solid fa-unlock-keyhole"></i>
				
				<div> &nbsp; 비공개로 게시</div>
				
				<label class="switch-button">
					<input type="checkbox"/>
				    <span class="onoff-switch"></span>
				</label>
			</div>
			
			<div class="checkBox">
			
				<i class="fa-brands fa-instagram"></i>
				
				<div> &nbsp; Instagram에 게시</div>
				
				<label class="switch-button">
					<input type="checkbox"/>
				    <span class="onoff-switch"></span>
				</label>
				
			</div>
		</div>
		
		<!-- 작성하기 버튼 -->
		<div class="lastButton">
			<!-- 작성 -->
			<div class="write" data-bs-toggle="modal" data-bs-target="#exampleModal"> 기록하기 </div>
			<!-- 취소 -->
			<div class="back"> 기록하지않기 </div>
		</div>	
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">기록되었습니다.</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		     
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary">확인</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
	</div>
	
	
	<script th:inline="javascript">
	// 경로로 표시할 배열(array)
	// naver.maps.LatLng 위도 경도 변수
		var polylinePath = [];	
	
		// 컨트롤러에서 전달한 lineList 데이터를 JSON 형식으로 파싱
	    var jsonString = '${lineList}'; // JSON 형식의 문자열
		var lineList = JSON.parse(jsonString);
	    
	    // lineList의 각 항목을 polylinePath 배열에 추가
	    for (var i = 0; i < lineList.length; i++) {
	        var lat = lineList[i].lat;
	        var lng = lineList[i].lng;
	        polylinePath.push(new naver.maps.LatLng(lat, lng));
	    }
	    
	    console.log("내 이동 경로 표시 : " + polylinePath);
	    
	
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
	    });
	    
	    
	    $(document).ready(function() {
            $(".back").click(function() {
                // 여기에 이동할 링크를 넣어주세요
                window.location.href = "${pageContext.request.contextPath}/m/map";
            });
        });    
	    
	</script>
	
    <script>
        // 네이버 지도 API 스크립트 로딩 후 initMap 함수 호출
        naver.maps.onJSContentLoaded = initMap;
        
        function initMap() {
            // 지도 초기화 및 설정 작업을 수행하세요.
        }
    </script>
    
</body>
</html>