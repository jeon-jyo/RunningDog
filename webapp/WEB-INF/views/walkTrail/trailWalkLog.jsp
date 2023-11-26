<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailWalkLog</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailMain.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1 class="myList">산책로 등록</h1>

		<div class="explorer">
			<div class="segment-map-filters">
				<div class="input-group mb-3">
					<c:if test="${locationVo.gu != '전체' }">
						<input type="text" class="form-control addressChange" id="address" value="${locationVo.si } ${locationVo.gu } ${locationVo.dong }" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
					</c:if>
					<c:if test="${locationVo.gu == '전체' }">
						<input type="text" class="form-control addressChange" id="address" value="${locationVo.si }" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
					</c:if>
					<button class="btn btn-outline-secondary" type="button" id="button-addon2">
						<i class="fa-solid fa-magnifying-glass"></i>
					</button>
				</div>
				
				<div class="btn-group" role="group" aria-label="Default button group">
					<button type="button" class="btn btn-outline-dark">최신순</button>
					<button type="button" class="btn btn-outline-dark">오래된순</button>
					<button type="button" class="btn btn-outline-dark">좋아요순</button>
				</div>
				
				<span>나의 산책일지 기록으로 마음에 드는 산책로를 만들어 보세요!</span>

				<i class="fa-solid fa-pen-to-square" id="trailAddFormGo"></i>
				<button type="button" class="btn btn-primary walkLogGoBtn">일지 보기</button>
				<input type="hidden" name="hiddenCode" id="hidden-code" value="${authUser.code}">
			</div>

			<div class="main-content">
				<div class="segments-sidebar walkLog" id="segments-sidebar">
					<h6>나의 산책일지</h6>
					<ul id="walkLogList"></ul>
				</div>
				<i class="fa-solid fa-angles-left" id="fa-angles"></i>
				<div class="main-map" id="map"></div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="addressModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<input type="text" class="form-control" id="searchAddressInput" placeholder="구 혹은, 동으로 검색해보세요">
					<button id="searchAddressBtn" type="button" class="btn btn-primary">동네 검색</button>
				</div>
				<form id="" method="post" action="">
					<div class="modal-body">
						<div id="showAddressList" class="form-group">
							<table id="addressListTable">
								<thead id="theadTr">
									<tr>
										<td>시</td>
										<td>구</td>
										<td>동</td>
									</tr>
								</thead>
								<tbody id="addressListTbody"></tbody>
							</table>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	/* location change */
	$(".addressChange").on("click", () => {
		console.log("addressChange click");
	
		$("#addressModal").modal("show");
	});
	
	$("#searchAddressBtn").on("click", () => {
		const keyword = $("#searchAddressInput").val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/setting/selectAddressList",
			type : "post",
			data : {keyword: keyword},
	
			dataType : "json",
			success : function(addressList) {
				console.log("addressList", addressList);
				
				$("#addressListTbody").html("");
				
				for(let i = 0; i<addressList.length; i++){
					render(addressList[i]);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});	
	
	function render(userVo) {
		let str = '';
		str += '<tr data-lno="' + userVo.locationNo + '" class="addressSelect">';
		str += '	<td class="si">' + userVo.si + '</td>';
		str += '	<td class="gu">' + userVo.gu + '</td>';
		str += '	<td class="dong">' + userVo.dong + '</td>';
		str += '</tr>';
		
		$("#addressListTbody").append(str);
	};
	
	$("#addressListTable").on("click", ".addressSelect", function() {
		let $this = $(this);
		let lno = parseInt($this.data("lno"));
		
		let si = $this.children(".si").text();
		let gu = $this.children(".gu").text();
		let dong = $this.children(".dong").text();
		
		let location = si + " " + gu + " " + dong;
		$("#address").val(location);
		$("#addressModal").modal("hide");
		ChangeCenterCoords(location);
	});
	
	let hiddenCode = document.querySelector("#hidden-code");
	
	$(".walkLogGoBtn").on("click", function() {
		// console.log("walkLogGoBtn click");
		
		if(overlayMarker.length == 0) {
			alert("산책일지를 선택해주세요.");
		} else {
	        let seq = overlayMarker[0].get('seq');
	        let code = hiddenCode.value;
	        
	        console.log(seq, code);
			
	        window.location.href = "${pageContext.request.contextPath}/walkBlog/" + code + "/" + seq;
		}
	});
	
	$("#trailAddFormGo").on("click", function() {
		// console.log("trailAddFormGo click");
		
		if(overlayMarker.length == 0) {
			alert("산책일지를 선택해주세요.");
		} else {
	        let seq = overlayMarker[0].get('seq');
			
	        window.location.href = "${pageContext.request.contextPath}/walkTrail/addForm?walkLogNo=" + seq;
		}
	});

	/* map */
   	var map = new naver.maps.Map('map', {
		zoom: 15
	});
   	getCenterCoords();
	let overlayPolyline = [];
	let overlayMarker = [];
	
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
	
    function ChangeCenterCoords(location) {
		console.log("ChangeCenterCoords()");
		
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
		
		let fetchSet = {
			"coordsMap" : coordsMap,
			"filter" : filterIndex
		}
		console.log("fetchSet ", fetchSet);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/walkTrail/walkLogList",
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(fetchSet),
			
			dataType : "json",
			success : function(walkLogList) {
				console.log("walkLogList ", walkLogList);
				
				for(let i = 0; i < overlayPolyline.length; i++) {
					overlayPolyline[i].setMap(null);
					overlayMarker[i].setMap(null);
				}
				overlayPolyline.length = 0;
				overlayMarker.length = 0;
				$("#walkLogList").empty();
				
				if(walkLogList.length == 0) {
					nonListRender();
				} else {
					for(let i = 0; i < walkLogList.length; i++) {
						listRender(walkLogList[i]);
					}
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
    
	// walkLog list
	function listRender(walkLogVo) {
		// console.log("listRender()");
		let walkLogNo = walkLogVo.walkLogNo;
		let distanceInfo = "";
		let etaInfo = "";
		
        if(walkLogVo.distance >= 1000) {
        	distanceInfo = Math.floor(walkLogVo.distance / 1000) + "." + Math.floor((walkLogVo.distance % 1000) / 10) + "km";
        } else {
        	distanceInfo = walkLogVo.distance + "m";
        }
        
        let minute = Math.floor(walkLogVo.logTime / 60);
        if(60 <= minute) {
        	let hour = Math.floor(minute / 60);
        	minute -= hour * 60;
        	etaInfo +=  hour +  "시간 ";
        }
        etaInfo += minute + "분";
		
		let str = '';
		str += '<li>';
		str += '	<img calss="markerImg" src="${pageContext.request.contextPath}/assets/images/walkTrail/marker.png"/>';
		str += '	<div>';
		str += '		<span class="sideBar-title">' + walkLogVo.walkLogNo + " / " + walkLogVo.regDate + '</span><br>';
		str += '		<span>' + distanceInfo + '</span>';
		str += '		<span>' + etaInfo + '</span>';
		str += '	</div>'
		str += '</li>';
		
		$("#walkLogList").append(str);
		
  		$("#walkLogList").children().last().hover(
			function() {
				fetchMapList(walkLogNo);
			}
		);
		
		$("#walkLogList").children().last().on("click", function() {
			fetchMapList(walkLogNo);
		})
	}
	
	function nonListRender() {
		console.log("nonListRender()");
		
		let str = '';
		str += '<li class="nonList">';
		str += '	<div>';
		str += '		<span class="sideBar-title">목록이 없습니다.</span><br>';
		str += '	</div>'
		str += '</li>';
		
		$("#walkLogList").append(str);
	}
	
	// coords map list
	function fetchMapList(walkLogNo) {
		// console.log("fetchMapList()");
		
		$.ajax({
			url : "${pageContext.request.contextPath}/walkTrail/walkLogMap",
			type : "get",
			data : {walkLogNo: walkLogNo},
			
			dataType : "json",
			success : function(coords) {
				// console.log("coords ", coords);
				
				for(let i = 0; i < overlayPolyline.length; i++) {
					overlayPolyline[i].setMap(null);
					overlayMarker[i].setMap(null);
				}
				overlayPolyline.length = 0;
				overlayMarker.length = 0;
				
				mapRender(coords, walkLogNo);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
	
	// coords list
	function mapRender(coords, walkLogNo) {
		// console.log("mapRender()");
		console.log("walkLogNo ", walkLogNo);
		
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
	            url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker.png',
	            size: new naver.maps.Size(30, 30),
	            scaledSize: new naver.maps.Size(30, 30),
	        }
	    }); 
 		marker.set('seq', walkLogNo);
 		
		overlayPolyline.push(polyline);
		overlayMarker.push(marker);

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
 	
</script>
</html>