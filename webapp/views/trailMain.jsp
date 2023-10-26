<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailMain</title>
<link href="${pageContext.request.contextPath}/assets/css/trailMain.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contents">
		<h1>산책로메인</h1>

		<div class="explorer">
			<div class="segment-map-filters">
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="서울 특별시 강동구 천호동" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
					태그 전체보기&nbsp;&nbsp;&nbsp;
					<i class="fa-solid fa-chevron-down"></i>
				</button>
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">...</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div>

				<div class="btn-group" role="group" aria-label="Default button group">
					<button type="button" class="btn btn-outline-dark">이용자순</button>
					<button type="button" class="btn btn-outline-dark">인기순</button>
					<button type="button" class="btn btn-outline-dark">최신순</button>
					<button type="button" class="btn btn-outline-dark">오래된순</button>
				</div>

				<button type="button" class="btn btn-primary">MY</button>
			</div>

			<div class="main-content">
				<div class="segments-sidebar">
					<span>산책로 목록</span>
				</div>
				<div class="main-map">
					<span>Map</span>
				</div>
			</div>
		</div>
	</div>
</body>
</html>