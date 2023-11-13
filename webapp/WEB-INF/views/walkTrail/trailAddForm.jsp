<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailAddForm</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
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
						<input type="text" class="form-control" id="trail-name" placeholder="산책로 이름을 입력해주세요." aria-label="Recipient's username" aria-describedby="button-addon2">
						<input type="hidden" name="hiddenName" id="hidden-name" value="0">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2">
							<i class="fa-solid fa-check" id="nameChk"></i>
						</button>
					</div>
					
					<h6 class="infoName">산책로 태그</h6>
					<div class="tag-btn">
						<button class="btn badge btn1">공원 근처</button>
						<button class="btn badge btn1">산 근처</button>
						<button class="btn badge btn1">카페 근처</button>
						<button class="btn badge btn2">넓은 공간</button>
						<button class="btn badge btn2">흙길</button>
						<button class="btn badge btn2">액티비티</button>
						<button class="btn badge btn3 step2">유동인구 많음</button>
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
				<div class="infoBox">
					<i class="fa-solid fa-circle-info"></i>
					<span>산책일지의 반경 범위 내에서 기존 거리보다 짧게만 가능하며, 여러 정보들로 꾸밀 수 있습니다.</span>
					<button type="button" class="btn badge btn-secondary drawBtn" id="btn">그리기 완료</button>
				</div>
				<div class="main-map" id="map"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	/* map */
	let coords = ${coordsJson };
	
   	var map = new naver.maps.Map('map', {
		zoom: 19,
		center: new naver.maps.Point(coords[0].lng, coords[0].lat),
	});
   	var chk = true;
	var btn = document.querySelector("#btn");
	
	var errorRange = 20;	// 오차 범위 (미터단위)
	var matchRate = 70;		// 몇퍼센트 이상 일치해야 하는지 (일치율)
	// var distanceRatio = 90;	// 거리
	
	let overlayPolyline = [];
	let overlayMarker = [];
	let overlayInfoMarker = [];
	
	let logPath = [];
	for(let i = 0; i < coords.length; i++) {
		logPath.push(new naver.maps.LatLng(coords[i].lat, coords[i].lng));
	}
	
	var polyline = new naver.maps.Polyline({
		path: logPath,
        strokeColor: '#6c757d',
        strokeOpacity: 0.8,
        strokeWeight: 3,
        zIndex: 2,
        clickable: true,
        map: map
    });
	
	var marker = new naver.maps.Marker({
		map: map,
		position: logPath[0],
		icon: {
			url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker_.png',
		    size: new naver.maps.Size(30, 30),
		    scaledSize: new naver.maps.Size(30, 30),
       }
    });
	
	var polyline2 = new naver.maps.Polyline({
        path: [],
        strokeColor: '#fc5200',
        strokeOpacity: 0.8,
        strokeWeight: 5,
        zIndex: 2,
        clickable: true,
        map: map
    });
	
	naver.maps.Event.addListener(map, 'click', function(e) {
		if (chk) {
			console.log("chk");
			drawLine(e.coord, polyline2);
		}
	});
	
	/*
		drawLine(map, point, line) = 두 점 사이에 비교군인 점을 추가로 찍어주는 함수
		map = 사용하는 네이버 맵 객체
		point = 방금 찍은 좌표
		line = 그리는 polyline 객체
	*/
	function drawLine(point, line) {
		console.log("drawLine");
		
		let path = line.getPath();
		// 최초로 찍은 점이 아닐때만 
		if(path.length != 0) {
			var projection = map.getProjection();
			// 방금 찍은 점의 전 포인트를 갖고온다
			var prevCoord = path._array[path.length-1];
			// 두 점의 각도를 계산해서 갖고온다
			var degree = getAngle(prevCoord, point);
		    var distance = projection.getDistance(prevCoord, point); // 두 점 사이의 거리 반환
			var spotCount = distance / (errorRange * 2);
			for(var i = 0; i <= spotCount; i++) {
				var newPoint = projection.getDestinationCoord(prevCoord, degree, errorRange * 2 * i);
				path.push(newPoint);
			}
		} else {
			var marker = new naver.maps.Marker({
				map : map,
				position : point,
				icon: {
					url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker.png',
				    size: new naver.maps.Size(30, 30),
				    scaledSize: new naver.maps.Size(30, 30),
		       }
			});
			overlayMarker.push(marker);
		}
		path.push(point);
	}
	
	/*
		getAngle(prevCoord, coord) = 두 점의 각도를 반환하는 함수
		prevCoord = 바로 이전에 찍은 점 좌표
		coord = 방금 찍은 좌표
	*/
	function getAngle(prevCoord, coord) {
		var lat1 = prevCoord.y * Math.PI / 180;
		var lat2 = coord.y * Math.PI / 180;
		var lng1 = prevCoord.x * Math.PI / 180;
		var lng2 = coord.x * Math.PI / 180;
		var y = Math.sin(lng2 - lng1) * Math.cos(lat2);
		var x = Math.cos(lat1) * Math.sin(lat2) -
	      	     Math.sin(lat1) * Math.cos(lat2) * Math.cos(lng2 - lng1);
		var radian = Math.atan2(y,x);
		var degree = (radian * 180 / Math.PI + 360) % 360;
		return degree;
	}
	
	/*
		getMatchLine(map, line, compareLine) = 두 선을 비교해 일치하면 true 아니면 false 반환하는 함수
		map = 사용하는 네이버 맵 객체
		line = 방금 그린 선
		compareLine = 비교할 선 하나
	*/
	function getMatchLine(map, line, compareLine) {
		var paths = line.getPath()._array;
		var comparePaths = compareLine.getPath()._array;
		var projection = map.getProjection();
		var cnt = 0;
		for (var i = 0; i < comparePaths.length; i++) {
			for (var j = 0; j < paths.length; j++) {
				// 두 점사이의 거리를 계산
				var distance = projection.getDistance(paths[j], comparePaths[i]) // 두 좌표 사이의 거리를 반환하는 함수
				// 해당 거리가 오차범위보다 낮다면
				if (distance <= errorRange) {
					// cnt를 1씩 늘려준다
					cnt++;
					// 한 비교군에서 여러번 cnt가 늘어나면 안되기에 break
					break;
				}
			}
		}
		var percent = (cnt / comparePaths.length) * 100;
		if (percent >= matchRate && cnt != 0) {
			return true;
		} else {
			return false;
		}
	}
	
	/* draw btn */
	btn.addEventListener("click", function() {
		
		if(chk) {
			chk = false;
			let check = getMatchLine(map, polyline2, polyline);
			if(check) {
				console.log("그리기 성공!")
			}
			console.log(polyline2.getDistance());
			
			btn.innerText = "다시 그리기";
			btn.classList.add('new-draw');
			
			overlayPolyline.push(polyline2);
			
			// getAddress();
			
		} else {
			chk = true;
			
			btn.innerText = "그리기 완료";
			btn.classList.remove('new-draw');
			
			overlayPolyline[0].setMap(null);
			overlayMarker[0].setMap(null);
			overlayPolyline.length = 0;
			overlayMarker.length = 0;
			
			// let path = polyline2.getPath();
			// console.log("path ", path);
			
			// let newPath = [];
			
			// polyline2.setMap(null);
			// polyline2.setPath(newPath);
		}
	})

	/* coords to address */
	function getAddress() {
		console.log("getAddress()");
		
		let path = polyline2.getPath();
		console.log("path ", path);
		
		naver.maps.Service.reverseGeocode({
	        coords: path[0],
	        orders: [
	            naver.maps.Service.OrderType.ADDR,
	            naver.maps.Service.OrderType.ROAD_ADDR
	        ].join(',')
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }
	
	        var items = response.v2.results,
	            address = '',
	            htmlAddresses = [];
	
	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
	            item = items[i];
	            address = makeAddress(item) || '';
	            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';
	
	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
	        }
				
	        console.log("htmlAddresses ", htmlAddresses);
	        
	        /* infoWindow.setContent([
	            '<div style="padding:10px;min-width:200px;line-height:150%;">',
	            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
	            htmlAddresses.join('<br />'),
	            '</div>'
	        ].join('\n'));
	
	        infoWindow.open(map, latlng); */
	    });
	}
	
	/* info marker */
	const infoGroup = document.querySelectorAll(".form-check button");
 	
 	infoGroup.forEach(function (item, index) {
        item.addEventListener("click", function () {
        	console.log("info marker click", index);
        	
        	if(chk) {
        		alert("산책로 그리기 완료 후 설정해주세요.");
        	} else {
        		let $this = $(this);
        		let infoChk = true;
        		$this.removeClass("new-draw");
        		item.innerText = "설정 중";
        		
        		if(overlayInfoMarker.length != 0) {
					for(let i = 0; i < overlayInfoMarker.length; i++) {
						
						let seq = overlayInfoMarker[i].get('seq');
						console.log("seq ", seq);
						if(seq == index) {
							overlayInfoMarker[i].setMap(null);
							overlayInfoMarker.splice(i, 1);
						}
					}
				}
        		
        		naver.maps.Event.addListener(map, 'click', function(e) {
        			if (infoChk) {
        				console.log("infoChk");
        				
        				var marker = new naver.maps.Marker({
            				map : map,
            				position : e.latlng,
            				icon: {
            					url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker' + index + '.png',
            				    size: new naver.maps.Size(30, 30),
            				    scaledSize: new naver.maps.Size(30, 30),
            		       }
            			});
        				
        				marker.set('seq', index);
                		overlayInfoMarker.push(marker);
                		
                		$this.addClass("new-draw");
                		item.innerText = "다시 설정";
                		
                		infoChk = false;
        			}
        		});
        	}
        })
    });
 	
 	/* name chk */
	var nameChkBtn = document.querySelector("#button-addon2");
	var hiddenName = document.querySelector("#hidden-name");
	var nameChk = document.querySelector("#nameChk");
	
	nameChkBtn.addEventListener("click", function() {
		
		let trailName = document.querySelector("#trail-name");
		
		if (!trailName.value) {
			alert("산책로 이름을 입력해주세요.");
			trailName.focus();
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/walkTrail/confirmName",
				type : "post",
				data : {name: trailName.value},
				
				dataType : "json",
				success : function(result) {
					if(result) {
						console.log("1");
						// nameChk.innerText = "no";
						// Chek.classList.remove('true');
						nameChk.classList.remove('true');
						hiddenName.value = 0;
					} else {
						console.log("0");
						// nameChk.innerText = "ok";
						// $(".Chek").text("사용 가능한 이름입니다.");
						// Chek.classList.add('true');
						nameChk.classList.add('true');
						hiddenName.value = 1;
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	})
	
	/* tag */
 	const tagGroup = document.querySelectorAll(".tag-btn button");
 	let tagActive = false;
 	let tagArr = [];
 	
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
            				tagArr.push(item.innerText);
            			}
            		} else {
            			$this.addClass("selected-tag");
            			tagArr.push(item.innerText);
            		}
        		}
        	}
        	console.log("tagArr ", tagArr);
        })
    });
	
</script>
</html>