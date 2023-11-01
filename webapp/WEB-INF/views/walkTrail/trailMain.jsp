<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailMain</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailMain.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1>산책로 추천</h1>

		<div class="explorer">
			<div class="segment-map-filters">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="서울 특별시 강동구 천호동" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#tagModal">
					태그 전체보기&nbsp;&nbsp;&nbsp;
					<i class="fa-solid fa-chevron-down"></i>
				</button>
				<!-- tagModal -->
				<div class="modal fade" id="tagModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">태그 선택</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<button class="btn badge btn1 selected-tag">공원 근처</button>
								<button class="btn badge btn1">산 근처</button>
								<button class="btn badge btn1">카페 근처</button>
								<button class="btn badge btn2">넓은 공간</button>
								<button class="btn badge btn2">흙길</button>
								<button class="btn badge btn2">액티비티</button>
								<button class="btn badge btn3 step2">유동인구 많음</button>
								<button class="btn badge btn3 step2">유동인구 적음</button>
								<div class="form-check step2">
									<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
									<label class="form-check-label" for="flexCheckDefault">전체 해제</label>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-secondary">완료</button>
							</div>
						</div>
					</div>
				</div>
				
				<div class="btn-group" role="group" aria-label="Default button group">
					<button type="button" class="btn btn-outline-dark selected-filter">이용자순</button>
					<button type="button" class="btn btn-outline-dark">인기순</button>
					<button type="button" class="btn btn-outline-dark">최신순</button>
					<button type="button" class="btn btn-outline-dark">오래된순</button>
				</div>

				<button type="button" class="btn btn-primary">MY</button>
			</div>

			<div class="main-content">
				<div class="segments-sidebar" id="segments-sidebar">
					<ul>
						<li>
							<i class="fa-solid fa-location-dot fa-2x selected-maker"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">천호공원 한바퀴</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
					</ul>
				</div>
				<i class="fa-solid fa-angles-left" id="fa-angles"></i>
				<div class="main-map" id="map"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var map = new naver.maps.Map('map');
	
	/* Non-list */
 	$("#fa-angles").on("click", function() {
		console.log("fa-angles click");
		
		if(document.getElementById("map").classList.contains("nonList")) {
			document.getElementById("fa-angles").classList.replace("fa-angles-right", "fa-angles-left");
		} else {
			document.getElementById("fa-angles").classList.replace("fa-angles-left", "fa-angles-right");
		}
		document.getElementById("segments-sidebar").classList.toggle("nonList");
		document.getElementById("map").classList.toggle("nonList");
	});
 	
</script>
</html>