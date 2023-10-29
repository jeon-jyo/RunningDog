<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailDetail</title>
<link href="${pageContext.request.contextPath}/assets/css/trailDetail.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contents">
		<h1><i class="fa-regular fa-star"></i>&nbsp;천호공원 한바퀴&nbsp;&nbsp;&nbsp;<i class="fa-solid fa-diagram-project"></i></h1>
		
		<div class="section">
			<div class="location">서울 강동구 올림픽로 702 해공도서관</div>
			<div class="stat">
				<span class="stat-subtext">거리</span>
				<span class="stat-text">1.87km</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">소요시간</span>
				<span class="stat-text">30분</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">이용자</span>
				<span class="stat-text">1k</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">찜</span>
				<span class="stat-text">391</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">후기</span>
				<span class="stat-text">1k</span>
			</div>
			<div class="stat2">이번주 이 산책로를 이용한 메이트수 <strong>200</strong></div>
		</div>
		
		<div class="map-container">
			<div class="main-map" id="map"></div>
			<div class="map-sidebar">
				<h2>나의 기록</h2>
				<div><img src="${pageContext.request.contextPath}/assets/images/mapImg.png"></div>
				<div class="detail-text">
					<span>내 닉네임</span>
					<span>20</span>
				</div>
			</div>
		</div>
		
		<div class="segment-comments"></div>		
	</div>
</body>
<script type="text/javascript">
	var map = new naver.maps.Map('map');
</script>
</html>