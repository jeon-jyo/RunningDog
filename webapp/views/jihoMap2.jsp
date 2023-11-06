<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jihoMap2</title>
</head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc"></script>
<body>
	맵 위에 선 그리기 (산책로)
	<div id="map" style="width: 400px; height: 400px;"></div>
	<button id="btn">완성</button>
	<br> 맵 위에 마커 추가하기 (산책 모임)
	<div id="map2" style="width: 400px; height: 400px;"></div>
</body>
<script>
	var map = new naver.maps.Map('map');
	var map2 = new naver.maps.Map('map2');
	var chk = true;
	var btn = document.querySelector("#btn");
	
	var path1;
	var path2;
	var path3;
	
	/* map */
	btn.addEventListener("click", function() {
		chk = false;
	})
	
	var polyline = new naver.maps.Polyline({
		map : map,
		path : [],
		strokeColor : '#5347AA',
		strokeWeight : 5,
		clickable : true,
	});

	naver.maps.Event.addListener(map, 'click', function(e) {
		if (chk) {
			var point = e.coord;
			var path = polyline.getPath();
			path.push(e.coord);
			console.log("경로 지점 : " + e.coord);
		}
	});

	naver.maps.Event.addListener(polyline, 'click', function(e) {
		if (!chk) {
			var marker = new naver.maps.Marker({
				position : e.coord,
				map : map
			});
		}
	});

	/* map2 */
	naver.maps.Event.addListener(map2, 'click', function(e) {
		var marker = new naver.maps.Marker({
			position : e.coord,
			map : map2
		});

		var infoWindow = new naver.maps.InfoWindow({
			content : '<div style="width:150px;text-align:center;padding:10px;">어쩌구모임</div>'
		});

		naver.maps.Event.addListener(marker, 'click', function() {
			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				infoWindow.open(map2, marker);
			}
		});
	});
</script>
</html>