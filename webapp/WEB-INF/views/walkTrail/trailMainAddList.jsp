<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailMainAddList</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailMain.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1 class="myList">산책로 등록</h1>

		<div class="explorer">
			<div class="segment-map-filters">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="서울 특별시 강동구 천호동" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>

				<div class="btn-group" role="group" aria-label="Default button group">
					<button type="button" class="btn btn-outline-dark selected-filter">이용순</button>
					<button type="button" class="btn btn-outline-dark">좋아요순</button>
					<button type="button" class="btn btn-outline-dark">최신순</button>
					<button type="button" class="btn btn-outline-dark">오래된순</button>
				</div>

				<i class="fa-solid fa-pen-to-square"></i>
			</div>

			<div class="main-content">
				<div class="segments-sidebar" id="segments-sidebar">
					<h6>나의 산책일지</h6>
					<ul>
						<li>
							<i class="fa-solid fa-location-dot fa-2x selected-maker"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
								<span>0.87km</span>
								<span>30분</span>
							</div>
						</li>
						<li>
							<i class="fa-solid fa-location-dot fa-2x"></i>
							<div>
								<span class="sideBar-title">2023/10/10</span><br>
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