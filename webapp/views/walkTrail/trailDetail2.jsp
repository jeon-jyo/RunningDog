<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailDetail</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailDetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
</head>
<body>
	<div class="contents">
		<h1>
			<i class="fa-regular fa-star"></i>
			&nbsp;${detailMap.trailVo.name }&nbsp;&nbsp;&nbsp;
			<i class="fa-solid fa-diagram-project"></i>
		</h1>
		
		<div class="section">
			<div class="location">${detailMap.trailVo.spot }</div>
			<div class="stat">
				<span class="stat-subtext">거리</span>
				<span class="stat-text">${detailMap.info[0] }</span>
			</div>
			<div class="stat stat-margin">
				<span class="stat-subtext stat-margin">소요시간</span>
				<span class="stat-text stat-margin">${detailMap.info[1] }</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">이용자</span>
				<span class="stat-text">${detailMap.trailUsedCnt }</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">찜</span>
				<span class="stat-text">${detailMap.trailStarCnt }</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">후기</span>
				<span class="stat-text">${detailMap.trailCmtCnt }</span>
			</div>
			<div class="stat2">이번주 이 산책로를 이용한 메이트수 <strong>200</strong></div>
		</div>
		
		<div class="map-container">
			<div class="map-container-left">
				<div class="main-map" id="map"></div>
				
				<div class="map-info">
					<div class="map-detail-info">
						<div class="tag-btn">
							<c:if test="${!empty detailMap.tagList }">
								<c:forEach items="${detailMap.tagList }" var="trailTagVo">
									<c:if test="${trailTagVo.tagName == '공원 근처' || trailTagVo.tagName == '산 근처' || trailTagVo.tagName == '카페 근처' }">
										<button class="btn badge btn1">${trailTagVo.tagName }</button>
									</c:if>
									<c:if test="${trailTagVo.tagName == '넓은 공간' || trailTagVo.tagName == '흙길' }">
										<button class="btn badge btn2">${trailTagVo.tagName }</button>
									</c:if>
									<c:if test="${trailTagVo.tagName == '유동인구 많음' || trailTagVo.tagName == '유동인구 적음' }">
										<button class="btn badge btn3">${trailTagVo.tagName }</button>
									</c:if>
								</c:forEach> 
							</c:if>
						</div>
						<div class="check-info">
							<c:if test="${detailMap.trailVo.parking eq 'T'.charAt(0) }">
								<span class="true">주차장 있음</span>
							</c:if>
							<c:if test="${detailMap.trailVo.parking eq 'F'.charAt(0) }">
								<span>주차장 없음</span>
							</c:if>
							<c:if test="${detailMap.trailVo.restroom eq 'T'.charAt(0) }">
								<span class="true">화장실 있음</span>
							</c:if>
							<c:if test="${detailMap.trailVo.restroom eq 'F'.charAt(0) }">
								<span>화장실 없음</span>
							</c:if>
							<c:if test="${detailMap.trailVo.trashCan eq 'T'.charAt(0) }">
								<span class="true">쓰레기통 있음</span>
							</c:if>
							<c:if test="${detailMap.trailVo.trashCan eq 'F'.charAt(0) }">
								<span>쓰레기통 없음</span>
							</c:if>
						</div>
						<div class="user-modify">
							<i class="fa-solid fa-pen"></i>
							<i class="fa-solid fa-trash"></i>
						</div>
					</div>
					
					<div class="map-detail-text">
						${detailMap.trailVo.explanation }
					</div>
					
					<div class="map-detail-chart detail-border">
						<h2><i class="fa-solid fa-chart-simple"></i>&nbsp;&nbsp;&nbsp;산책로 이용 시간대</h2>
						<div class="detail-chart">chart</div>
					</div>
					
					<div class="map-detail-meeting">
						<h2><i class="fa-solid fa-user-group"></i>&nbsp;&nbsp;&nbsp;오늘의 산책모임</h2>
						<div class="detail-meeting">
							<i class="fa-solid fa-chevron-left"></i>
							<div class="meetings">
								<div class="metting">
									<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang4.jpg">
									<span>동아리 이름</span>
								</div>
								<div class="metting">
									<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang4.jpg">
									<span>동아리 이름</span>
								</div>
								<div class="metting">
									<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang4.jpg">
									<span>동아리 이름</span>
								</div>
								<div class="metting">
									<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang4.jpg">
									<span>동아리 이름</span>
								</div>
								<div class="metting">
									<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang4.jpg">
									<span>동아리 이름</span>
								</div>
							</div>
							<i class="fa-solid fa-chevron-right"></i>
						</div>
					</div>
				</div>
			</div>
			
			<div class="map-container-right">
				<div class="map-sidebar">
					<h2>나의 기록</h2>
					<div class="detail-bar">
						<c:if test="${!empty userMap }">
							<c:if test="${!empty userMap.userImg }">
								<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
							</c:if>
							<c:if test="${empty userMap.userImg }">
								<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang5.jpg">
							</c:if>
							<div class="detail-text">
								<span>${userMap.usersVo.name }</span>
								<span><i class="fa-solid fa-person-walking"></i>&nbsp;&nbsp;&nbsp;<strong>${userMap.userUsedCnt }</strong></span>
							</div>
						</c:if>
						<c:if test="${empty userMap }">
							<span>&nbsp;&nbsp;&nbsp;정보가 없습니다.</span>
						</c:if>
					</div>
					<h2>최근 일지</h2>
					<div class="record-bar">
						<c:if test="${!empty userMap.walkLogMap.walkLogList }">
							<c:forEach items="${userMap.walkLogMap.walkLogList }" var="walkLogVo" varStatus="status">
								<div class="detail-text">
									<span>${walkLogVo.regDate }</span>
 									<span>${userMap.walkLogMap.infoList[status.index][0] }</span>
									<span>${userMap.walkLogMap.infoList[status.index][1] }</span>
									<i class="fa-solid fa-chevron-right"></i>
								</div>
							</c:forEach> 
						</c:if>
						<c:if test="${empty userMap.walkLogMap.walkLogList }">
							<div class="detail-text">
								<span>산책 기록이 없습니다.</span>
							</div>
						</c:if>
					</div>
				</div>
				
				<div class="map-sidebar share-sidebar">
					<h2>공유 메이트</h2>
					<div class="detail-bar">
						<c:if test="${! empty detailMap.userImg }">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
						</c:if>
						<c:if test="${empty detailMap.userImg }">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang5.jpg">
						</c:if>
						<div class="detail-text">
							<span>${detailMap.trailVo.usersVo.name }</span>
							<span><i class="fa-solid fa-person-walking"></i>&nbsp;&nbsp;&nbsp;<strong>${detailMap.userUsedCnt }</strong></span>
						</div>
					</div>
					<div class="record-bar share-detail">
						<div class="detail-text">
							<span class="textName">작성일</span>
							<span>${detailMap.trailVo.regDate }</span>
						</div>
						<div class="detail-text">
							<span class="textName">마지막 수정일</span>
							<c:if test="${detailMap.trailVo.regDate != detailMap.trailVo.updateDate }">
								<span>${detailMap.trailVo.updateDate }</span>
							</c:if>
						</div>
					</div>
				</div>
				
				<div class="map-sidebar ranking-sidebar">
					<h2><i class="fa-solid fa-crown"></i>&nbsp;가장 많이 이용한 메이트</h2>
					<c:if test="${!empty userUsedMap.userList }">
						<c:forEach items="${userUsedMap.userList }" var="usersVo" varStatus="status">
							<div class="ranking-detail-bar">
								<c:if test="${!empty userUsedMap.imgList[status.index] }">
									<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang2.jpg">
								</c:if>
								<c:if test="${empty userUsedMap.imgList[status.index] }">
									<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang1.jpg">
								</c:if>
								<div class="detail-text">
									<span>${usersVo.name }</span>
									<span><i class="fa-solid fa-person-walking"></i>&nbsp;&nbsp;&nbsp;<strong>${userUsedMap.usedCntList[status.index] }</strong></span>
								</div>
							</div>
						</c:forEach> 
					</c:if>
					<c:if test="${empty userUsedMap.userList }">
						<span>&nbsp;&nbsp;&nbsp;이용 기록이 없습니다.</span>
					</c:if>
				</div>
			</div>
			<!-- // map-container-right -->
		</div>
		<!-- // map-container -->
		
		<div class="segment-comments">
			<div class="comment-nav">
				<div class="selected">후기</div>
				<div>산책일지</div>
				<div>모임일지</div>
				<i class="fa-solid fa-caret-up"></i>
			</div>
			
			<div class="comment-container">
				<div class="comment-bar">
					<div class="comment-number"><i class="fa-regular fa-comment-dots"></i>&nbsp;1k</div>
					
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addModal">
						후기 작성하기&nbsp;&nbsp;&nbsp;
						<i class="fa-regular fa-images"></i>
					</button>
					<!-- addModal -->
					<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">후기 작성</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div>
										<div class="mb-3">
											<label for="exampleFormControlTextarea1" class="form-label" hidden></label>
											<textarea class="form-control modal-input" id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
										<div class="mb-3">
											<label for="formFileMultipleAdd" class="form-label" hidden></label>
											<input class="form-control" type="file" id="formFileMultipleAdd" multiple>
										</div>
									</div>
									<div class="img-content">
										<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
										<div class="imgCount">3</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-secondary">작성</button>
								</div>
							</div>
						</div>
					</div>
					
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label" for="flexCheckDefault">내 후기만 보기</label>
					</div>
					
					<div class="btn-group" role="group" aria-label="Default button group">
						<button type="button" class="btn btn-outline-dark">인기순</button>
						<button type="button" class="btn btn-outline-dark">최신순</button>
					</div>
					
					<div class="btn-group" role="group" aria-label="Default button group">
						<button type="button" class="btn btn-outline-dark">목록</button>
						<button type="button" class="btn btn-outline-dark">갤러리</button>
					</div>
				</div>
				<!-- // comment-bar -->
				
				<div class="comment-list">
					<div class="comment-detail">
						<div class="comment-img">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang1.jpg">
							<div class="imgCount">3</div>
						</div>
						<div class="comment-content">
							<div>사람이 많아도 조용해요</div>
							<span><i class="fa-regular fa-heart"></i>&nbsp;20</span>
						</div>
						<div class="comment-info">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
							<div class="detail-text">
								<span>닉네임</span>
								<span>2023/10/11</span>
							</div>
							<div class="user-modify modify-modal">
								<!-- Button trigger modal -->
								<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#modifyModal">
									<i class="fa-solid fa-pen"></i>
								</button>
								<!-- modifyModal -->
								<div class="modal fade" id="modifyModal" tabindex="0" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">후기 수정</h1>
												<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<div>
													<div class="mb-3">
														<label for="exampleFormControlTextarea1" class="form-label" hidden></label>
														<textarea class="form-control modal-input" id="exampleFormControlTextarea1" rows="3"></textarea>
													</div>
													<div class="mb-3">
														<label for="formFileMultipleModi" class="form-label" hidden></label>
														<input class="form-control" type="file" id="formFileMultipleModi" multiple>
													</div>
												</div>
												<div class="img-content">
													<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
													<div class="imgCount">3</div>
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
												<button type="button" class="btn btn-secondary">수정</button>
											</div>
										</div>
									</div>
								</div>
									
								<i class="fa-solid fa-trash"></i>
							</div>
						</div>
					</div>
					<div class="comment-detail">
						<div class="comment-img">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang2.jpg">
						</div>
						<div class="comment-content">
							<div></div>
							<span><i class="fa-regular fa-heart"></i>&nbsp;20</span>
						</div>
						<div class="comment-info">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
							<div class="detail-text">
								<span>닉네임</span>
								<span>2023/10/11</span>
							</div>
						</div>
					</div>
					<div class="comment-detail">
						<div class="comment-img">
							<%-- <img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg"> --%>
						</div>
						<div class="comment-content">
							<div>사람이 많아도 조용해요</div>
							<span><i class="fa-regular fa-heart"></i>&nbsp;20</span>
						</div>
						<div class="comment-info">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
							<div class="detail-text">
								<span>닉네임</span>
								<span>2023/10/11</span>
							</div>
							<div class="user-modify">
								<i class="fa-solid fa-pen"></i>
								<i class="fa-solid fa-trash"></i>
							</div>
						</div>
					</div>
					<div class="comment-detail">
						<div class="comment-img">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang4.jpg">
						</div>
						<div class="comment-content">
							<div>사람이 많아도 조용해요</div>
							<span><i class="fa-regular fa-heart"></i>&nbsp;20</span>
						</div>
						<div class="comment-info">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
							<div class="detail-text">
								<span>닉네임</span>
								<span>2023/10/11</span>
							</div>
							<div class="user-modify">
								<i class="fa-solid fa-pen"></i>
								<i class="fa-solid fa-trash"></i>
							</div>
						</div>
					</div>
					<div class="comment-detail">
						<div class="comment-img">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang5.jpg">
						</div>
						<div class="comment-content">
							<div>사람이 많아도 조용해요</div>
							<span><i class="fa-regular fa-heart"></i>&nbsp;20</span>
						</div>
						<div class="comment-info">
							<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
							<div class="detail-text">
								<span>닉네임</span>
								<span>2023/10/11</span>
							</div>
							<div class="user-modify">
								<i class="fa-solid fa-pen"></i>
								<i class="fa-solid fa-trash"></i>
							</div>
						</div>
					</div>
				</div>
				<!-- // comment-list -->
			</div>
			<!-- // comment-container -->
		</div>
		<!-- // map-container -->
	</div>
	
	<!-- detailModal -->
	<div class="detailModal">
		<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="img-slider">
							<i class="fa-solid fa-chevron-left"></i>
							<div class="detail-img">
								<div class="detail-img-content">
									<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
								</div>
							</div>
							<i class="fa-solid fa-chevron-right"></i>
						</div>
						<div class="img-info">
							<span><i class="fa-regular fa-heart"></i>&nbsp;20</span>
							<div class="img-info-detail">
								<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
								<div class="detail-text">
									<span>닉네임</span>
									<span>2023/10/11</span>
								</div>
								<div class="user-modify">
									<i class="fa-solid fa-pen" id="detail-modify-btn"></i>
									<i class="fa-solid fa-trash"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	/* map */
	let coords = ${detailMap.coordsJson };
	let markerCoords = ${detailMap.markersJson };
	
	var map = new naver.maps.Map('map', {
		zoom: 19,
		center: new naver.maps.Point(coords[0].lng, coords[0].lat),
	});
	
	let trailPath = [];
	for(let i = 0; i < coords.length; i++) {
		trailPath.push(new naver.maps.LatLng(coords[i].lat, coords[i].lng));
	}
	
	var polyline = new naver.maps.Polyline({
		path: trailPath,
        strokeColor: '#fc5200',
        strokeOpacity: 0.8,
        strokeWeight: 5,
        zIndex: 2,
        clickable: true,
        map: map
    });
	
	var marker = new naver.maps.Marker({
		map: map,
		position: trailPath[0],
		icon: {
			url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker.png',
		    size: new naver.maps.Size(30, 30),
		    scaledSize: new naver.maps.Size(30, 30),
       }
    });
	
	if (markerCoords[0] != null) {
		for(let i = 0; i < markerCoords.length; i++) {
			if(markerCoords[i].type == 'parking') {
				var infoMarker = new naver.maps.Marker({
					map: map,
					position: new naver.maps.LatLng(markerCoords[i].lat, markerCoords[i].lng),
					icon: {
						url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker0.png',
					    size: new naver.maps.Size(30, 30),
					    scaledSize: new naver.maps.Size(30, 30),
			       }
			    });
			} else if(markerCoords[i].type == 'restroom') {
				var infoMarker = new naver.maps.Marker({
					map: map,
					position: new naver.maps.LatLng(markerCoords[i].lat, markerCoords[i].lng),
					icon: {
						url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker1.png',
					    size: new naver.maps.Size(30, 30),
					    scaledSize: new naver.maps.Size(30, 30),
			       }
			    });
			} else if(markerCoords[i].type == 'trashCan') {
				var infoMarker = new naver.maps.Marker({
					map: map,
					position: new naver.maps.LatLng(markerCoords[i].lat, markerCoords[i].lng),
					icon: {
						url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker2.png',
					    size: new naver.maps.Size(30, 30),
					    scaledSize: new naver.maps.Size(30, 30),
			       }
			    });
			}
		}
	}
	
	
	
	
	
	
	

	/* cmt modal */
	$(".comment-img").on("click", function() {
		$('#detailModal').modal("show");
	});
	
	const modifyModal = document.getElementById('modifyModal');
	
	$("#detail-modify-btn").on("click", function() {
		$('#modifyModal').modal("show");
		modifyModal.focus();
	});
	
</script>
</html>