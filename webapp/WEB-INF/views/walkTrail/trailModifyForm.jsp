<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
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
				<div class="addInfo">예상 소요시간 : <strong id="trail-eta"></strong></div>
				<div class="addInfo">거리 : <strong id="trail-distance"></strong></div>
				<div class="addInfo" id="trail-address"></div>
				<i class="fa-solid fa-location-pin-lock"></i>
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
						<input class="form-check-input" type="checkbox" role="switch" id="switchCheck1">
						<label class="form-check-label" for="switchCheck1"></label>
						<button type="button" class="btn badge btn-secondary new-draw">위치 설정</button>
					</div>
					
					<h6>화장실</h6>
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="switchCheck2">
						<label class="form-check-label" for="switchCheck2"></label>
						<button type="button" class="btn badge btn-secondary new-draw">위치 설정</button>
					</div>
					
					<h6>쓰레기통</h6>
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="switchCheck3">
						<label class="form-check-label" for="switchCheck3"></label>
						<button type="button" class="btn badge btn-secondary new-draw">위치 설정</button>
					</div>
					
					<h6 class="infoName">설명</h6>
					<div class="mb-3">
						<label for="exampleFormControlTextarea1" class="form-label" hidden></label>
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
				</div>
				<div class="infoBox">
					<i class="fa-solid fa-circle-info"></i>
					<span>산책로의 이름과 태그, 마커, 설명을 수정할 수 있습니다.</span>
					<!-- <button type="button" class="btn badge btn-secondary drawBtn" id="btn">그리기 불가</button> -->
				</div>
				<div class="main-map" id="map"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	/* map */
	// let detailMap = ${detailMap };
	let trailVo = ${detailMap.trailVoJson };
	let info = ${detailMap.infoJson };
	let tagList = ${detailMap.tagListJson };
	let coords = ${detailMap.coordsJson };
	let markers = ${detailMap.markersJson };
	
   	var map = new naver.maps.Map('map', {
		zoom: 19,
		center: new naver.maps.Point(coords[0].lng, coords[0].lat),
	});

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
	
	/* coords to address */
	let addressInfo = document.querySelector("#trail-address");
	let distanceInfo = document.querySelector("#trail-distance");
	let etaInfo = document.querySelector("#trail-eta");
	let locationInfo;
	let infoNum;
	
	getTrailInfo();
	
	function getTrailInfo() {
		addressInfo.innerText = trailVo.spot;
        distanceInfo.innerText = info[0];
        etaInfo.innerHTML = info[1];
	}
	
	/* trail Add */
	let addBtn = document.querySelector(".fa-circle-check");
	let switchCheck1 = document.querySelector("#switchCheck1");
	let switchCheck2 = document.querySelector("#switchCheck2");
	let switchCheck3 = document.querySelector("#switchCheck3");
	let contentInfo = document.querySelector("#exampleFormControlTextarea1");
	let parkingSpot;
	let restroomSpot;
	let trashCanSpot;
	
	addBtn.addEventListener("click", function() {
		console.log("==========addBtn click==========");
		
		if(hiddenName.value == '0') {
			alert("산책로 이름을 확인해주세요.");
		} else if(addressInfo.innerText == "") {
			alert("산책로를 그려주세요.");
		} else {
			
			if(overlayInfoMarker.length != 0) {
				for(let i = 0; i < overlayInfoMarker.length; i++) {
					
					let seq = overlayInfoMarker[i].get('seq');
					let position = overlayInfoMarker[i].getPosition();
					
					if(seq == 0) {
						parkingSpot = overlayInfoMarker[i].getPosition();
						// console.log("parkingSpot ", parkingSpot);
					} else if(seq == 1) {
						restroomSpot = overlayInfoMarker[i].getPosition();
						// console.log("restroomSpot ", restroomSpot);
					} else if(seq == 2) {
						trashCanSpot = overlayInfoMarker[i].getPosition();
						// console.log("trashCanSpot ", trashCanSpot);
					}
				}
			}
			
			let locationVo = {
				locationNo : locationInfo
			}
			// console.log("locationVo ", locationVo);
			
			let trailVo = {
				locationVo : locationVo,
				name : trailName.value,
				spot : addressInfo.innerText,
				distance : infoNum,
				eta : infoNum,
				explanation : contentInfo.value
			}
			// console.log("trailVo ", trailVo);
			
			let infoCheck = {
				parking : switchCheck1.checked,
				restroom : switchCheck2.checked,
				trashCan : switchCheck3.checked
			}
			// console.log("infoCheck ", infoCheck);

			let infoMarker = {
				parking : parkingSpot,
				restroom : restroomSpot,
				trashCan : trashCanSpot
			}
			// console.log("infoMarker ", infoMarker);
			
			let paths = polyline2.getPath()._array;
			let coordsList = [];
			for(let i = 0; i < paths.length; i++) {
				let coordsMap = {
					x : paths[i]._lng,
					y : paths[i]._lat,
					coordOrder : i+1,
				}
				coordsList.push(coordsMap);
			}
			// console.log("coordsList ", coordsList);
			
			let fetchSet = {
				"trailVo" : trailVo,
				"infoCheck" : infoCheck,
				"infoMarker" : infoMarker,
				"coordsList" : coordsList,
				"tagArr" : tagArr
			}
			console.log("fetchSet ", fetchSet);
			
 			$.ajax({
				url : "${pageContext.request.contextPath}/walkTrail/trailAdd",
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(fetchSet),
				
				dataType : "json",
				success : function(insertCnt) {
					console.log("insertCnt ", insertCnt);
					
					if(insertCnt ==1) {
						window.location.href = "${pageContext.request.contextPath}/walkTrail/main?listKey=my";
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	})
	
	/* info check */
	const infoChkGroup = document.querySelectorAll(".form-check input");
	
	infoChkGroup.forEach(function (item, index) {
        item.addEventListener("click", function () {
        	// console.log("infoChkGroup click", index);
        	
        	let $this = $(this);
        	let itemChecked = item.checked;
        	
        	if(itemChecked) {
        		infoGroup[index].classList.remove("new-draw");
        		infoGroup[index].innerText = "위치 설정";
        	} else {
        		infoGroup[index].classList.add("new-draw");
        		infoGroup[index].innerText = "위치 설정";
        		
        		if(overlayInfoMarker.length != 0) {
					for(let i = 0; i < overlayInfoMarker.length; i++) {
						
						let seq = overlayInfoMarker[i].get('seq');
						if(seq == index) {
							overlayInfoMarker[i].setMap(null);
							overlayInfoMarker.splice(i, 1);
						}
					}
				}
        	}
        })
    });
	
	/* info marker */
	const infoGroup = document.querySelectorAll(".form-check button");
 	
 	infoGroup.forEach(function (item, index) {
        item.addEventListener("click", function () {
        	// console.log("infoGroup click", index);
        	
        	let $this = $(this);
        	
        	if($this.hasClass("new-draw") === false || item.innerText == "다시 설정") {
        		if(chk) {
            		alert("산책로 그리기 완료 후 설정해주세요.");
            	} else {
            		let markerChk = true;
            		$this.removeClass("new-draw");
            		item.innerText = "설정 중";
            		
            		if(overlayInfoMarker.length != 0) {
    					for(let i = 0; i < overlayInfoMarker.length; i++) {
    						let seq = overlayInfoMarker[i].get('seq');
    						if(seq == index) {
    							overlayInfoMarker[i].setMap(null);
    							overlayInfoMarker.splice(i, 1);
    						}
    					}
    				}
            		
            		naver.maps.Event.addListener(map, 'click', function(e) {
            			if (markerChk) {
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
                    		markerChk = false;
            			}
            		});
            	}
        	}
        })
    });
 	
 	/* confirm name */
	let nameChkBtn = document.querySelector("#button-addon2");
	let trailName = document.querySelector("#trail-name");
	let hiddenName = document.querySelector("#hidden-name");
	let nameChk = document.querySelector("#nameChk");
	
	nameChkBtn.addEventListener("click", function() {
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
						nameChkBtn.classList.remove('true');
						nameChk.classList.remove('true');
						hiddenName.value = 0;
					} else {
						nameChkBtn.classList.add('true');
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
	
	$('#trail-name').change(function() {
		nameChkBtn.classList.remove('true');
		nameChk.classList.remove('true');
		hiddenName.value = 0;
	});
	
	/* tag */
 	const tagGroup = document.querySelectorAll(".tag-btn button");
 	let tagActive = false;
 	let tagArr = [];
 	tagArr = tagList;
 	
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
        			console.log("tagArr - ", tagArr);
        		}
        	} else {
        		if(tagArr.length < 2) {
        			if($this.hasClass("limit")) {
            			if(!tagActive) {
            				tagActive = true;
            				$this.addClass("selected-tag");
            				tagArr.push(item.innerText);
            				console.log("tagArr + ", tagArr);
            			}
            		} else {
            			$this.addClass("selected-tag");
            			tagArr.push(item.innerText);
            			console.log("tagArr + ", tagArr);
            		}
        		}
        	}
        	console.log("tagArr ", tagArr);
        })
    });
	
</script>
</html>