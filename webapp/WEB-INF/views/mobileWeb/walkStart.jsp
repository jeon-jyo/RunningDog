<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<!-- 모바일용 웹페이지로 변환 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>산책하기</title>
    
    <!-- 네이버 지도 API 스크립트를 포함합니다. -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=b9b0wee2jf"></script>
    
    <!-- js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
			
	<!-- 부트스트랩 cdn , 폰트어썸 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/109d7bd609.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
		
	<!-- css -->
	<link href="${pageContext.request.contextPath}/assets/css/mobileWeb/walkStart.css" rel="stylesheet" type="text/css">		
				
	<!-- Slick 슬라이더 스타일 시트 추가 -->
	<!-- 
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
	 -->
	<link href="${pageContext.request.contextPath}/assets/css/mobileWeb/slick.css" rel="stylesheet" type="text/css">	
		
	<!-- Slick 슬라이더 스크립트 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>	
			
</head>
<body>
	
	<!-- 상단 박스 -->
	
	<div id="headerBox">
	
		<!-- 상단 좌측부터는 반복문으로 강아지프로필 이미지 띄우는곳 (5개 이상이면 슬릿) -->
		<div class="profile-container">
			<div class="profile-circles" >
				<c:forEach items="${dogList}" var="MoDogVo">
			        <div class="profile-circle choiceRed" >
			            <img src="${pageContext.request.contextPath}/assets/images/${MoDogVo.orgName}" alt="Profile Image 1">
			            <input type="hidden" name="dogNo" class="dogDate" value="${MoDogVo.dogNo}">
			        </div>
		        </c:forEach>            
		    </div>
		</div>
		
	    
	    <!-- <li><a class="wComm" href="${pageContext.request.contextPath}/comm/list"> 산책소식 </a></li> -->
	    
	    <!-- 상단 우측부터는 모임일정 유무에 따른 아이콘 표시 (일단은 아이콘띄우고 나중에 if문처리) -->	
	    <div id="clubsIcon" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	   		<i class="fa-solid fa-user-group" style="color: #e14e0e;"></i>
	    </div>       
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">오늘 내모임</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		      	<!-- 모임일정 표시 -->
		        ...
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary">일정선택</button>
		      </div>
		    </div>
		  </div>
		</div>
	
	</div>
	
	<div id="map"></div>	
	
	<!-- 이 버튼을 지도 아래 중앙에 배치합니다. -->
	<button class="button_1" id="startButton"> 산책시작 <i class="fa-solid fa-play"></i></button>
	
	<!-- 버튼 눌렀을때 스타일 변화 -->
	<div id="walkStart">
		
		<div class="walkBox">
			<div class="distance">
				<a class="wValue" id="mVal"> 00m </a>
				<a id="wName"> 거리 </a>						
			</div>
			
			<div class="lBox"> |</div>
			
			<div class="time">
				<a class="wValue" id="tVal"> 00:00:00 </a>
				<a id="wName"> 시간 </a>
			</div>
		</div>
		
		<div class="bBox">
			<button class="button_1" id="pauseButton"><i class="fa-solid fa-pause"></i></button>
			<button class="button_1" id="stopButton"><i class="fa-solid fa-stop"></i></button>
			<button class="button_1" id="cameraButton"><i class="fa-solid fa-camera"></i></button>
		</div>		
		
	</div>
	
	
	<input id="mapLat" type="hidden" name="mapLat" value="">
	<input id="mapLng" type="hidden" name="mapLng" value="">
	
	<!-- form으로 컨트롤러 보내기 -->
	<form id="dataForm" action="${pageContext.request.contextPath}/m/wif" method="post">
		<!-- 좌표데이터 -->
	    <input type="hidden" name="line" id="lineDataInput" value="">	    
	    <!-- 강아지데이터 -->
	    <input type="hidden" name="dogList" id="dogDataInput" value="">	    
	    <!-- 거리데이터 -->
	    <input type="hidden" name="distance" id="distanceDataInput" value="">
	    <!-- 소요시간데이터 -->
	    <input type="hidden" name="logTime" id="timeDataInput" value="">
	    <!-- 시작시간데이터 -->
	    <input type="hidden" name="startTime" id="sTimeDataInput" value="">
	    <!-- 종료시간데이터 -->
	    <input type="hidden" name="endTime" id="eTimeDataInput" value="">	    
	</form>
      
    <!-- js 설정 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/walkStart.js"></script>	  
    
    <script>
        // 네이버 지도 API 스크립트 로딩 후 initMap 함수 호출
        naver.maps.onJSContentLoaded = initMap;        
        
    </script>
    
   
    
</body>
</html>