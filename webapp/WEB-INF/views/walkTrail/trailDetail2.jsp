<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailDetail</title>
<link
	href="${pageContext.request.contextPath}/assets/css/walkTrail/trailDetail.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1>
			<i class="fa-regular fa-star"></i> &nbsp;${detailMap.trailVo.name }&nbsp;&nbsp;&nbsp;
			<!-- <i class="fa-solid fa-diagram-project"></i> -->
		</h1>

		<div class="section">
			<div class="location">${detailMap.trailVo.spot }</div>
			<div class="stat">
				<span class="stat-subtext">거리</span> <span class="stat-text">${detailMap.info[0] }</span>
			</div>
			<div class="stat stat-margin">
				<span class="stat-subtext stat-margin">소요시간</span> <span
					class="stat-text stat-margin">${detailMap.info[1] }</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">이용자</span> <span class="stat-text">${detailMap.trailUsedCnt }</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">찜</span> <span class="stat-text">${detailMap.trailStarCnt }</span>
			</div>
			<div class="stat">
				<span class="stat-subtext">후기</span> <span class="stat-text">${detailMap.trailCmtCnt }</span>
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
									<c:if
										test="${trailTagVo.tagName == '공원 근처' || trailTagVo.tagName == '산 근처' || trailTagVo.tagName == '카페 근처' }">
										<button class="btn badge btn1">${trailTagVo.tagName }</button>
									</c:if>
									<c:if
										test="${trailTagVo.tagName == '넓은 공간' || trailTagVo.tagName == '흙길' }">
										<button class="btn badge btn2">${trailTagVo.tagName }</button>
									</c:if>
									<c:if
										test="${trailTagVo.tagName == '유동인구 많음' || trailTagVo.tagName == '유동인구 적음' }">
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
							<c:if
								test="${authUser.userNo == detailMap.trailVo.usersVo.userNo }">
								<i class="fa-solid fa-pen"></i>
								<i class="fa-solid fa-trash"></i>
							</c:if>
						</div>
					</div>

					<div class="map-detail-text">${detailMap.trailVo.explanation }
					</div>

					<div class="map-detail-chart detail-border">
						<h2>
							<i class="fa-solid fa-chart-simple"></i>&nbsp;&nbsp;&nbsp;산책로 이용
							시간대
						</h2>
						<div class="detail-chart">chart</div>
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
								<img
									src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
							</c:if>
							<c:if test="${empty userMap.userImg }">
								<img
									src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang5.jpg">
							</c:if>
							<div class="detail-text">
								<span>${userMap.usersVo.name }</span> <span><i
									class="fa-solid fa-person-walking"></i>&nbsp;&nbsp;&nbsp;<strong>${userMap.userUsedCnt }</strong></span>
							</div>
						</c:if>
						<c:if test="${empty userMap }">
							<span>&nbsp;&nbsp;&nbsp;정보가 없습니다.</span>
						</c:if>
					</div>
					<h2>최근 일지</h2>
					<div class="record-bar">
						<c:if test="${!empty userMap.walkLogMap.walkLogList }">
							<c:forEach items="${userMap.walkLogMap.walkLogList }"
								var="walkLogVo" varStatus="status">
								<div class="detail-text">
									<span>${walkLogVo.regDate }</span> <span>${userMap.walkLogMap.infoList[status.index][0] }</span>
									<span>${userMap.walkLogMap.infoList[status.index][1] }</span> <i
										class="fa-solid fa-chevron-right"></i>
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
							<img
								src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
						</c:if>
						<c:if test="${empty detailMap.userImg }">
							<img
								src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang5.jpg">
						</c:if>
						<div class="detail-text">
							<span>${detailMap.trailVo.usersVo.name }</span> <span><i
								class="fa-solid fa-person-walking"></i>&nbsp;&nbsp;&nbsp;<strong>${detailMap.userUsedCnt }</strong></span>
						</div>
					</div>
					<div class="record-bar share-detail">
						<div class="detail-text">
							<span class="textName">작성일</span> <span>${detailMap.trailVo.regDate }</span>
						</div>
						<div class="detail-text">
							<span class="textName">마지막 수정일</span>
							<c:if
								test="${detailMap.trailVo.regDate != detailMap.trailVo.updateDate }">
								<span>${detailMap.trailVo.updateDate }</span>
							</c:if>
						</div>
					</div>
				</div>

				<div class="map-sidebar ranking-sidebar">
					<h2>
						<i class="fa-solid fa-crown"></i>&nbsp;가장 많이 이용한 메이트
					</h2>
					<c:if test="${!empty userUsedMap.userList }">
						<c:forEach items="${userUsedMap.userList }" var="usersVo"
							varStatus="status">
							<div class="ranking-detail-bar">
								<c:if test="${!empty userUsedMap.imgList[status.index] }">
									<img
										src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang2.jpg">
								</c:if>
								<c:if test="${empty userUsedMap.imgList[status.index] }">
									<img
										src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang1.jpg">
								</c:if>
								<div class="detail-text">
									<span>${usersVo.name }</span> <span><i
										class="fa-solid fa-person-walking"></i>&nbsp;&nbsp;&nbsp;<strong>${userUsedMap.usedCntList[status.index] }</strong></span>
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
				<!-- <div>모임일지</div> -->
				<i class="fa-solid fa-caret-up"></i>
			</div>

			<div class="comment-container">
				<div class="comment-bar">
					<div class="comment-number">
						<i class="fa-regular fa-comment-dots"></i>&nbsp;<span>1k</span>
					</div>

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

					<button type="button" class="btn btn-secondary"
						data-bs-toggle="modal" data-bs-target="#addModal">
						후기 작성하기&nbsp;&nbsp;&nbsp; <i class="fa-regular fa-images"></i>
					</button>

					<!-- addModal -->
					<div class="modal fade" id="addModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h1 class="modal-title fs-5" id="exampleModalLabel">후기 작성</h1>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div>
										<div class="mb-3">
											<label for="exampleFormControlTextarea1" class="form-label"
												hidden></label>
											<textarea class="form-control modal-input" name="content"
												id="exampleFormControlTextarea1" rows="3"></textarea>
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
											<button data-dz-remove="data-dz-remove"
												class="btn btn-sm btn-danger">Delete</button>
										</div>
									</div>
									<%-- <div class="img-content">
										<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
										<div class="imgCount">3</div>
									</div> --%>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-light"
										data-bs-dismiss="modal">취소</button>
									<button type="submit" class="btn btn-secondary" id="cmtAddBtn">작성</button>
								</div>
							</div>
						</div>
					</div>

					<!-- <div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
						<label class="form-check-label" for="flexCheckDefault">내 후기만 보기</label>
					</div> -->

					<div class="btn-group" role="group"
						aria-label="Default button group" id="cmt-list-nav">
						<button type="button" class="btn btn-outline-dark">목록</button>
						<button type="button" class="btn btn-outline-dark">갤러리</button>
					</div>

					<div class="btn-group" role="group"
						aria-label="Default button group" id="cmt-order-nav">
						<button type="button" class="btn btn-outline-dark">최신순</button>
						<button type="button" class="btn btn-outline-dark">인기순</button>
					</div>

				</div>
				<!-- // comment-bar -->

				<div class="comment-list"></div>
				<!-- // comment-list -->
			</div>
			<!-- // comment-container -->
		</div>
		<!-- // map-container -->
	</div>

	<!-- Button trigger modal -->
	<button type="button" class="btn" data-bs-toggle="modal"
		data-bs-target="#modifyModal">
		<i class="fa-solid fa-pen"></i>
	</button>

	<!-- modifyModal -->
	<div class="modal fade" id="modifyModal" tabindex="0"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">후기 수정</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
						<div class="mb-3">
							<label for="exampleFormControlTextarea1" class="form-label"
								hidden></label>
							<textarea class="form-control modal-input"
								id="exampleFormControlTextarea1" rows="3"></textarea>
						</div>
						<div class="mb-3">
							<label for="formFileMultipleModi" class="form-label" hidden></label>
							<input class="form-control" type="file" id="formFileMultipleModi"
								multiple>
						</div>
					</div>
					<div class="img-content">
						<img
							src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
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

	<!-- detailModal -->
	<div class="detailModal">
		<div class="modal fade" id="detailModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<div class="img-slider">
							<i class="fa-solid fa-chevron-left"></i>
							<div class="detail-img">
								<div class="detail-img-content">
									<img
										src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
								</div>
							</div>
							<i class="fa-solid fa-chevron-right"></i>
						</div>
						<div class="img-info">
							<span><i class="fa-regular fa-heart"></i>&nbsp;20</span>
							<div class="img-info-detail">
								<img
									src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">
								<div class="detail-text">
									<span>닉네임</span> <span>2023/10/11</span>
								</div>
								<div class="user-modify">
									<i class="fa-solid fa-pen" id="detail-modify-btn"></i> <i
										class="fa-solid fa-trash"></i>
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

	let trailNo = ${detailMap.trailVo.trailNo };
	
	$(document).ready(function() {
		fetchList(trailNo);
	})

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
	
	/* cmt */
 	/* $('#addModal').on('show.bs.modal', function (e) {}); */
 	var previewNode = document.querySelector("#template");
 	previewNode.id = "";
 	
 	var previewTemplate = previewNode.parentNode.innerHTML;
 	previewNode.parentNode.removeChild(previewNode);
 	Dropzone.autoDiscover = false;
 	
 	const dropzone = new Dropzone("div.dropzone", { url: "/file/post",
											 		 autoProcessQueue: false,
											 		 previewTemplate: previewTemplate,
											 		 previewsContainer: ".preview-list",});
 	
 	 var myDropzone = new Dropzone("div.dropzone", {
        url: '/commonfile/do_upload', // 파일 업로드할 url
        method: "POST",
        paramName: 'files',
        params: {
            fk_code:${board.code}
        },
        addRemoveLinks: true,
        dictRemoveFile: "삭제",
        init: function() {
            if(fileCount > 0){
                 var thisDropzone = this;
                 
                 <c:forEach items="${commonFileList}" var="files">
                    var mockFile = {
                          code: "${files.code}",
                          name: "${files.origin_name}",
                          path: "/resources/imgs/${files.thumb_name}"
                        };
                    thisDropzone.emit("addedfile", mockFile);
                    thisDropzone.emit("thumbnail", mockFile, mockFile.path);
                    thisDropzone.emit("complete", mockFile);
                    thisDropzone.files.push(mockFile);
                </c:forEach>
            }
        }
 	};
    // Dropzone has been added as a global variable.
	
    // cmt add
	$("#cmtAddBtn").on("click", function() {
		console.log("cmtAddBtn");
		
		if(dropzone.files.length > 10) {
			alert("후기 사진은 10개 까지 가능합니다.");
		} else {
			console.log("dropzone.files ", dropzone.files);
			
			let content = $('textarea[name=content]').val();
			console.log("content ", content);
			
			let trailVo = {
				trailNo: trailNo
			}
			
			let trailCmtVo = {
				trailVo: trailVo,
				content: content
			}
			
			let imagesList = [];
			if(dropzone.files.length != 0) {
				for(let i = 0; i < dropzone.files.length; i++) {
					/* let ImagesVo = {
						orgName: dropzone.files[i].upload.filename,
						fileSize: dropzone.files[i].upload.size,
						imageOrder: i,
					} */
					imagesList.push(dropzone.files[i]);
				}
			}
			
			console.log("trailCmtVo ", trailCmtVo);
			console.log("imagesList ", imagesList);
			
			let fetchSet = {
				"trailCmtVo" : trailCmtVo,
				"imagesList" : imagesList,
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/walkTrail/cmtAdd",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(fetchSet),
				
				dataType : "json",
				success : function(listMap) {
					console.log("listMap ", listMap);

				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	})
	
	function fetchList(trailNo) {
		console.log("fetchList()");
		
		let fetchSet = {
			"trailNo" : trailNo,
			"cmtNav" : cmtIndex,
			"cmtListNav" : cmtListIndex,
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
				
				$(".comment-list").empty();
				
				if(cmtIndex == 0) {
					if(cmtListIndex == 0) {
						console.log("후기 목록");
						
						if(listMap.cmtList.length == 0) {
							// nonListRender();
						} else {
							for(let i = 0; i < listMap.cmtList.length; i++) {
								listRender(listMap, i, "down");
							}
						}
					} else if(cmtListIndex == 1) {
						console.log("후기 갤러리");
					}
				} else if(cmtIndex == 1) {
					console.log("산책일지 목록");
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
		
		let str = '';
		str += '<div class="comment-detail">';
		str += '	<div class="comment-img">';
		if(listMap.cmtImgList[index].filePath != null) {
			str += '		<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">';
		}
		str += '	</div>';
		str += '	<div class="comment-content">';
		str += '		<div>' + content + '</div>';
		str += '		<span><i class="fa-regular fa-heart"></i>&nbsp;' + listMap.likeCntList[index] + '</span>';
		str += '	</div>';
		str += '	<div class="comment-info">';
		if(listMap.userImgList[index] != null) {
			str += '		<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang3.jpg">';
		} else {
			str += '		<img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang1.jpg">';
		}
		str += '		<div class="detail-text">';
		str += '			<span>' + listMap.cmtList[index].usersVo.name + '</span>';
		str += '			<span>' + listMap.cmtList[index].regDate + '</span>';
		str += '		</div>';
		str += '		<div class="user-modify">';
		if(listMap.cmtList[index].usersVo.userNo == listMap.authUserNo) {
			/* str += '			<i class="fa-solid fa-pen"></i>'; */
			str += '			<i class="fa-solid fa-trash"></i>';
		}
		str += '		</div>';
		str += '	</div>';
		str += '</div>';
		
 		if(dir == "up") {
			$(".comment-list").prepend(str);
		} else if(dir == "down") {
			$(".comment-list").append(str);
		} else {
			console.log("잘못입력");
		}
	}
	
	/* cmt detail modify modal */
	$(".comment-img").on("click", function() {
		$('#detailModal').modal("show");
	});
	
	const modifyModal = document.getElementById('modifyModal');
	
	$("#detail-modify-btn").on("click", function() {
		$('#modifyModal').modal("show");
		modifyModal.focus();
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
        	} else {
        		console.log("산책일지 선택");
        		
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