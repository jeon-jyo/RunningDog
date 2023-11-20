	// 날짜표시
	const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    document.getElementById("text02").innerHTML = new Date().toLocaleDateString('ko-KR', options);

	// 경로로 표시할 배열(array)
	// naver.maps.LatLng 위도 경도 변수
	var polylinePath = [];	

	// 컨트롤러에서 전달한 lineList 데이터를 JSON 형식으로 파싱
    var jsonString = '${lineList}'; // JSON 형식의 문자열
	var lineList = JSON.parse(jsonString);
    
    // lineList의 각 항목을 polylinePath 배열에 추가
    for (var i = 0; i < lineList.length; i++) {
        var lat = lineList[i].lat;
        var lng = lineList[i].lng;
        polylinePath.push(new naver.maps.LatLng(lat, lng));
    }
    
    console.log("내 이동 경로 표시 : " + polylinePath);	  
    
    
  
	// 중간 지점을 계산
	var totalLat = 0;
	var totalLng = 0;

	// 모든 좌표의 합을 계산
	for (var i = 0; i < polylinePath.length; i++) {
	    totalLat += polylinePath[i].y;
	    totalLng += polylinePath[i].x;
	}

	// 평균 좌표 계산
	var avgLat = totalLat / polylinePath.length;
	var avgLng = totalLng / polylinePath.length;

    //지도 표시
    var map = new naver.maps.Map('map', {
        zoom: 18,
        center: new naver.maps.LatLng(avgLat, avgLng),
		mapDataControl : false,
		scaleControl : false,
		caleControl: false,
        logoControl: false
    });

    //위의 배열을 이용해 라인 그리기
    var polyline = new naver.maps.Polyline({
        path: polylinePath,      //선 위치 변수배열
        strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
        strokeOpacity: 0.8, //선 투명도 0 ~ 1
        strokeWeight: 6,   //선 두께
        map: map           //오버레이할 지도
    });
    
 	// 배열 첫번째 위치를 마크로 표시함
    var firstMarker = new naver.maps.Marker({
	    position: polylinePath[0], // 첫 번째 위치
	    map: map
	});

    // 배열 마지막 위치를 마크로 표시함
    var marker = new naver.maps.Marker({
        position: polylinePath[polylinePath.length-1], //마크 표시할 위치 배열의 마지막 위치
        map: map
    });
    	    
    // 기록하기
    $(document).ready(function() {
	    $("#insertBtn").click(function() {	    	
	    	console.log("기록완료");
	    	
	    	sendLinePathToController();
	    	
	    	var formData = new FormData();

	        // 파일 추가
	        formData.append('file', $('#fileInput')[0].files[0]);
	         
	        console.log("첨부된 파일 : " + formData);
	    	
	    	console.log("기록된 위치 재확인 1 : " + polylinePath);
	    	console.log("기록된 위치 재확인 2 : " + jsonString);
	    	
	    	console.log("기록된 위치 재확인 3 : " + '${lineList}');		    	
	    	
	    	console.log("산책한 강아지 정보 : " + '${dogNoList}');
	    	
	    	console.log("시작시간 : " + '${moWalkLogVo.startTime}');
	    	var startTime = '${moWalkLogVo.startTime}';
	    	
	    	console.log("종료시간 : " + '${moWalkLogVo.endTime}');
	    	var endTime = '${moWalkLogVo.endTime}';
	    	
	    	console.log("소요시간 : " + '${moWalkLogVo.logTime}');
	    	var logTime = '${moWalkLogVo.logTime}';
	    	
	    	console.log("거리 : " + '${moWalkLogVo.distance}');
	    	var distance = '${moWalkLogVo.distance}';
	    	
	    	$.ajax({
	               type: 'POST',
	               url: "${pageContext.request.contextPath}/m/walkInsert",
	             contentType : "application/json",
	               // data: { linePath: JSON.stringify(linePath) },
				    data: JSON.stringify({
				        line: polylinePath,
				        startTime: startTime,
				        endTime: endTime,
				        logTime: logTime,
				        distance: distance
				    }),
	               /* data: {line: jsonString,
	            	      startTime: startTime,
	            	      endTime: endTime,
	            	      logTime: logTime,
	            	      distance: distance
	            	      }, */
	               //traditional: true,
	               success: function (response) {
	                  console.log("기록완료");
	                  window.location.href = "${pageContext.request.contextPath}/m/map";
	               },
	               error: function (error) {
	                 console.error('Error sending data to the controller:', error);
	               }
	        });
	    	
        	// 폼 제출 
	    	//$("#dataForm").submit();  
        });
    }); 	    
    
    // 기록하지 않음
    $(document).ready(function() {
        $(".back").click(function() {
            // 여기에 이동할 링크를 넣어주세요
            window.location.href = "${pageContext.request.contextPath}/m/map";
        });
    }); 
    
    // 라인 컨트롤러로 넘기기
    function sendLinePathToController(jsonString) {
         // Replace 'your_controller_url' with the actual URL of your controller
         console.log("기록된 위치 재확인 : " + jsonString);
         
       /*   // JavaScript에서 데이터를 linePathVo와 일치하는 구조로 변환 (x와 y 제외)
         const linePathData = linePath.map(function (point) {
           return {
             lat: point._lat,
             lng: point._lng
           };
         });
         
         // JSON형식으로 변환하기
         const jsonData = JSON.stringify(linePathData);
         
         console.log("기록된 위치 데이터 : " + jsonData);

         $.ajax({
           type: 'POST',
           url: "${pageContext.request.contextPath}/m/walkInsert",
         contentType : "application/json",
           // data: { linePath: JSON.stringify(linePath) },
           data: jsonData, 
           //traditional: true,
           success: function (response) {
              console.log("기록완료");
              window.location.href = "${pageContext.request.contextPath}/m/map";
           },
           error: function (error) {
             console.error('Error sending data to the controller:', error);
           }
         }); */
         
           }