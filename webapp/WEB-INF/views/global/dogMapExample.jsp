<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <!-- 네이버 지도 API 스크립트를 포함합니다. -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=b9b0wee2jf"></script>
	
	<!--<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tull6ku3q"></script>
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/dogMap.js"></script>
<body>
	맵 위에 선 그리기 (산책로)
	<div id="map" style="width: 100%; height: 600px;"></div>
	<button id="btn">완성</button>
	<script>
		var map = new naver.maps.Map('map',{
			center: new naver.maps.LatLng(37.538012, 127.126008),
		});
		var chk = true;
		var btn = document.querySelector("#btn");
		var btn2 = document.querySelector("#btn2");


		var paths = [
				[ 
					new naver.maps.LatLng(37.5700731, 126.972100),
					new naver.maps.LatLng(37.5700731, 126.972600),
					new naver.maps.LatLng(37.5700731, 126.973100),
					new naver.maps.LatLng(37.5700731, 126.973600),
					new naver.maps.LatLng(37.5700731, 126.974100),
					new naver.maps.LatLng(37.5700731, 126.974600),
					new naver.maps.LatLng(37.5700731, 126.975100),
					new naver.maps.LatLng(37.5700731, 126.975600), 
				],
				[ 
					new naver.maps.LatLng(37.5685000, 126.977000),
					new naver.maps.LatLng(37.5690000, 126.977000),
					new naver.maps.LatLng(37.5695000, 126.977000),
					new naver.maps.LatLng(37.5700000, 126.977000),
					new naver.maps.LatLng(37.5701000, 126.977500),
					new naver.maps.LatLng(37.5702000, 126.978000),
					new naver.maps.LatLng(37.5702000, 126.978500),
					new naver.maps.LatLng(37.5702000, 126.979000),
					new naver.maps.LatLng(37.5702000, 126.979500),
				], 
			]
		for(var j = 0; j < paths.length; j++){
			for (var i = 0; i < paths[j].length; i++) {
				new naver.maps.Marker(
						{
							position : paths[j][i],
							map : map,
							icon : {
								content : '<div style="width:5px; height: 5px; background:red"></div>',
							}
						});
				new naver.maps.Circle({
					map : map,
					center : paths[j][i],
					radius : errorRange,
					fillColor : 'crimson',
					fillOpacity : 0.5
				});
			}
		}
		
		btn.addEventListener("click", function() {
			chk = false;
			console.log(getMatchLine(map,polyline2,polyline3));
			console.log(polyline2.getDistance())
		})

		var polyline = new naver.maps.Polyline({
			map : map,
			path : paths[0],
			strokeColor : '#5347AA',
			strokeWeight : 5,
			clickable : true,
		});
		
		var polyline3 = new naver.maps.Polyline({
			map : map,
			path : paths[1],
			strokeColor : 'green',
			strokeWeight : 5,
			clickable : true,
		});

		var polyline2 = new naver.maps.Polyline({
			map : map,
			path : [],
			strokeColor : '#5347AA',
			strokeWeight : 5,
			clickable : true,
		});
		
		naver.maps.Event.addListener(map,'click',function(e) {
			if (chk) {
				drawLine(map,e.coord,polyline2)
			}
		});
		
	</script>
	
</body>
</html>