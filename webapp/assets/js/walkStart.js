let time = 0;

let selectedDogNos = []; // 선택된 강아지 번호를 담는 배열

// 보여지는 맵
let map;
// 처음 보여지는 마커
let myLocationMarker;
// 라인 배열
let linePath = [];
// 라인 옵션
let lineOverlay;
// 라인 옵션
let watchId;
// 버튼 설정
let isTracking = false;

let lat;
let lng;
let myLocation;

$(document).ready(function() {

	init();
	buttonEvt();

	// 강아지 프로필사진 슬릭
	$('.profile-circles').slick({
		slidesToShow: 6,
		slidesToScroll: 6,
		infinite: false,
		centerMode: false, // 왼쪽 정렬을 위해 추가
		variableWidth: true // 왼쪽 정렬을 위해 추가
	});

	// 슬라이드 버튼을 숨김
	$('.slick-next, .slick-prev').hide();

	// 페이지 로드 시에 실행
	updateSelectedDogNos();

	// DOM이 완전히 로드된 후에 실행되도록 이벤트 리스너 추가
	$(document).on('click', '.profile-circle', function() {
		togglePSelect($(this));
		updateSelectedDogNos();
	});

	//현재위치 --> 강서구 천호동

	//서버(강서구 천호동)-->
	//리스트 여러개      <--

	//출력
});



function init() {
	document.getElementById("tVal").innerHTML = "00:00:00";
}

function buttonEvt() {
	var hour = 0;
	var min = 0;
	var sec = 0;
	var timer;

	// start btn
	$("#startButton").click(function() {

		timer = setInterval(function() {
			time++;

			min = Math.floor(time / 60);
			hour = Math.floor(min / 60);
			sec = time % 60;
			min = min % 60;

			var th = hour;
			var tm = min;
			var ts = sec;
			if (th < 10) {
				th = "0" + hour;
			}
			if (tm < 10) {
				tm = "0" + min;
			}
			if (ts < 10) {
				ts = "0" + sec;
			}

			document.getElementById("tVal").innerHTML = th + ":" + tm + ":" + ts;

			// 00:00:00 값의 시간을 초값으로 바꿔주기	
			var timeString = th + ":" + tm + ":" + ts;

			console.log("시간값 " + timeString);

			// 시간 문자열을 시, 분, 초로 분리합니다.
			var timeArray = timeString.split(':');

			// 각 부분을 정수로 변환하여 총 초로 계산합니다.
			var totalSeconds = parseInt(timeArray[0]) * 3600 + parseInt(timeArray[1]) * 60 + parseInt(timeArray[2]);

			// 시간 인풋창으로 넘기기
			$("#timeDataInput").val(totalSeconds);

		}, 1000);


	});

	// 아직 미사용 ------------------------------------
	// pause btn
	$("#pausebtn").click(function() {
		if (time != 0) {
			clearInterval(timer);
			starFlag = true;
		}
	});

	// stop btn
	$("#stopButton").click(function() {
		if (time != 0) {
			clearInterval(timer);
			starFlag = true;
			time = 0;
			init();
		}
	});


}
// ---------------------------------------------

// 처음 맵구현
function initMap() {
	// 현재 위치 가져오기
	navigator.geolocation.getCurrentPosition(success, error, options);

	// 시작버튼 클릭
	$("#startButton").on("click", startTracking);
	// 정지버튼 클릭
	$("#stopButton").on("click", stopTracking);
}


