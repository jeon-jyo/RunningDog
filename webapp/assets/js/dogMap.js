
var errorRange = 30; // 오차 범위 (미터단위)
var matchRate = 50; // 몇퍼센트 이상 일치해야 하는지

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

/*
	drawLine(map, line, compareLine) = 두 점 사이에 비교군인 점을 추가로 찍어주는 함수
	map = 사용하는 네이버 맵 객체
	point = 방금 찍은 좌표
	line = 그리는 polyline 객체
*/
function drawLine(map, point, line) {
	path = line.getPath();
	// 최초로 찍은 점이 아닐때만 
	if(path.length != 0) {
		var projection = map.getProjection();
		// 방금 찍은 점의 전 포인트를 갖고온다
		var prevCoord = path._array[path.length-1];
		// 두 점의 각도를 계산해서 갖고온다
		var degree = getAngle(prevCoord, point);
	    var distance = projection.getDistance(prevCoord, point); // 두 점 사이의 거리 반환
		var spotCount = distance / (errorRange * 2);
		for(var i = 1; i <= spotCount; i++) {
			var newPoint = projection.getDestinationCoord(prevCoord, degree, errorRange * 2 * i);
			path.push(newPoint);
			
			new naver.maps.Marker({
				position : path._array[path.length-1],
				map : map,
				icon : {
					content : '<div style="width:5px; height: 5px; background:red"></div>',
				}
			});
		} 
		new naver.maps.Marker({ 
			position : point,
			map : map,
			icon : {
				content : '<div style="width:5px; height: 5px; background:red"></div>',
			}
		});
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
