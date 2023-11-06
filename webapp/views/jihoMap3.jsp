<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jihoMap3</title>
</head>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tull6ku3q"></script>
<body>
	맵 위에 선 그리기 (산책로)
	<div id="map" style="width: 100%; height: 600px;"></div>
	<button id="btn">완성</button>
	<script>
		var map = new naver.maps.Map('map');
		var chk = true;
		var btn = document.querySelector("#btn");
		var errorRange = 30; // 오차 범위 (미터단위)
		var matchRate = 50; // 몇퍼센트 이상 일치해야 하는지

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
			var path3 = polyline2.getPath()._array;
			var projection = map.getProjection();
			console.log(polyline2);
			console.log(path3);
			console.log(path3.length);
			console.log("폴리라인의 전체 길이 : " + polyline2.getDistance());
			var cnt = 0;
			for(var k = 0; k<paths.length; k++) {
				for (var i = 0; i < paths[k].length; i++) {
					for (var j = 0; j < path3.length; j++) {
						var range = projection.getDistance(paths[k][i], path3[j]) // 두 좌표 사이의 거리를 반환하는 함수
						if (range <= errorRange) {
							cnt++;
							break;
						}
					}
				}
				var percent = (cnt / paths[k].length) * 100;
				if (percent >= matchRate && cnt != 0) {
					console.log('일치합니다.');
				} else {
					console.log('일치하지 않습니다.')
				}
			}
			
			console.log(cnt);
			
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
				var point = e.coord;
				var path = polyline2.getPath();
				path.push(e.coord);
				console.log(e.coord)
				var marker = new naver.maps.Marker({ 
					position : e.coord,
					map : map,
					icon : {
						content : '<div style="width:5px; height: 5px; background:red"></div>',
					}
					});
			}
		});
	</script>
</body>
</html>