// 가져오기 성공
function success(position) {

	let address = '';

	lat = position.coords.latitude;
	lng = position.coords.longitude;

	myLocation = new naver.maps.LatLng(lat, lng);

	console.log("현재 위치는 위도: " + lat + ", 경도: " + lng);

	$("#mapLat").val(lat);
	$("#mapLng").val(lng);

	// 좌표를 주소로 변환하는 함수	  
	naver.maps.Service.reverseGeocode({
		coords: myLocation,
	}, function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			return alert('주소 변환에 실패했습니다.');
		}
		var result = response.v2.results[0];
		address = result.region.area1.name + ' ' + result.region.area2.name + ' ' + result.region.area3.name;

		// 맵 표시
		map = new naver.maps.Map("map", {
			center: myLocation,
			zoom: 19,
			mapDataControl: false,
			caleControl: false,
			logoControl: false
		});

		// 초기 내 위치 반경표시
		mapRadius = new naver.maps.Circle({
			map: map,
			center: myLocation,
			radius: 30,
			fillColor: '#3CFBFF',
			fillOpacity: 0.5
		});

		// 내 위치 마커
		myLocationMarker = new naver.maps.Marker({
			position: myLocation,
			map: map,
			title: "내 위치"
		});

		$("#locationDataInput").val(address);
		console.log('현재 위치의 주소: ' + address);

		// 공백을 기준으로 문자열을 나눕니다.
		let addressArray = address.split(' ');

		let locationVo = {
			si: addressArray[0],
			gu: addressArray[1],
			dong: addressArray[2]
		}
		console.log('현재 위치의 주소: ' + addressArray);

		/*$.ajax({
			url: "locationSelect", // *주의* js 파일에서는 $형식을 사용 못함
			type: "post",
			contentType: "application/json",
			data: JSON.stringify(locationVo),

			dataType: "json",
			success: function(listMap) {
				// Ajax 요청이 성공했을 때 서버에서 전달한 데이터를 처리
				console.log("서버에서 받은 데이터:", listMap);
				// 여기서 data를 사용하여 받아온 값을 처리	

				// trailNo를 기준으로 그룹화한 객체
				var trailGroups = {};

				// 데이터를 trailNo를 기준으로 그룹화
				listMap.forEach(function(coord) {
					var trailNo = coord.trailNo;
					if (!trailGroups[trailNo]) {
						trailGroups[trailNo] = [];
					}
					trailGroups[trailNo].push(coord);
				});

				// 결과 확인
				console.log(trailGroups);

				// trailGroups를 순회하며 Polyline을 그리고 맵에 추가
				for (var trailNo in trailGroups) {
					if (trailGroups.hasOwnProperty(trailNo)) {
						var trailCoords = trailGroups[trailNo].map(function(coord) {
							return new naver.maps.LatLng(coord.lat, coord.lng);
						});

						// Polyline 그리기
						var polyline = new naver.maps.Polyline({
							map: map,
							path: trailCoords,
							strokeColor: '#FF0000', // 선 색상
							strokeWeight: 2, // 선 두께
							strokeOpacity: 0.7 // 선 투명도
						});						
						
						let trailName = trailGroups[trailNo][0].name

						var marker = new naver.maps.Marker({
							position: trailCoords[0],
							map: map,
							icon: {
								content: '<div style="color: black; font-size: 12px;">'+trailName+'</div>', // 여기서 텍스트와 스타일을 지정할 수 있습니다.
								anchor: new naver.maps.Point(0, 0) // 마커의 중심 위치 조정
							}
						});

					}
				}


			},
			error: function(error) {
				// Ajax 요청이 실패했을 때 처리
				console.error("Ajax 요청 실패:", error);
			}

		});*/


	});

}

//----------------------------------------------------------------------
let overlayPolyline = [];
let overlayMarker = [];
let overlayInfo = [];
// coords list

