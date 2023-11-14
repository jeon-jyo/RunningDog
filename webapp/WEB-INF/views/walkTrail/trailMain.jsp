<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailMain</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailMain.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<c:if test="${listKey eq 'main' }">
			<h1>추천 산책로</h1>
		</c:if>
		<c:if test="${listKey eq 'my' }">
			<h1>등록한 산책로</h1>
		</c:if>
		<c:if test="${listKey eq 'star' }">
			<h1>찜한 산책로</h1>
		</c:if>

		<div class="explorer">
			<div class="segment-map-filters">
				<div class="input-group mb-3">
					<c:if test="${locationVo.gu != '전체' }">
						<input type="text" class="form-control" id="address" value="${locationVo.si } ${locationVo.gu } ${locationVo.dong }" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
					</c:if>
					<c:if test="${locationVo.gu == '전체' }">
						<input type="text" class="form-control" id="address" value="${locationVo.si }" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
					</c:if>
					<button class="btn btn-outline-secondary" type="button" id="button-addon2">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-secondary modalBtn" data-bs-toggle="modal" data-bs-target="#tagModal"></button>
				<!-- tagModal -->
				<div class="modal fade" id="tagModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">태그 선택</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<button class="btn badge btn1">공원 근처</button>
								<button class="btn badge btn1">산 근처</button>
								<button class="btn badge btn1">카페 근처</button>
								<button class="btn badge btn2">넓은 공간</button>
								<button class="btn badge btn2">흙길</button>
								<button class="btn badge btn2">액티비티</button>
								<button class="btn badge btn3 step2 limit">유동인구 많음</button>
								<button class="btn badge btn3 step2 limit">유동인구 적음</button>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-secondary" id="tagSelected">완료</button>
							</div>
						</div>
					</div>
				</div>
				
				<div class="btn-group" role="group" aria-label="Default button group">
					<button type="button" class="btn btn-outline-dark">이용자순</button>
					<button type="button" class="btn btn-outline-dark">인기순</button>
					<button type="button" class="btn btn-outline-dark">후기순</button>
					<button type="button" class="btn btn-outline-dark">최신순</button>
				</div>

				<c:if test="${listKey eq 'main' }">
					<button type="button" class="btn btn-primary">MY</button>
				</c:if>
				<c:if test="${listKey eq 'my' }">
					<i class="fa-solid fa-circle-plus"></i>
					<button type="button" class="btn btn-primary">자세히 보기</button>
				</c:if>
				<c:if test="${listKey eq 'star' }">
					<button type="button" class="btn btn-primary">자세히 보기</button>
				</c:if>
			</div>

			<div class="main-content">
				<div class="segments-sidebar" id="segments-sidebar">
					<ul id="trailList"></ul>
				</div>
				<i class="fa-solid fa-angles-left" id="fa-angles"></i>
				<div class="main-map" id="map"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	/* location change */
