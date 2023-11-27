<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailDetail</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailDetail.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1>
			<c:if test="${!empty authUser.userNo }">
				<c:if test="${userMap.starChk != 0 }">
					<i class="fa-solid fa-star loginStar"></i>
				</c:if>
				<c:if test="${userMap.starChk == 0 }">
					<i class="fa-regular fa-star loginStar"></i>
				</c:if>
			</c:if>
			<c:if test="${empty authUser.userNo }">
				<i class="fa-regular fa-star"></i>
			</c:if>
			&nbsp;${detailMap.trailVo.name }&nbsp;&nbsp;&nbsp;
			<!-- <i class="fa-solid fa-diagram-project"></i> -->
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
			<!-- <div class="stat2">이번주 이 산책로를 이용한 메이트수 <strong>200</strong></div> -->
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
							<c:if test="${authUser.userNo == detailMap.trailVo.usersVo.userNo }">
								<!-- <i class="fa-solid fa-pen trail-update"></i> -->
								<i class="fa-solid fa-trash trail-delete"></i>
							</c:if>
						</div>
					</div>
					
					<div class="map-detail-text">
						${detailMap.trailVo.explanation }
					</div>
					
					<div class="map-detail-chart detail-border">
						<h2><i class="fa-solid fa-chart-simple"></i>&nbsp;&nbsp;&nbsp;산책로 이용 시간대</h2>
						<div class="detail-chart"></div>
					</div>
					
					<!-- 
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
					 -->
				</div>
			</div>
			
			<div class="map-container-right">
				<div class="map-sidebar">
					<h2>나의 기록</h2>
					<div class="detail-bar">
						<c:if test="${!empty userMap }">
							<c:if test="${!empty userMap.userImg }">
								<a href="${pageContext.request.contextPath}/walkBlog/${userMap.usersVo.code }">
									<img src="${pageContext.request.contextPath }/rdimg/userProfile/${userMap.userImg.saveName }">
								</a>
							</c:if>
							<c:if test="${empty userMap.userImg }">
								<a href="${pageContext.request.contextPath}/walkBlog/${userMap.usersVo.code }">
									<img src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">
								</a>
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
									<a href = "${pageContext.request.contextPath}/walkBlog/${userMap.usersVo.code}/${userMap.walkLogMap.walkLogList[status.index].walkLogNo}">
										<i class="fa-solid fa-chevron-right"></i>
									</a>
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
							<a href="${pageContext.request.contextPath}/walkBlog/${userMap.usersVo.code }">
								<img src="${pageContext.request.contextPath }/rdimg/userProfile/${detailMap.userImg.saveName }">
							</a>
						</c:if>
						<c:if test="${empty detailMap.userImg }">
							<a href="${pageContext.request.contextPath}/walkBlog/${userMap.usersVo.code }">
								<img src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">
							</a>
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
									<a href="${pageContext.request.contextPath}/walkBlog/${userMap.usersVo.code }">
										<img src="${pageContext.request.contextPath }/rdimg/userProfile/${userUsedMap.imgList[status.index].saveName }">
									</a>
								</c:if>
								<c:if test="${empty userUsedMap.imgList[status.index] }">
									<a href="${pageContext.request.contextPath}/walkBlog/${userMap.usersVo.code }">
										<img src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">
									</a>
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
				<div>후기</div>
				<div>산책일지</div>
				<div>모임일지</div>
				<!-- <i class="fa-solid fa-caret-up"></i> -->
			</div>
			
			<div class="comment-container">
				<div class="comment-bar">
					<div class="comment-number"><i class="fa-regular fa-comment-dots"></i>&nbsp;<span>1k</span></div>
					
					<!-- Button trigger modal -->
					<!--
					<c:if test="${!empty authUser }">
						<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addModal">
							후기 작성하기&nbsp;&nbsp;&nbsp;
							<i class="fa-regular fa-images"></i>
						</button>
					</c:if>
					<c:if test="${empty authUser }">
						<button type="button" class="btn btn-secondary">
							후기 작성하기&nbsp;&nbsp;&nbsp;
							<i class="fa-regular fa-images"></i>
						</button>
					</c:if>
					-->
					
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
											<textarea class="form-control modal-input" name="content" id="exampleFormControlTextarea1" rows="3"></textarea>
										</div>
										<div class="mb-3">
											<!-- <label for="formFileMultipleAdd" class="form-label" hidden></label>
											<input class="form-control" type="file" name="file" id="formFileMultipleAdd" multiple> -->
											<div class="dropzone"></div>
										</div>
									</div>
									<div class="preview-list">
										<div class="dz-preview dz-file-preview" id="template">
									        <img data-dz-thumbnail />
										    <button data-dz-remove="data-dz-remove" class="btn btn-sm btn-danger">Delete</button>
										</div>
									</div>
									<%-- <div class="img-content">
										<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
										<div class="imgCount">3</div>
									</div> --%>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-secondary" id="cmtAddBtn">작성</button>
								</div>
							</div>
						</div>
					</div>
					
					<!-- <div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label" for="flexCheckDefault">내 후기만 보기</label>
					</div> -->
					
					<div class="btn-group" role="group" aria-label="Default button group" id="cmt-list-nav">
						<button type="button" class="btn btn-outline-dark">목록</button>
						<button type="button" class="btn btn-outline-dark">갤러리</button>
					</div>
					
					<div class="btn-group" role="group" aria-label="Default button group" id="cmt-order-nav">
						<button type="button" class="btn btn-outline-dark">최신순</button>
						<button type="button" class="btn btn-outline-dark">인기순</button>
					</div>
					
				</div>
				<!-- // comment-bar -->
				
				<div class="comment-list cmt-list"></div>
				<div class="comment-list gallery-list"></div>
				<div class="meetingList"></div>
				<!-- // comment-list -->
			</div>
			<!-- // comment-container -->
		</div>
		<!-- // map-container -->
	</div>
	
	<!-- Button trigger modal -->
	<!-- 
	<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#modifyModal">
		<i class="fa-solid fa-pen"></i>
	</button>
	-->
	
	<!-- detailModal -->
	<div class="detailModal">
		<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content modal-detail">
					<div class="modal-body">
						<div class="img-slider">
							<i class="fa-solid fa-chevron-left"></i>
							<div class="detail-img">
								<div class="detail-img-content">
									<%-- <img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg"> --%>
								</div>
							</div>
							<i class="fa-solid fa-chevron-right"></i>
						</div>
						<div class="img-info detail-modal-info"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script type="text/javascript">

	let useTimeJson = ${useTimeJson };
	let trailNo = ${detailMap.trailVo.trailNo };
	
	window.addEventListener('load', function() {
		fetchList(trailNo);
		markerRender();
	})
	
	/* use time */
	google.charts.load('current', {'packages':['corechart', 'line']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

	  var data = new google.visualization.DataTable();
	  data.addColumn('string', '시간');
	  data.addColumn('number', '이용자수');
	  let datas = [];
	  for(let i = 0; i < 24; i++) {
		  let cnt = 0;
		  for(let j = 0; j < useTimeJson.length; j++) {
		  	  if(i == useTimeJson[j].REGDATE){
		  		  cnt = useTimeJson[j].CNT;
		  	  }
		  }
		  if(0 <= i < 12) {
			  datas.push([i + "am", cnt]);
		  } else if(12 <= i < 24) {
			  datas.push([i + "pm", cnt]);
		  }
	  }
	  data.addRows(datas);

	  var options = {
	    /* title: '산책로 이용 시간대', */
	    height: 450
	  }

	  var chart = new google.visualization.LineChart(document.querySelector('.detail-chart'));

	  chart.draw(data, options);
	}

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
	
	function markerRender() {
		console.log("markerRender()");
		
		for(let i = 0; i < markerCoords.length; i++) {
			if(markerCoords[i] != null) {
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
	}
	
	/* cmt */
	let content = $('textarea[name=content]').val();
	
	var previewNode = document.querySelector("#template");
	previewNode.id = "";
	
	var previewTemplate = previewNode.parentNode.innerHTML;
	previewNode.parentNode.removeChild(previewNode);
	Dropzone.autoDiscover = false;
	
	var dropzone = new Dropzone("div.dropzone", {
		url : '${pageContext.request.contextPath}/walkTrail/cmtImgAdd',
		method : "POST",
		autoProcessQueue : false,
		previewTemplate : previewTemplate,
		previewsContainer : ".preview-list",
		acceptedFiles : '.jpeg,.jpg,.png,.gif,.JPEG,.JPG,.PNG,.GIF',
		uploadMultiple : true,
		parallelUploads : 10,
		maxFiles : 10,
		init : function() {
			console.log('최초 실행');
			let myDropzone = this; // closure 변수

			document.querySelector('#cmtAddBtn').addEventListener('click', function() {
				console.log('업로드 ', dropzone.files);
			});
			 
			this.on('sendingmultiple', function(files) {
				console.log('보내는중 ', files);
			});

			this.on('successmultiple', function(file) {
				console.log('성공');
				
				$('#addModal').modal('hide');
				fetchList(trailNo);
			});
			

			this.on('errormultiple', function() {
			});
		},
	});
	
	document.querySelector('#cmtAddBtn').addEventListener('click', function() {
		if (dropzone.files.length > 10) {
			alert("후기 사진은 10개 까지 가능합니다.");
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/walkTrail/cmtAdd",
				type : "post",
				data : {"trailNo" : trailNo,
						"content" : $('textarea[name=content]').val()},
						
				dataType : "json",
				success : function(trailCmtNo) {
					console.log("trailCmtNo ", trailCmtNo);
					
					if (dropzone.files.length != 0) {
						if(trailCmtNo != 0) {
							dropzone.options.params = {"trailCmtNo" : trailCmtNo};
							dropzone.processQueue();
						}
					} else {
						$('#addModal').modal('hide');
						fetchList(trailNo);
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	});
	// Dropzone has been added as a global variable.
	
	const cmtCnt = document.querySelector(".comment-number span");
	
	function fetchList(trailNo) {
		console.log("fetchList()");
		
		let fetchSet = {
			"trailNo" : trailNo,
			"cmtNav" : cmtIndex,
			"cmtOrderNav" : cmtOrderIndex,
		}
		console.log("fetchSet ", fetchSet);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/walkTrail/cmtListMap",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(fetchSet),
			
			dataType : "json",
			success : function(listMap) {
				console.log("listMap ", listMap);
				
				$(".cmt-list").empty();
				$(".gallery-list").empty();
				$(".meetingList").empty();
				
				cmtCnt.innerText = 0;
				
				if(cmtIndex == 0) {
					console.log("후기 - 목록 / 갤러리");
					
					if(listMap.cmtList.length == 0) {
						nonListRender();
					} else {
						cmtCnt.innerText = listMap.cmtCnt;
						if(cmtListIndex == 0) {
							for(let i = 0; i < listMap.cmtList.length; i++) {
								listRender(listMap, i, "down");
							}
						} else if(cmtListIndex == 1) {
							for(let i = 0; i < listMap.cmtList.length; i++) {
								galleryRender(listMap, i, "down");
							}
						}
					}
				} else if(cmtIndex == 1) {
					console.log("산책일지 목록");
					
					if(listMap.logList.length == 0) {
						nonListRender();
					} else {
						cmtCnt.innerText = listMap.logCnt;
						for(let i = 0; i < listMap.logList.length; i++) {
							walkLogRender(listMap, i, "down");
						}
					}
				} else if(cmtIndex == 2) {
					console.log("모임일지 목록");
					
					if(listMap.logList.length == 0) {
						nonListRender();
					} else {
						cmtCnt.innerText = listMap.logCnt;
						for(let i = 0; i < listMap.logList.length; i++) {
							meetingLogRender(listMap, i, "down");
						}
					}
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
	
	// cmt list
	function listRender(listMap, index, dir) {
		console.log("listRender()");
		
		let content = (listMap.cmtList[index].content == null) ? "" : listMap.cmtList[index].content;
		let path = (listMap.cmtImgList[index][0].saveName == "noImg") ? "" : listMap.cmtImgList[index][0].saveName;
		
		let str = '';
		str += '<div class="comment-detail">';
		str += '	<div class="comment-img cmt-comment-img">';
		if(path != "") {
			if(listMap.cmtImgList[index].length > 1) {
				str += '		<div class="imgCount">' + listMap.cmtImgList[index].length + '</div>';
			}
			str += '		<img src="${pageContext.request.contextPath }/rdimg/trail/' + path + '">';
		}
		str += '	</div>';
		str += '	<div class="comment-content">';
		str += '		<div>' + content + '</div>';
		if(listMap.cmtList[index].usersVo.userNo == listMap.authUserNo) {
			if(listMap.userlikeList[index] == 0) {
				str += '		<span><i class="fa-regular fa-heart cmtStar" data-cmtstarno="' + listMap.cmtList[index].trailCmtNo + '"></i>&nbsp;<span class="childSpan">' + listMap.likeCntList[index] + '</span></span>';
			} else {
				str += '		<span><i class="fa-solid fa-heart cmtStar" data-cmtstarno="' + listMap.cmtList[index].trailCmtNo + '"></i>&nbsp;<span class="childSpan">' + listMap.likeCntList[index] + '</span></span>';
			}
		} else {
			str += '		<span><i class="fa-regular fa-heart"></i>&nbsp;<span class="childSpan">' + listMap.likeCntList[index] + '</span></span>';
		}
		str += '	</div>';
		str += '	<div class="comment-info">';
		if(listMap.userImgList[index] != null) {
			str += '		<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.cmtList[index].usersVo.code + '">';
			str += '			<img src="${pageContext.request.contextPath }/rdimg/userProfile/' + listMap.userImgList[index].saveName + '">';
			str += '		</a>';
		} else {
			str += '		<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.cmtList[index].usersVo.code + '">';
			str += '			<img src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">';
			str += '		</a>';
		}
		str += '		<div class="detail-text">';
		str += '			<span>' + listMap.cmtList[index].usersVo.name + '</span>';
		str += '			<span>' + listMap.cmtList[index].regDate + '</span>';
		str += '		</div>';
		str += '		<div class="user-modify">';
		if(listMap.cmtList[index].usersVo.userNo == listMap.authUserNo) {
			/* str += '			<i class="fa-solid fa-pen"></i>'; */
			str += '			<i class="fa-solid fa-trash" data-cmtdelno="' + listMap.cmtList[index].trailCmtNo + '"></i>';
		}
		str += '		</div>';
		str += '	</div>';
		str += '</div>';
		
 		if(dir == "up") {
 			$(".cmt-list").prepend(str);
		} else if(dir == "down") {
			$(".cmt-list").append(str);
		} else {
			console.log("잘못입력");
		}
 		
 		if(listMap.cmtImgList[index].length > 0) {
 			/* $(".cmt-comment-img").children().last().on("click", function() {
 	 			cmtImgDetail(listMap, index);
 			}) */
 			
 			$(".cmt-comment-img").children().last().on("click", function() {
 	 			cmtImgDetail(listMap, index);
 	 			console.log("listMap.cmtList[index].trailCmtNo ", listMap.cmtList[index].trailCmtNo);
 			})
 		}
	}
	
	// cmt gallery list
	function galleryRender(listMap, index, dir) {
		console.log("galleryRender()");
		
		for(let i = 0; i <listMap.cmtImgList[index].length; i++) {
			let path = (listMap.cmtImgList[index][i].saveName == "noImg") ? "" : listMap.cmtImgList[index][i].saveName
			
			if(path != "") {
				let str = '';
				str += '<div class="gallery-img">';
				str += '	<div class="comment-img">';
				str += '		<img src="${pageContext.request.contextPath }/rdimg/trail/' + path + '">';
				str += '	</div>';
				str += '</div>';
				
				if(dir == "up") {
		 			$(".gallery-list").prepend(str);
				} else if(dir == "down") {
					$(".gallery-list").append(str);
				} else {
					console.log("잘못입력");
				}
				
	 			$(".comment-list").children().last().on("click", function() {
	 				console.log("comment-list click");
	 	 			cmtImgDetail(listMap, index);
	 			})
			}
		}
	}
	
	// cmt detail
	function cmtImgDetail(listMap, index) {
		console.log("cmtImgDetail()");
		
		$(".detail-img-content").empty();
		let str = '';
		for(let i = 0; i < listMap.cmtImgList[index].length; i++) {
			let path = listMap.cmtImgList[index][i].saveName;
			
			// str += '<img src="${pageContext.request.contextPath }/rdimg/trail/' + path + '">';
			str += '<div class="imgBox" style="background-image:url(${pageContext.request.contextPath }/rdimg/trail/' + path + ')"></div>';
		}
		$(".detail-img-content").append(str);
		
		$(".detail-modal-info").empty();
		let infoStr = '';
		if(listMap.cmtList[index].usersVo.userNo == listMap.authUserNo) {
			if(listMap.userlikeList[index] == 0) {
				infoStr += '		<span><i class="fa-regular fa-heart cmtStar" data-cmtstarno="' + listMap.cmtList[index].trailCmtNo + '"></i>&nbsp;<span class="childSpan">' + listMap.likeCntList[index] + '</span></span>';
			} else {
				infoStr += '		<span><i class="fa-solid fa-heart cmtStar" data-cmtstarno="' + listMap.cmtList[index].trailCmtNo + '"></i>&nbsp;<span class="childSpan">' + listMap.likeCntList[index] + '</span></span>';
			}
		} else {
			infoStr += '		<span><i class="fa-regular fa-heart"></i>&nbsp;<span class="childSpan">' + listMap.likeCntList[index] + '</span></span>';
		}
		// infoStr += '<span><i class="fa-regular fa-heart"></i>&nbsp;' + listMap.likeCntList[index] + '</span>';
		infoStr += '<div class="img-info-detail">';
		if(listMap.userImgList[index] != null) {
			infoStr += '		<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.cmtList[index].usersVo.code + '">';
			infoStr += '			<img src="${pageContext.request.contextPath }/rdimg/userProfile/' + listMap.userImgList[index].saveName + '">';
			infoStr += '		</a>';
		} else {
			infoStr += '		<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.cmtList[index].usersVo.code + '">';
			infoStr += '			<img src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">';
			infoStr += '		</a>';
		}
		infoStr += '	<div class="detail-text">';
		infoStr += '		<span>' + listMap.cmtList[index].usersVo.name + '</span>';
		infoStr += '		<span>' + listMap.cmtList[index].regDate + '</span>';
		infoStr += '	</div>';
		infoStr += '	<div class="user-modify">';
		if(listMap.cmtList[index].usersVo.userNo == listMap.authUserNo) {
			infoStr += '			<i class="fa-solid fa-trash" data-cmtdelno="' + listMap.cmtList[index].trailCmtNo + '"></i>';
		}
		infoStr += '	</div>';
		infoStr += '</div>';
		$(".detail-modal-info").append(infoStr);
		
		$('#detailModal').modal("show");
	}
	
	$('#detailModal').on('shown.bs.modal', function() {
		$('.detail-img-content').slick({
			slide: 'div',
			slidesToShow: 1,
			slidesToScroll: 1,
			autoplay: false,
			nextArrow:$('.fa-chevron-right'),
			prevArrow:$('.fa-chevron-left'),
			infinite: true,
		});
	})
	
	$('#detailModal').on('hidden.bs.modal', function() {
		$('.detail-img-content').slick('unslick');
	})
	
	// cmt walkLog list
	function walkLogRender(listMap, index, dir) {
		console.log("walkLogRender()");
		
		// let path = (listMap.logImgList[index].saveName == "noImg") ? "" : listMap.logImgList[index].saveName;
		let dogPath = (listMap.dogImgList[index].saveName == "noImg") ? "" : listMap.dogImgList[index].saveName;
				
		let path = (listMap.logImgList[index].type == "walkLogCon") ? "conImg/" + listMap.logImgList[index].saveName
				: (listMap.logImgList[index].type == "walkLogMap") ? "mapImg/" + listMap.logImgList[index].saveName
				: "";

 		let str = '';
 		str += '<div class="meeting walkLog">';
 		str += '	<div class="meetingTitle walkTitle">';
		str += '		<div class="left walk-title1">' + listMap.infoList[index][0] + '</div>';
		str += '		<div class="left walk-title2">' + listMap.infoList[index][1] + '</div>';
		str += '		<div class="right">' + listMap.logList[index].regDate + '</div>';
		str += '	</div>';
		str += '	<div class="meetingContent">';
		str += '		<div class="meetingInfo left">';
		str += '			<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.logList[index].usersVo.code + '/' + listMap.logList[index].walkLogNo + '">'
		str += '				<p class="info-border">' + listMap.logList[index].title + '</p>';
		str += '			</a>';
		str += '			<div class="img-info">';
		str += '				<div class="img-info-detail">';
		if(listMap.userImgList[index] != null) {
			str += '			<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.logList[index].usersVo.code + '">'
			str += '				<img src="${pageContext.request.contextPath }/rdimg/userProfile/' + listMap.userImgList[index].saveName + '">';
			str += '			</a>';
		} else {
			str += '			<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.logList[index].usersVo.code + '">'
			str += '				<img src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">';
			str += '			</a>';
		}
		str += '					<div class="detail-text">';
		str += '						<span>' + listMap.logList[index].usersVo.name + '</span>';
		str += '						<span><i class="fa-solid fa-thumbs-up"></i>&nbsp;' + listMap.likeCntList[index] + '</span>';
		str += '					</div>';
		if(dogPath != "") {
			str += '					<div class="dog-img leftImg"><img src="${pageContext.request.contextPath}/rdimg/dogProfile/' + dogPath + '"></div>';
			if(listMap.dogCntList[index] > 1) {
				str += '					<div class="imgCount">' + listMap.dogCntList[index] + '</div>';
			}
		} else {
			str += '					<div class="dog-img leftImg"><img src="${pageContext.request.contextPath}/assets/images/dog_default_img.jpg"></div>';
			if(listMap.dogCntList[index] > 1) {
				str += '					<div class="imgCount">' + listMap.dogCntList[index] + '</div>';
			}
		}
		str += '				</div>';
		str += '			</div>';
		str += '		</div>';
		str += '		<div class="left walk-img">';
		str += '			<div class="comment-img">';
		if(path != "") {
			str += '			<img src="${pageContext.request.contextPath }/rdimg/' + path + '">';
			if(listMap.logImgList[index].type == "walkLogCon") {
				if(listMap.logImgCntList[index] > 0) {
					str += '			<div class="imgCount">' + listMap.logImgCntList[index] + '</div>';
				}
			}
		} else {
			str += '			<img src="${pageContext.request.contextPath}/assets/images/map1.jpg">';
		}
		str += '			</div>';
		str += '		</div>';
		str += '	</div>';
		str += '</div>';
		
 		if(dir == "up") {
 			$(".meetingList").prepend(str);
		} else if(dir == "down") {
			$(".meetingList").append(str);
		} else {
			console.log("잘못입력");
		}
	}
	
	// cmt meetingLog list
	function meetingLogRender(listMap, index, dir) {
		console.log("meetingLogRender()");
		
		// let path = (listMap.logImgList[index].saveName == "noImg") ? "" : listMap.logImgList[index].saveName;
		let dogPath = (listMap.dogImgList[index].saveName == "noImg") ? "" : listMap.dogImgList[index].saveName;
				
		let path = (listMap.logImgList[index].type == "walkLogCon") ? "conImg/" + listMap.logImgList[index].saveName
				: (listMap.logImgList[index].type == "walkLogMap") ? "mapImg/" + listMap.logImgList[index].saveName
				: "";

 		let str = '';
 		str += '<div class="meeting walkLog">';
 		str += '	<div class="meetingTitle walkTitle">';
		str += '		<div class="left walk-title1">' + listMap.infoList[index][0] + '</div>';
		str += '		<div class="left walk-title2">' + listMap.infoList[index][1] + '</div>';
		str += '		<div class="right">' + listMap.logList[index].regDate + '</div>';
		str += '	</div>';
		str += '	<div class="meetingContent">';
		str += '		<div class="meetingInfo left">';
		str += '			<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.logList[index].usersVo.code + '/' + listMap.logList[index].walkLogNo + '">'
		str += '				<p class="info-border">' + listMap.meetingList[index].name + '</p>';
		str += '			</a>';
		str += '			<div class="img-info">';
		str += '				<div class="img-info-detail">';
		if(listMap.userImgList[index] != null) {
			str += '			<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.logList[index].usersVo.code + '">'
			str += '				<img src="${pageContext.request.contextPath }/rdimg/userProfile/' + listMap.userImgList[index].saveName + '"></a>';
		} else {
			str += '			<a href="${pageContext.request.contextPath}/walkBlog/' + listMap.logList[index].usersVo.code + '">'
			str += '				<img src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg"></a>';
		}
		str += '					<div class="detail-text">';
		str += '						<span>' + listMap.logList[index].usersVo.name + '</span>';
		str += '						<span><i class="fa-solid fa-thumbs-up"></i>&nbsp;' + listMap.likeCntList[index] + '</span>';
		str += '					</div>';
		if(dogPath != "") {
			str += '					<div class="dog-img leftImg"><img src="${pageContext.request.contextPath}/rdimg/dogProfile/' + dogPath + '"></div>';
			if(listMap.dogCntList[index] > 1) {
				str += '					<div class="imgCount">' + listMap.dogCntList[index] + '</div>';
			}
		} else {
			str += '					<div class="dog-img leftImg"><img src="${pageContext.request.contextPath}/assets/images/dog_default_img.jpg"></div>';
			if(listMap.dogCntList[index] > 1) {
				str += '					<div class="imgCount">' + listMap.dogCntList[index] + '</div>';
			}
		}
		str += '				</div>';
		str += '			</div>';
		str += '		</div>';
		str += '		<div class="left walk-img">';
		str += '			<div class="comment-img">';
		if(path != "") {
			str += '			<img src="${pageContext.request.contextPath }/rdimg/' + path + '">';
			if(listMap.logImgList[index].type == "walkLogCon") {
				if(listMap.logImgCntList[index] > 0) {
					str += '			<div class="imgCount">' + listMap.logImgCntList[index] + '</div>';
				}
			}
		} else {
			str += '			<img src="${pageContext.request.contextPath}/assets/images/map1.jpg">';
		}
		str += '			</div>';
		str += '		</div>';
		str += '	</div>';
		str += '</div>';
		
 		if(dir == "up") {
 			$(".meetingList").prepend(str);
		} else if(dir == "down") {
			$(".meetingList").append(str);
		} else {
			console.log("잘못입력");
		}
	}
	
	function nonListRender() {
		let str = '';
		str += '<div class="comment-detail nonList">';
		str += '	<span>목록이 없습니다.</span>';
		str += '</div>';
		
		$(".cmt-list").append(str);
	}
	
	let cmtListArea = document.querySelector(".cmt-list");
	let galleryListArea = document.querySelector(".gallery-list");
	
	$(".cmt-list").on("click", ".fa-trash", function() {
		console.log("cmt-delete click");
		
		let $this = $(this);
		let cmtNo = $this.data("cmtdelno");
		console.log("cmtNo ", cmtNo);

		if(confirm('후기를 삭제 하시겠습니까?')) {
			$.ajax({
				url : "${pageContext.request.contextPath}/walkTrail/cmtDelete",
				type : "get",
				data : {trailCmtNo : cmtNo},
						
				dataType : "json",
				success : function(deleteCnt) {
					console.log("deleteCnt ", deleteCnt);
					if(deleteCnt) {
						fetchList(trailNo);
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	});
	
	$(".detail-modal-info").on("click", ".fa-trash", function() {
		console.log("cmt-delete click");
		
		let $this = $(this);
		let cmtNo = $this.data("cmtdelno");
		console.log("cmtNo ", cmtNo);
		
		if(confirm('후기를 삭제 하시겠습니까?')) {
			$.ajax({
				url : "${pageContext.request.contextPath}/walkTrail/cmtDelete",
				type : "get",
				data : {trailCmtNo : cmtNo},
						
				dataType : "json",
				success : function(deleteCnt) {
					console.log("deleteCnt ", deleteCnt);
					if(deleteCnt) {
						$('#detailModal').modal('hide');
						fetchList(trailNo);
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	});
	
	$(".trail-delete").on("click", function() {
		console.log("trail-delete click");
		
		if(confirm('산책로를 삭제 하시겠습니까?')) { 
			$.ajax({
				url : "${pageContext.request.contextPath}/walkTrail/trailDelete",
				type : "post",
				data : {"trailNo" : trailNo},
						
				dataType : "json",
				success : function(result) {
					console.log("result ", result);
					
					window.location.href = "${pageContext.request.contextPath}/walkTrail/main?listKey=my";
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	});
	
	/*
	$(".trail-update").on("click", function() {
		console.log("trail-update click");
		
		window.location.href = "${pageContext.request.contextPath}/walkTrail/modifyForm?trailNo=" + trailNo;
	});
	*/
	
	/* trail star */
	let loginStar = document.querySelector(".loginStar");
	$(".loginStar").on("click", function() {
		console.log("loginStar click");
		
		$.ajax({
			url : "${pageContext.request.contextPath}/walkTrail/trailStarUpdate",
			type : "post",
			data : {"trailNo" : trailNo},
					
			dataType : "json",
			success : function(starChk) {
				console.log("starChk ", starChk);
				if(starChk != 0) {
					loginStar.classList.remove("fa-regular");
					loginStar.classList.add("fa-solid");
				} else if(starChk == 0) {
					loginStar.classList.remove("fa-solid");
					loginStar.classList.add("fa-regular");
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	/* cmt star */ 
	let cmtStar = document.querySelector(".cmtStar");
	$(".cmt-list").on("click", ".cmtStar", function() {
		console.log("cmtStar click");
		
		let $this = $(this);
		let cmtNo = $this.data("cmtstarno");
		
		let thisParent = $this.parent();
		let childSpan = thisParent.children(".childSpan");
		
		console.log("childSpan ", childSpan.text());
		
		$.ajax({
			url : "${pageContext.request.contextPath}/walkTrail/cmtStarUpdate",
			type : "get",
			data : {"trailCmtNo" : cmtNo,
					"trailNo" : trailNo},
					
			dataType : "json",
			success : function(cnts) {
				let starChk = cnts[0];
				let cmtCnt = cnts[1];
				
				if(starChk != 0) {
					$this.removeClass("fa-regular");
					$this.addClass("fa-solid");
					
					childSpan.text(cmtCnt);
					
				} else if(starChk == 0) {
					$this.removeClass("fa-solid");
					$this.addClass("fa-regular");
					
					childSpan.text(cmtCnt);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	let detailModalInfo = document.querySelector(".detail-modal-info");
	$(".detail-modal-info").on("click", ".cmtStar", function() {
		console.log("cmtStar click");
		
		let $this = $(this);
		let cmtNo = $this.data("cmtstarno");
		
		let thisParent = $this.parent();
		let childSpan = thisParent.children(".childSpan");
		
		console.log("childSpan ", childSpan.text());
		
		$.ajax({
			url : "${pageContext.request.contextPath}/walkTrail/cmtStarUpdate",
			type : "get",
			data : {"trailCmtNo" : cmtNo,
					"trailNo" : trailNo},
					
			dataType : "json",
			success : function(cnts) {
				let starChk = cnts[0];
				let cmtCnt = cnts[1];
				
				if(starChk != 0) {
					$this.removeClass("fa-regular");
					$this.addClass("fa-solid");
					
					childSpan.text(cmtCnt);
					
				} else if(starChk == 0) {
					$this.removeClass("fa-solid");
					$this.addClass("fa-regular");
					
					childSpan.text(cmtCnt);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	/* comment-nav filter */
 	const cmtGroup = document.querySelectorAll(".comment-nav div");
 	let cmtIndex = 0;
 	
 	cmtGroup[cmtIndex].classList.add("selected");
 	
 	cmtGroup.forEach(function (item, index) {
        item.addEventListener("click", function () {
        	cmtGroup[cmtIndex].classList.remove("selected");
        	cmtIndex = index;
        	cmtGroup[cmtIndex].classList.add("selected");
        	
        	if(cmtIndex == 0) {
        		console.log("후기 선택");
        		
        		cmtListGroup[0].classList.remove("nonList");
        		cmtListGroup[1].classList.remove("nonList");
        	} else if(cmtIndex == 1) {
        		console.log("산책일지 선택");
        		
        		cmtListGroup[0].classList.add("nonList");
        		cmtListGroup[1].classList.add("nonList");
        	} else if(cmtIndex == 2) {
				console.log("모임일지 선택");
        		
				cmtListGroup[0].classList.add("nonList");
        		cmtListGroup[1].classList.add("nonList");
        	}
        	
        	fetchList(trailNo);
        })
    });
 	
 	/* cmt-list-nav filter */
 	const cmtListGroup = document.querySelectorAll("#cmt-list-nav button");
 	let cmtListIndex = 0;
 	
 	cmtListGroup[cmtListIndex].classList.add("selected-order");
 	
 	cmtListGroup.forEach(function (item, index) {
        item.addEventListener("click", function () {
        	cmtListGroup[cmtListIndex].classList.remove("selected-order");
        	cmtListIndex = index;
        	cmtListGroup[cmtListIndex].classList.add("selected-order");
        	
        	fetchList(trailNo);
        })
    });
 	
 	/* cmt-order-nav filter */
 	const cmtOrderGroup = document.querySelectorAll("#cmt-order-nav button");
 	let cmtOrderIndex = 0;
 	
 	cmtOrderGroup[cmtOrderIndex].classList.add("selected-order");
 	
 	cmtOrderGroup.forEach(function (item, index) {
        item.addEventListener("click", function () {
        	cmtOrderGroup[cmtOrderIndex].classList.remove("selected-order");
        	cmtOrderIndex = index;
        	cmtOrderGroup[cmtOrderIndex].classList.add("selected-order");
        	
        	fetchList(trailNo);
        })
    });
 	
</script>
</html>