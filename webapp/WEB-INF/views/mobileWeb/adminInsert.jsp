<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	 <style>
        .form-group {
            display: inline-block;
            flex-direction: row;
            align-items: center;
            margin-bottom: 10px;
        }

        .form-group > p {
            margin-right: 10px;
        }

        .form-group > input {
            margin-bottom: 10px;
        }
    </style>

<title>관리자 산책기록넣기</title>
<link href="${pageContext.request.contextPath}/assets/css/walkTrail/trailForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
</head>
<body>
	<div id="map" style="width: 100%; height: 800px;"></div>
	
	<div class="form-group">
        <p>산책일지번호</p>
        <input type="text" name="walkLogNo" id="walkLogNoInput" value="">
    </div>

    <div class="form-group">
        <p>수정 할 거리</p>
        <input type="text" name="logTime" id="logTimeInput" value="">
    </div>

    <div class="form-group">
        <p>수정 할 시간</p>
        <input type="text" name="distance" id="distanceInput" value="">
    </div>

	<script>
	
		let coords = [];

		var map = new naver.maps.Map('map', {
			center : new naver.maps.LatLng(37.538247, 127.125280), // 서울의 좌표를 기본으로 설정
			zoom : 18
		});

		var drawingLine = new naver.maps.Polyline({
			map : map,
			path : coords,
			clickable : true
		});

		naver.maps.Event.addListener(map, 'click', function(e) {
			coords.push({
				x : e.coord.x,
				y : e.coord.y
			});
			drawingLine.setPath(coords);
		});

		function sendDataToServer() {
			// 여기에서 AJAX를 사용하여 서버로 좌표값을 전송하는 코드를 작성
			console.log("작성", coords);
			walkLogNo = $("#walkLogNoInput").val();
			logTime = $("#logTimeInput").val();
			distance = $("#distanceInput").val();
			
			console.log("바꿀 산책일지번호", walkLogNo);
			console.log("바꿀 소요시간", logTime);
			console.log("바꿀 거리", distance);

			$.ajax({
				url : "${pageContext.request.contextPath}/m/adminInsert",
				type : 'POST',
				data : JSON.stringify({
					xyList : coords,
					walkLogNo: walkLogNo,
					logTime: logTime,
					distance: distance
				}),
				contentType : 'application/json',
				success : function(result) {
					console.log("관리자 기록 등록완료");
				},
				error : function(error) {
					console.error('Error:', error);
				}
			});
		}
	</script>

	<button onclick="sendDataToServer()"> 기록하기 </button>
	
	
	
</body>

</html>