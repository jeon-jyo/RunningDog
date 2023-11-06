<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jihoMap</title>
</head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc"></script>
<body>
	맵 위에 선 그리기 (산책로)
	<div id="map" style="width: 400px; height: 400px;"></div>
	<button id="btn1">폴리선1 중지</button>
	<button id="btn11">폴리선1 완성</button>
	
	<br> 맵 위에 선 그리기2 (산책로)
	<div id="map2" style="width: 400px; height: 400px;"></div>
	<button id="btn2">폴리선2 중지</button>
	<button id="btn22">폴리선2 완성</button>
</body>
<script>
	var map = new naver.maps.Map('map');
	var chk = true;
	var btn1 = document.querySelector("#btn1");
	var btn11 = document.querySelector("#btn11");
	
	var map2 = new naver.maps.Map('map2');
	var chk2 = true;
	var btn2 = document.querySelector("#btn2");
	var btn22 = document.querySelector("#btn22");
	
	var path1;
	var path2;
	var position1;
	var position2;
	var eqPosition =[];
	
	/* map */
	btn1.addEventListener("click", function() {
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
			var cityHall = new naver.maps.LatLng(e.coord);
			var path = polyline.getPath();
			
			path.push(cityHall);
			/* console.log("경로 지점 : ", cityHall); */
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
	
	btn11.addEventListener("click", function() {
		if (!chk) {
			var path = polyline.getPath();
			
			/* console.log("경로 : ", path);
			console.log("좌표 경계 : ", polyline.getBounds()); */
			console.log("폴리라인의 전체 길이 : " + polyline.getDistance());
			
			path1 = path;
			/* console.log("path1 : ", path1); */
			
/* 			for(var i = 0; i < path1._array.length; i++) {
				var point = "(" + path1._array[i].x + ", " + path1._array[i].y + ")";
				pointArr1.push(point);
			} */
			
			position1 = path1._array;
			console.log("position1 ", position1);
			
/* 			for(var i = 0; i < position1.length; i++) {
				console.log("x", position1[i].x);
				console.log("x+1", position1[i].x+1);
				console.log("x-1", position1[i].x-1);
			} */
		}
	})
	
	/* map2 */
	btn2.addEventListener("click", function() {
		chk2 = false;
	})
	
	var polyline2 = new naver.maps.Polyline({
		map : map2,
		path : [],
		strokeColor : '#5347AA',
		strokeWeight : 5,
		clickable : true,
	});

	naver.maps.Event.addListener(map2, 'click', function(e) {
		if (chk2) {
			
			console.log(e.coord);
			
			var point = e.coord;
			var cityHall = new naver.maps.LatLng(e.coord);
			var path = polyline2.getPath();
			
			path.push(cityHall);
			/* console.log("경로 지점 : ", cityHall); */
		}
	});

	naver.maps.Event.addListener(polyline2, 'click', function(e) {
		if (!chk2) {
			var marker = new naver.maps.Marker({
				position : e.coord,
				map : map2
			});
		}
	});
	
	btn22.addEventListener("click", function() {
		if (!chk2) {
			var path = polyline2.getPath();
			
			/* console.log("경로 : ", path);
			console.log("좌표 경계 : ", polyline2.getBounds()); */
			console.log("폴리라인의 전체 길이 : " + polyline2.getDistance());
			
/* 			for(var i = 0; i < path._array.length; i++) {
				var point = "(" + path._array[i].x + ", " + path._array[i].y + ")";
				pointArr2.push(point);
			} */
			
			position2 = path._array;
			console.log("position2 ", position2);
			
 			for(var i = 0; i < position1.length; i++) {
				for(var j = 0; j < position2.length; j++) {
					
					if(position1[i].x-0.0005 <= position2[j].x <= position1[i].x+0.0005) {
						if(position1[i].y-0.0005 <= position2[j].y <= position1[i].y+0.0005) {
							console.log(position2[j].x , ",", position2[j].y);
							break;
						}
					}
					
				}
			}
		}
	})
	
</script>
</html>