/* 	$("#button-addon2").on("click", function() {
		console.log("button-addon2 click");
		
		let address = $("#address").value;
		console.log("address ", address);
	}); */

	/* map */
   	var map = new naver.maps.Map('map', {
		zoom: 15
	});
   	getCenterCoords();
	let overlayPolyline = [];
	let overlayMarker = [];
	let overlayInfo = [];
	var tooltipInfo = [];
	
	naver.maps.Event.addListener(map, 'zoom_changed', function() {
		getNewCoords();
    })
    naver.maps.Event.addListener(map, 'dragend', function() {
    	getNewCoords();
    })
    
	function getCenterCoords() {
		// console.log("getCenterCoords()");
		
		let location;
		if(${locationVo.gu != '전체' }) {
			location = "${locationVo.si } ${locationVo.gu } ${locationVo.dong }";
		} else {
			location = "${locationVo.si }";
		}
		console.log("location ", location);

		naver.maps.Service.geocode({
	        query: location
	    }, function(status, response) {
	    	if (status !== naver.maps.Service.Status.OK) {
	            return console.log('Something wrong!');
	        }

	        var result = response.v2, 		// 검색 결과의 컨테이너
	            items = result.addresses;	// 검색 결과의 배열
	        
	        map.setCenter(new naver.maps.Point(items[0].x, items[0].y));
	        getNewCoords();
	    });
	}
    
    function getNewCoords() {
    	console.log("getNewCoords()");
    	
		// ne 북동 / sw 남서
		let coordsMap = {
			neX : map.getBounds()._ne.x,
			neY : map.getBounds()._ne.y,
			swX : map.getBounds()._sw.x,
			swY : map.getBounds()._sw.y,
		}
		
		fetchList(coordsMap);
	}
	
    // list
	function fetchList(coordsMap) {
		// console.log("fetchList()");
		
		let listKey = "${listKey }";
		let fetchSet = {
			"coordsMap" : coordsMap,
			"tags" : tags,
			"filter" : filterIndex,
			"listKey" : listKey
		}
		console.log("fetchSet ", fetchSet);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/walkTrail/listMap",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(fetchSet),
			
			dataType : "json",
			success : function(listMap) {
				console.log("listMap ", listMap);
				
				for(let i = 0; i < overlayPolyline.length; i++) {
					overlayPolyline[i].setMap(null);
					overlayMarker[i].setMap(null);
					// overlayInfo[i].setMap(null);
				}
				overlayPolyline.length = 0;
				overlayMarker.length = 0;
				overlayInfo.length = 0;
				$("#trailList").empty();
				
  				for(let i = 0; i < listMap.trailList.length; i++) {
					let trailNo = listMap.trailList[i].trailNo;
					mapRender(listMap.coordsList[i], i, trailNo);
					listRender(listMap.trailList[i], i);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
	
	// coords list
	function mapRender(coords, index, trailNo) {
		// console.log("mapRender()");
		
		let path = [];
		for(let i = 0; i < coords.length; i++) {
			path.push(new naver.maps.LatLng(coords[i].lat, coords[i].lng));
		}
		
		var polyline = new naver.maps.Polyline({
	        path: path,
	        strokeColor: '#fc5200',
	        strokeOpacity: 0.8,
	        strokeWeight: 3,
	        zIndex: 2,
	        clickable: true,
	        map: map
	    });
		
 		var marker = new naver.maps.Marker({
	        map: map,
	        position: path[0],
	        icon: {
	            url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker' + index + '.png',
	            size: new naver.maps.Size(30, 30),
	            scaledSize: new naver.maps.Size(30, 30),
	        }
	    }); 
		
		overlayPolyline.push(polyline);
		overlayMarker.push(marker);
	    
	    trailTooltip(trailNo);
	    
	    var infowindow = new naver.maps.InfoWindow({
			    content: tooltipInfo.join('')
		})
	    
	    overlayInfo.push(infowindow);
	    
	    naver.maps.Event.addListener(marker, "mouseover", function () {
	        polyline.setOptions({
	        	strokeColor: 'red',
	            strokeWeight: 5
	        });
	    });
		
		naver.maps.Event.addListener(marker, "mouseout", function () {
	        polyline.setOptions({
	        	strokeColor: '#fc5200',
	            strokeWeight: 3
	        });
	    });
	    
		naver.maps.Event.addListener(marker, "click", function(e) {
			if (infowindow.getMap()) {
		        infowindow.close();
		    } else {
		    	console.log("infowindow open");
		        infowindow.open(map, marker);
		    }
		});
	}

	function trailTooltip(trailNo) {
		// console.log("trailTooltip()", trailNo);
		
 		$.ajax({
			url : "${pageContext.request.contextPath}/walkTrail/tooltip",
			type : "get",
			data : {trailNo: trailNo},
			
			dataType : "json",
			async : false,
			success : function(infoMap) {
				// console.log("infoMap ", infoMap);
				
				tooltipInfo = [
				    '<div class="iw_inner trail-tootip">',
				    '   <h5>' + infoMap.trailVo.name + '</h5>',
				    '	<div class="trailInfo">',
				    '		<div class="info">',
				    '			<span class="detail-text">' + infoMap.trailVo.distance + '</span>',
				    '			<span class="detail-info">거리</span>',
				    '		</div>',
				    '		<div class="info">',
				    '			<span class="detail-text">' + infoMap.trailVo.eta + '</span>',
				    '			<span class="detail-info">소요시간</span>',
				    '		</div>',
				    '		<div class="vr"></div>',
				    '		<div class="info cntInfo">',
				    '			<span class="detail-text">' + infoMap.trailUsedCnt + '</span>',
				    '			<span class="detail-info">이용자</span>',
				    '		</div>',
				    '		<div class="info cntInfo">',
				    '			<span class="detail-text">' + infoMap.trailStarCnt + '</span>',
				    '			<span class="detail-info">찜</span>',
				    '		</div>',
				    '		<div class="info cntInfo">',
				    '			<span class="detail-text">' + infoMap.trailCmtCnt + '</span>',
				    '			<span class="detail-info">후기</span>',
				    '		</div>',
				    '	</div>',
				    '	<div class="userInfo">',
				    '		<div class="info userDetail">'
				];
				
				if(infoMap.imagesVo != null) {
					tooltipInfo.push(
					    '       <img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang1.jpg" />',
					);
				} else {
					tooltipInfo.push(
					    '       <img src="${pageContext.request.contextPath}/assets/images/walkTrail/sarang2.jpg" />',
					);
				}
				
				tooltipInfo.push(
					'       	<div class="detail-text">',
				    '       		<span>' + infoMap.trailVo.usersVo.name + '</span>',
				 	'       		<span class="detail-info">' + infoMap.trailVo.regDate + '</span>',
				    '       	</div>',
				    '		</div>',
				    '		<div class="info userBtn">상세보기</div>',
				    '	</div>',
				    '</div>'
				);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
	
	// trail list
	function listRender(trailVo, index) {
		// console.log("listRender()");
		
		let str = '';
		str += '<li>';
		str += '	<img calss="markerImg" src="${pageContext.request.contextPath}/assets/images/walkTrail/marker' + index + '.png"/>';
		str += '	<div>';
		str += '		<span class="sideBar-title">' + trailVo.name + '</span><br>';
		str += '		<span>' + trailVo.distance + '</span>';
		str += '		<span>' + trailVo.eta + '</span>';
		str += '	</div>'
		str += '</li>';
		
		$("#trailList").append(str);
		
		$("#trailList").children().last().hover(
			function() {
				overlayPolyline[index].setOptions({
					strokeColor: 'red',
		            strokeWeight: 5
		        });
			},function() {
				overlayPolyline[index].setOptions({
					strokeColor: '#fc5200',
		            strokeWeight: 3
		        });
			}
		);
		
		$("#trailList").children().last().on("click", function() {
			 if (overlayInfo[index].getMap()) {
				 overlayInfo[index].close();
			 } else {
			 	console.log("infowindow open");
			 	overlayInfo[index].open(map, overlayMarker[index]);
			 }
		})
	}
	
	/* Non-list */
 	$("#fa-angles").on("click", function() {
		// console.log("fa-angles click");
		
		if(document.getElementById("map").classList.contains("nonList")) {
			document.getElementById("fa-angles").classList.replace("fa-angles-right", "fa-angles-left");
		} else {
			document.getElementById("fa-angles").classList.replace("fa-angles-left", "fa-angles-right");
		}
		document.getElementById("segments-sidebar").classList.toggle("nonList");
		document.getElementById("map").classList.toggle("nonList");
	});
	
 	/* filter */
 	const filterGroup = document.querySelectorAll(".btn-group button");
 	let filterIndex = 0;
 	
 	filterGroup[filterIndex].classList.add("selected-filter");
 	
 	filterGroup.forEach(function (item, index) {
        item.addEventListener("click", function () {
        	filterGroup[filterIndex].classList.remove("selected-filter");
        	filterIndex = index;
        	filterGroup[filterIndex].classList.add("selected-filter");
        	
        	getNewCoords();
        })
    });
	
	/* tag */
	$(".modalBtn")[0].innerHTML = '태그 선택&nbsp;&nbsp;&nbsp<i class="fa-solid fa-chevron-down"></i>';
	
 	const tagGroup = document.querySelectorAll("#tagModal .modal-body button");
 	let tagActive = false;
 	let tagArr = [];
 	let tags = [];
 	
 	tagGroup.forEach(function (item, index) {
        item.addEventListener("click", function () {
        	
        	let $this = $(this);
        	
        	if($this.hasClass("selected-tag")) {
        		if(tagArr.length != 0) {
            		if($this.hasClass("limit")) {
            			tagActive = false;
        			}
            		$this.removeClass("selected-tag");
            		
        			let tagArrIndex = tagArr.indexOf(item);
        			tagArr.splice(tagArrIndex, 1);
        		}
        	} else {
        		if(tagArr.length < 2) {
        			if($this.hasClass("limit")) {
            			if(!tagActive) {
            				tagActive = true;
            				$this.addClass("selected-tag");
            				tagArr.push(item);
            			}
            		} else {
            			$this.addClass("selected-tag");
            			tagArr.push(item);
            		}
        		}
        	}
        })
    });
 	
 	// tag selected
 	$("#tagSelected").on("click", function() {
		// console.log("tagSelected click");
		
		tagList();
    	
		$('#tagModal').modal('hide');
	});
 	
 	// tag list
 	let tagList = function() {
 		// console.log("tagArr ", tagArr);
 		
 		$(".modalBtn")[0].innerHTML = "";
 		tags.length = 0;
 		
 		if(tagArr.length != 0) {
 			for(let i = 0; i < tagArr.length; i++) {
				let newTag = tagArr[i].cloneNode(true);
				
				$(".modalBtn")[0].append(newTag);
				
				tags.push(tagArr[i].innerText);
			}
 		} else {
 			$(".modalBtn")[0].innerHTML = '태그 선택&nbsp;&nbsp;&nbsp<i class="fa-solid fa-chevron-down"></i>';
 		}
 		
    	getNewCoords();
 	};
 	
</script>
</html>