function mapRender(coords, index, trailNo) {
	// console.log("mapRender()");

	let path = [];
	for (let i = 0; i < coords.length; i++) {
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

	naver.maps.Event.addListener(marker, "mouseover", function() {
		polyline.setOptions({
			strokeColor: 'red',
			strokeWeight: 5
		});
	});

	naver.maps.Event.addListener(marker, "mouseout", function() {
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

//----------------------------------------------------------------------


function error(error) {
	console.error("에러 코드: " + error.code);
	console.error("에러 메시지: " + error.message);
}

// 위치 요청 옵션
const options = {
	enableHighAccuracy: false,
	maximumAge: 0,
	timeout: Infinity
};

// 현재시간 구하는 함수
function timeRecode() {
	var currentDate = new Date();

	// 월, 일, 시, 분이 한 자리 숫자인 경우 앞에 0을 추가
	var month = ('0' + (currentDate.getMonth() + 1)).slice(-2);
	var day = ('0' + currentDate.getDate()).slice(-2);
	var hours = ('0' + currentDate.getHours()).slice(-2);
	var minutes = ('0' + currentDate.getMinutes()).slice(-2);

	var formattedDate = currentDate.getFullYear() + '-' + month + '-' + day + ' ' + hours + ':' + minutes;

	console.log(formattedDate);

	// 현재시간을 반환
	return formattedDate;
}


// 시작버튼 클릭 후 작동
function startTracking() {
	if (!isTracking) {
		isTracking = true;
		$("#startButton").hide(); // 시작버튼 가리기
		$("#walkStart").show(); // 정지버튼 보이기 

		console.log("시작버튼 클릭");

		let sTime = timeRecode()

		console.log("시작시간" + sTime);

		document.getElementById('sTimeDataInput').value = sTime;

		// 네비게이션 기능으로 위치정보 받아오기 (3초마다 위치 업데이트)
		updateMyLocation();

		/*watchId = setInterval(updateMyLocation, 3000);  
	    
		// 여기서 강아지 프로필 선택을 막을 수 있습니다.
		$(".profile-circle").off("click");  // 이벤트 제거*/

		// watchId 변수 선언
		let watchId = setInterval(function() {
			updateMyLocation();  // success 함수에서 받아온 위치 정보 전달
		}, 3000);

		// 여기서 강아지 프로필 선택을 막을 수 있습니다.
		$(".profile-circle").off("click");  // 이벤트 제거

		// watchId를 저장하여 나중에 중지할 수 있도록 함
		$(document).data("watchId", watchId);

	}


}

// 정지버튼 클릭 후 작동
function stopTracking() {
	if (isTracking) {
		isTracking = false;
		$("#startButton").show();
		$("#walkStart").hide();

		console.log("종료버튼 클릭");

		// 현재 날짜 및 시간을 가져옵니다.
		//let currentDate = new Date();

		// 원하는 형식으로 날짜 및 시간을 표시합니다.
		//let eTime = currentDate.toISOString().slice(0, 16).replace("T", " ");
		//let eTime = currentDate.toLocaleString().slice(0, 16).replace("T", " ");
		let eTime = timeRecode()

		console.log("종료시간" + eTime);

		document.getElementById('eTimeDataInput').value = eTime;

		console.log("위치정보 받아오기 중단");

		// 위치정보 받아오기 중단
		clearInterval(watchId);

		// 라인 넘기기
		console.log("그려진 라인 정보 : " + linePath);

		// `linePath` 데이터를 `wif` 페이지로 보내고 페이지 이동
		const jsonData = JSON.stringify(linePath.map(function(point) {
			return {
				lat: point._lat,
				lng: point._lng
			};
		}));

		// 데이터를 폼 필드에 설정
		$("#lineDataInput").val(jsonData);

		// 폼 제출
		$("#dataForm").submit();
	}
}


// 마커 아이콘을 생성
const mapIcon = {
	content: '<div style="background-color: blue; width: 10px; height: 10px; border-radius: 50%;"></div>', // 빨간색 원 모양 아이콘
	size: new naver.maps.Size(10, 10), // 아이콘 크기 설정
	anchor: new naver.maps.Point(5, 5), // 아이콘 기준점 설정
	mapDataControl: false,
	caleControl: false,
	logoControl: false
};

let distanceEnd = 0;

// 이동중 현재 위치정보
function updateMyLocation(position) {

	// 이 위치와 if문 안의 위치 사이의 거리값을 구해서 distance에 계속 업데이트해주고
	// 최종적으로 distance 값을 form으로 보내고 컨트롤러까지 보낼것
	console.log("  <<위치갱신>>  ");

	// 처음에 입력된 현재 내 위치를 받아오기
	let mapLat = $("#mapLat").val();
	let mapLng = $("#mapLng").val();
	console.log("처음 위치는 : " + mapLat + ", " + mapLng);

	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {

			// 시작버튼을 누른후의 현재 위치를 구하기	
			let lat = position.coords.latitude;
			let lng = position.coords.longitude;

			// 시작버튼을 누른후의 현재 위치를 myLocation에 넣기
			let myLocation = new naver.maps.LatLng(lat, lng);

			console.log("이동중 현재 위치는 : " + lat + ", " + lng);

			// 시작버튼을 누른후의 현재 위치를 input에 넣기
			$("#mapLat").val(lat);
			$("#mapLng").val(lng);

			// 거리계산 준비        	
			let EARTH_R = 6371000.0;
			let rad = Math.PI / 180;
			let radLat1 = rad * mapLat;
			let radLat2 = rad * lat;
			let radDist = rad * (mapLng - lng);

			let distance = Math.sin(radLat1) * Math.sin(radLat2);
			distance = distance + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radDist);
			let ret = EARTH_R * Math.acos(distance);
			let distance2 = Math.round(ret); // 미터 단위

			// 갱신될때마다 거리 추가해서 업데이트		
			distanceEnd = distanceEnd + distance2;

			console.log("거리m : " + distanceEnd);

			document.getElementById("mVal").innerHTML = distanceEnd + "m";

			// 거리 인풋창으로 넘기기
			$("#distanceDataInput").val(distanceEnd);

			// 이동위치마커 표시할때 처음위치마커 지우기
			if (myLocationMarker) {
				myLocationMarker.setMap(null);
			}

			myLocationMarker = new naver.maps.Marker({
				position: myLocation,
				map: map,
				icon: mapIcon, // 빨간색 아이콘 설정
				title: "이동중 내 위치"
			});

			// 이동위치마커 표시할때 반경 지우기
			if (mapRadius) {
				mapRadius.setMap(null);
			}

			mapRadius = new naver.maps.Circle({
				map: map,
				center: myLocation,
				radius: 30,
				fillColor: '#3CFBFF',
				fillOpacity: 0.5
			});

			// 라인 그리기
			linePath.push(myLocation);
			if (lineOverlay) {
				lineOverlay.setMap(null);
			}

			// 라인 설정
			lineOverlay = new naver.maps.Polyline({
				map: map,
				path: linePath,
				strokeColor: "#ff7f00",
				strokeWeight: 5
			});

			map.setCenter(myLocation);
		});
	}



}

function handleError(error) {
	console.error("위치 정보 가져오기 실패: " + error.message);
}

function togglePSelect($element) {
	// profile-circle 클릭 시 호출되는 함수
	$element.toggleClass('choiceRed');
}

function updateSelectedDogNos() {
	// 선택된 profile-circle 중에서 choiceRed 클래스가 적용된 요소들만 가져오기
	var selectedChoiceRed = $('.choiceRed');

	// 선택된 profile-circle들의 dogNo를 배열로 모아서 설정
	selectedDogNos = selectedChoiceRed.map(function() {
		return $(this).find('.dogDate').val();
	}).get();

	console.log("선택된 강아지 번호 " + selectedDogNos);

	// 배열을 쉼표(,)로 구분된 문자열로 변환
	var dogNosString = selectedDogNos.join(',');

	// 선택된 강아지 번호 배열을 dogDataInput에 설정
	$('#dogDataInput').val(dogNosString);
}

// 모임관련 ------------------------------------------------------

// 현재 URL에서 파라미터 추출
const urlParams = new URLSearchParams(window.location.search);

// meetingNo 파라미터의 값을 가져옴
const meetingNo = urlParams.get('meetingNo');

// meetingNo가 존재하는 경우 출력
if (meetingNo !== null) {
    console.log("meetingNo:" + meetingNo);
    $('#meetingNoDataInput').val(meetingNo);
}

 
$(".meetingClick").on("click",function() {
	alert("모임장에게 기록을 요청해 주세요.")	
	console.log("모임장에게 기록을 요청해 주세요.");
})



