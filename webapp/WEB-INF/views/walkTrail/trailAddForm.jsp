<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailAddForm</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1 class="myList">산책로 등록</h1>

		<div class="explorer">
			<div class="segment-map-info">
				<i class="fa-solid fa-circle-check"></i>
				<div class="addInfo">예상 소요시간 : <strong>30분</strong></div>
				<div class="addInfo">거리 : <strong>1.8km</strong></div>
				<div class="addInfo">서울 강동구 올림픽로 702 해공도서관</div>
				<i class="fa-solid fa-location-dot selected-maker"></i>
			</div>

			<div class="main-content">
				<div class="segment-sidebar" id="trail-sidebar">
					<h6>산책로 이름</h6>
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="산책로 이름을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2">
							<i class="fa-solid fa-check"></i>
						</button>
					</div>
					
					<h6 class="infoName">산책로 태그</h6>
					<div class="tag-btn">
						<button class="btn badge btn1 selected-tag">공원 근처</button>
						<button class="btn badge btn1">산 근처</button>
						<button class="btn badge btn1">카페 근처</button>
						<button class="btn badge btn2">넓은 공간</button>
						<button class="btn badge btn2">흙길</button>
						<button class="btn badge btn2">액티비티</button>
						<button class="btn badge btn3 selected-tag step2">유동인구 많음</button>
						<button class="btn badge btn3 step2">유동인구 적음</button>
					</div>
					
					<h6 class="infoName">주차장</h6>
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
						<label class="form-check-label" for="flexSwitchCheckDefault"></label>
						<button type="button" class="btn badge btn-secondary">위치 설정</button>
					</div>
					
					<h6>화장실</h6>
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
						<label class="form-check-label" for="flexSwitchCheckDefault"></label>
						<button type="button" class="btn badge btn-secondary">위치 설정</button>
					</div>
					
					<h6>쓰레기통</h6>
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
						<label class="form-check-label" for="flexSwitchCheckDefault"></label>
						<button type="button" class="btn badge btn-secondary">위치 설정</button>
					</div>
					
					<h6 class="infoName">설명</h6>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label" hidden></label>
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
				</div>
				<div class="main-map" id="map"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var map = new naver.maps.Map('map');
</script>
</html>