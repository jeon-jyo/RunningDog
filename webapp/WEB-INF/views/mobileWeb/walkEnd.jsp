<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- 모바일용 웹페이지로 변환 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>산책종료</title>
<!-- 네이버 지도 API 스크립트를 포함합니다. -->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=b9b0wee2jf"></script>
<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/css/mobileWeb/walkEnd.css" rel="stylesheet" type="text/css">

<!-- 부트스트랩 cdn , 폰트어썸 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/109d7bd609.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</head>
<body>

	<div id="allBox">

		<!-- 헤더박스 -->
		<div class="headerBox" style="">

			<div class="end" id="text01">산책종료</div>

			<div class="recordBox">
				<div class="date" id="text02"></div>
				<div class="record" id="text02">
					거리:${moWalkLogVo.distance}m 시간: <span id="formattedTime"></span>
				</div>
			</div>

		</div>

		<!-- 컨텐츠 모음 -->
		<div class="content">

			<!-- 기록된 이동기록이 뜨는 맵 -->
			<div id="map"></div>

			<!-- 기록된 라인과 일치율이 높은 산책로 사진 3개 -->
			<div class="mapImages">
				<div class="mapNameBox">이 산책로를 이용하셨습니다.</div>
				<div class="mapImageContainer">

					<c:forEach items="${trailList}" var="tarailVo">
						<div class="mapImageBox">
							<img class="mapImage" src="${pageContext.request.contextPath}/rdimg/trail/${tarailVo.orgName}"></img>

							<c:if test="${tarailVo.trailStar==1}">
								<div id="likeIcon1" class="likeIcon emptyIcon fa-solid fa-star" data-trail-starno="${tarailVo.trailStarNo}"
									data-trail-no="${tarailVo.trailNo}"></div>
							</c:if>
							<c:if test="${tarailVo.trailStar==0}">
								<div id="likeIcon1" class="likeIcon emptyIcon fa-regular fa-star" data-trail-starno="${tarailVo.trailStarNo}"
									data-trail-no="${tarailVo.trailNo}"></div>
							</c:if>
							<div class="mapName">${tarailVo.name}</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 파일첨부 버튼 -->
			<div class="fileForm">

				<form id="form" class="form-horizontal" role="form" method="post" enctype="multipart/form-data"
					action="${pageContext.request.contextPath}/m//walkInsert2">
					<div class="pictures">
						<label for="fileInput"> <i class="fa-regular fa-image"></i>&nbsp; 사진첨부
						</label> <input type="file" name="file" id="fileInput" onchange="addFile(this);" multiple />
						<!-- 첨부파일 여러개(multiple) -->

					</div>

					<div class="file-list"></div>
				</form>
			</div>

			<!-- 텍스트작성박스 -->
			<td colspan="1"><textarea class="textBox" name="content" rows="4" placeholder="내용을 입력해주세요." value=""></textarea></td>

			<!-- 체크박스라인 -->
			<div class="checkBox">
				<i class="fa-solid fa-unlock-keyhole"></i>
				<div>&nbsp; 비공개로 게시</div>
				<label class="switch-button"> <input type="checkbox" id="privacyCheckbox" /> <span class="onoff-switch"></span>
				</label>
			</div>

		</div>

		<!-- 작성하기 버튼 -->
		<div class="lastButton">
			<!-- 작성 -->
			<div class="write" id="insertBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">기록하기</div>
			<!-- 취소 -->
			<div class="back">기록하지않기</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">기록되었습니다.</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="confirmButton">확인</button>
					</div>
				</div>
			</div>
		</div>


	</div>

	<script>
	//변수
	
	
	//로딩될때
	
	
	
	//할때
	
	
	
	
	
	//할때
	
	
	//할때
	///////////////////////////////////////////////
	
	//메소드
	
	//메소드
	
	//메소드
	
	//
	
	
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
	        let xy={}
	        xy.x = lineList[i].lng;  // x값 (경도)
	        xy.y = lineList[i].lat;  // y값 (위도)
	        polylinePath.push(xy);
	    }
	  
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
	   
	    var lineBounds = new naver.maps.LatLngBounds(polylinePath);

		if (lineBounds) {
			
			// 맵을 Polyline에 맞게 조절
			map.fitBounds(polylinePath, {
				padding : 20
			});
			
			//위의 배열을 이용해 라인 그리기
			var polyline = new naver.maps.Polyline({
				path : polylinePath, // Polyline의 위치 변수 배열
				strokeColor : '#FF4500', // Polyline의 선 색깔 지정 (빨강)
				strokeOpacity : 0.9, // Polyline의 선 투명도 조절 (0 ~ 1)
				strokeWeight : 6, // Polyline의 선 두께 지정
				map : map
			// Polyline을 오버레이할 지도
			});

			// 배열 첫 번째 위치를 마커로 표시함
			var firstMarker = new naver.maps.Marker({
				position : polylinePath[0], // 첫 번째 위치
				map : map,
		        icon: {
		            url: '${pageContext.request.contextPath}/assets/images/walkTrail/marker.png',
		            size: new naver.maps.Size(30, 30),
		            scaledSize: new naver.maps.Size(30, 30),
		        }
			});

			// 배열 마지막 위치를 마커로 표시함
			var marker = new naver.maps.Marker({
				position : polylinePath[polylinePath.length - 1], // 마지막 위치
				map : map,
		        icon: {
		            url: '${pageContext.request.contextPath}/assets/images/endMarker.png',
		            size: new naver.maps.Size(30, 30),
		            scaledSize: new naver.maps.Size(30, 30),
		        }
			});
			
		}
	    
		
		console.log('-------------------데이터 확인--------------------');
		
		// 산책로 찜 유무
		console.log('${trailList[0].trailStar}');
		console.log('${trailList[1].trailStar}');
		console.log('${trailList[2].trailStar}');
		
		console.log("받아온 라인리스트" + '${lineList}');
		
		console.log("가공한1 라인리스트" + jsonString);
		console.log("가공한2 라인리스트" + lineList);
		console.log("가공한3 라인리스트" + lineBounds);
		
		console.log("가공한4 라인리스트" + polylinePath);
		
		console.log("받아온 강아지리스트" + '${dogNoList}');		
		
		console.log("받아온 산책로리스트" + '${trailList[0].trailNo}');
		
		let trailList = [];
		trailList.push('${trailList[0].trailNo}');
		trailList.push('${trailList[1].trailNo}');
		trailList.push('${trailList[2].trailNo}');
		
		console.log("가공한 산책로 리스트" + trailList);
		
	
		
	    console.log('-------------------데이터 확인--------------------');
	    
//----------------------------------------------------------------------

	// 서버에서 받아온 초 단위 시간값
       var seconds = '${moWalkLogVo.logTime}';

       // 초를 시, 분, 초로 변환하고 포맷하는 함수
       function formatTime(seconds) {
           var hours = Math.floor(seconds / 3600);
           var minutes = Math.floor((seconds % 3600) / 60);
           var remainingSeconds = seconds % 60;

           return ('0' + hours).slice(-2) + ':' + ('0' + minutes).slice(-2) + ':' + ('0' + remainingSeconds).slice(-2);
       }

       // 서버에서 받아온 초 값을 사용하여 포맷하여 출력
       var formattedTime = formatTime(seconds);
       $("#formattedTime").text(formattedTime);



// 파일 선택이 변경되었을 때 실행되는 함수
	$('#fileInput').on('change', function (event) {
	    // 선택된 파일 목록을 가져옵니다.
	    var fileList = event.target.files;
	
	    // 선택된 파일 목록을 표시할 엘리먼트를 선택합니다.
	    var fileListContainer = $('#fileList');
	
	    // 선택된 파일 목록을 초기화합니다.
	    fileListContainer.empty();
	
	    // 선택된 각 파일에 대해 반복하여 정보를 표시합니다.
	    $.each(fileList, function (index, file) {
	        var fileItem = $('<div>').text('첨부파일이름: ' + file.name + ', 크기: ' + file.size + '바이트');
	        fileListContainer.append(fileItem);
	    });
	});
    
	//----------------------------------------------------------------------
	    
	let fileNo = 0;
	let filesArr = new Array();

	/* 첨부파일 추가 */
	function addFile(obj){
		let maxFileCnt = 4;   // 첨부파일 최대 개수
		let attFileCnt = $('.filebox').length; // 기존 추가된 첨부파일 개수
		let remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
		let curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

	    // 첨부파일 개수 확인
	    if (curFileCnt > remainFileCnt) {
	        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
	    } else {
	        for (const file of obj.files) {
	            // 첨부파일 검증
	            if (validation(file)) {
	                // 파일 배열에 담기
	                let reader = new FileReader();
	                reader.onload = function () {
	                    filesArr.push(file);
	                };
	                reader.readAsDataURL(file);
	                
	             	// 목록 추가
	                let htmlData = '';
	                htmlData += '<div class="filebox" id="file' + fileNo + '">';
	                htmlData += '   <p class="name">' + file.name + '</p>';
	                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
	                htmlData += '</div>';
	                $('.file-list').append(htmlData);
	                fileNo++;
	                
	            } else {
	                continue;
	            }
	        }
	    }
	    // 초기화
	    $('input[type=file]').val('');
	}		  
    
	/* 첨부파일 검증 */
	function validation(obj){
	    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif', 'application/haansofthwp', 'application/x-hwp'];
	    if (obj.name.length > 100) {
	        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
	        return false;
	    } else if (obj.size > (100 * 1024 * 1024)) {
	        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
	        return false;
	    } else if (obj.name.lastIndexOf('.') == -1) {
	        alert("확장자가 없는 파일은 제외되었습니다.");
	        return false;
	    } else if (!fileTypes.includes(obj.type)) {
	        alert("첨부가 불가능한 파일은 제외되었습니다.");
	        return false;
	    } else {
	        return true;
	    }
	}

	/* 첨부파일 삭제 */
	function deleteFile(num) {
	    $("#file" + num).remove();
	    filesArr[num].is_delete = true;
	}
	
	let security; // 변수를 선언    
 	// 페이지 로드 시 초기값 설정 (기본적으로 공개로 설정)
    security = '공개';
    console.log('초기 security 값:', security);
    
    $('#privacyCheckbox').change(function() {
	    // 체크박스가 체크되었는지 여부에 따라 security 변수에 값을 할당
	    security = this.checked ? '비공개' : '공개';
	    // 테스트를 위해 console에 출력
	    console.log('현재 security 값:', security);
	});

//----------------------------------------------------------------------

// 검색된 산책로 3개의 폴리라인을 for문으로 돌려서 그려줄것 3개까지 없으면 공백한을 어떻게 할지 고민


	
	
	/* var trailListPath = [];

	// 컨트롤러에서 전달한 lineList 데이터를 JSON 형식으로 파싱
    var jsonString2 = '${trailList}'; // JSON 형식의 문자열
	var trailList = JSON.parse(jsonString2);
    
    // lineList의 각 항목을 polylinePath 배열에 추가
    for (var i = 0; i < trailList.length; i++) {
        let xy={}
        xy.x = lineList[i].lng;  // x값 (경도)
        xy.y = lineList[i].lat;  // y값 (위도)
        trailListPath.push(xy);
    } */
   
    
    
//----------------------------------------------------------------------

/* 기록하기버튼 클릭할때 */	    	
$("#insertBtn").on("click", function(){
	console.log("기록하기버튼 클릭");	
	//----------텍스트데이타 보내기---------------------------------		
	/* 1.모임번호 */  // 동네번호 가져오기 보류
	let meetingNo = '${moWalkLogVo.meetingNo}';
	console.log("모임번호" + '${moWalkLogVo.meetingNo}');	
	/* 산책일지번호,회원번호,제목,작성시간,상태는 컨트롤러 이후 */	
	
	/* 2.동네번호 */  // 모임번호 가져오기 보류	
	let locationNo = '${moWalkLogVo.locationNo}';
	console.log("동네번호 " + locationNo);		
	/* 3.시작시간 */
	let startTime = '${moWalkLogVo.startTime}';
	console.log("시작시간 " + startTime);	
	/* 4.종료시간 */
	let endTime = '${moWalkLogVo.endTime}';
	console.log("종료시간 " + endTime);	
	/* 5.소요시간 */
	let logTime = '${moWalkLogVo.logTime}';
	console.log("소요시간 " + logTime);	
	/* 6.거리 */
	let distance = '${moWalkLogVo.distance}';
	console.log("거리 " + distance);	
	/* 7.내용 */
	let content = $(".textBox").val();
	console.log("내용 " + content);	
	/* 8.공개여부 */  
    // 체크박스의 변경을 감지하는 함수    
    console.log('현재 security 값:', security);    
	
	/* 9.산책한 강아지번호 리스트 */	
	let dogNoList = "${dogNoList}".split(",");
	console.log("가공한 강아지리스트" + dogNoList);
	
	/* 10.좌표리스트 */
	console.log(polylinePath);	
	
	/* 11.이용한 산책로 정보 */	
	
	
	/* 1개로 묶기 */
	let dataVo = {
		locationNo: locationNo,	
		startTime: startTime,
		endTime: endTime,
		logTime: logTime,
		distance: distance,
		content: content,
		security: security,
		dogNoList: dogNoList,
		polylinePath: polylinePath,
		trailList: trailList,
		meetingNo: meetingNo
	}	
	
	console.log("합친 데이터" + dataVo);
    
	$.ajax({
		url : "${pageContext.request.contextPath}/m/walkInsert",      
        type : "post",
        contentType : "application/json",
        data : JSON.stringify(dataVo),
       
        async: false, // ajax 동기화
        dataType : "json",
        success : function(moWalkLogVo){
        	/*성공시 처리해야될 코드 작성*/
        	let walkLogNo = moWalkLogVo.walkLogNo;        	
			console.log(walkLogNo);        	
			console.log("파일 저장 중......");
			console.log(filesArr);	
			
			// 파일 업로드 함수
		    function uploadFile(index) {
		        if (index < filesArr.length) {
		            // 삭제되지 않은 파일만 폼데이터에 담기
		            if (!filesArr[index].is_delete) {
		                let formData = new FormData();
		                formData.append("image", filesArr[index]);	
		                formData.append("walkLogNo", walkLogNo); // walkLogNo를 FormData에 추가

		                $.ajax({
		                    url: "${pageContext.request.contextPath}/m/imagesInsert",
		                    type: "post",
		                    data: formData,
		                    processData: false,  // 데이터 처리 방식을 설정
		                    contentType: false,  // 컨텐츠 타입을 설정
		                    success: function (result) {
		                        console.log("파일 저장 완료");		                        		                        
		                        // 다음 파일 업로드 호출
		                        uploadFile(index + 1);
		                    },
		                    error: function (XHR, status, error) {
		                        console.error(status + " : " + error);
		                    }
		                });
		            } else {
		                // 삭제된 파일은 건너뛰고 다음 파일 업로드 호출
		                uploadFile(index + 1);
		            }
		        } else {
		            // 파일 업로드가 끝난 후에 처리할 코드 작성
		            console.log("파일 업로드 완료");
		        }
		    }

		    // 첫 번째 파일 업로드 호출
		    uploadFile(0);			
		    
        },/* success */
        error : function(XHR, status, error) {
           console.error(status + " : " + error);
        }
	}); /* ajax */

    
    
});/*//기록하기버튼 클릭할때 */


//-- 찜하기버튼 --------------------------------------------------------------------------
	/* document.addEventListener("DOMContentLoaded", function () {
	    const trailStarValues = [${trailList[0].trailStar}, ${trailList[1].trailStar}, ${trailList[2].trailStar}];
	
	    for (let i = 1; i <= trailStarValues.length; i++) {
	        initializeIcon(i, trailStarValues[i - 1]);
	    }
	
	    function initializeIcon(iconId, initialState) {
	        const iconContainer = $(`#likeIcon${iconId}`);
	
	        if (initialState === 1) {
	            iconContainer.addClass("filledIcon").html('<i class="fa-solid fa-star"></i>');
	        } else {
	            iconContainer.removeClass("filledIcon").html('<i class="fa-regular fa-star"></i>');
	        }
	
	        iconContainer.data("initial-state", initialState);
	    }
	
	    function toggleIcon(iconId) {
	        const iconContainer = $(`#likeIcon${iconId}`);
	        const initialState = parseInt(iconContainer.data("initial-state"));
	        const newState = 1 - initialState;
	
	        if (newState === 1) {
	            iconContainer.addClass("filledIcon").html('<i class="fa-solid fa-star"></i>');
	        } else {
	            iconContainer.removeClass("filledIcon").html('<i class="fa-regular fa-star"></i>');
	        }
	
	        iconContainer.data("initial-state", newState);
	    }
	});  */
	

	
	
	$('.likeIcon').on("click", function () {		
		console.log("찜 버튼 클릭");
		
		//별토글(그림)
		console.log("찜번호"+$(this).data("trail-starno"));
		console.log("산책로번호"+$(this).data("trail-no"));
		
		let isStarno = $(this).data("trail-starno");
		console.log("담긴찜번호"+isStarno);
		
		//데이터 적용(삭제 또는 등록)
		//insert문 	//delete  
		
		//그림
		if(isStarno === 0){//찜안했으면
			console.log("레귤러(빈별) >> 솔리드(찬별)");
			$(this).removeClass("fa-regular");
			$(this).addClass("fa-solid");
						
			//테스트 html trail-starno  적용(starno)
			 $(this).data('trail-starno', 10000) 
			// 찜번호가 10000일때는 오류가 날 수 있음 그럴땐 -나 다른 값으로 바꿔주기
		
		}else { //솔리드-->레귤러
			console.log("솔리드(찬별) >> 레귤러(빈별)");
			$(this).removeClass("fa-solid");
			$(this).addClass("fa-regular");		
			//테스트 html trail-starno  적용(0)
			$(this).data('trail-starno', 0) 
		}		
		
		isTrailNo = $(this).data("trail-no");
		isStarNo = $(this).data("trail-starno");
		
		console.log("처리후 산책로번호2 = "+isTrailNo);
		console.log("처리후 찜번호2 = "+isStarNo);
		
	
		//서비스가
		//데이터 ajax전송
		$.ajax({
            url: "${pageContext.request.contextPath}/m/starUpdate",
            type: "post",
            data: {
                trailNo: isTrailNo,
                starNo: isStarNo
            },
            
            dataType : "text",
            success: function (result) {
                console.log("찜완료", result);
                $(this).data('trail-starno', result) 
              
                
            },
            error: function (XHR, status, error) {
                console.error(status + " : " + error);
            }
        });
		
		
		//성공이면 (리턴)
		
			//trail-starno  0이 아니면 삭제,   리턴 -1 
			//html trail-starno  적용(0)
			
			//trail-starno  0이이면 등록,   리턴 starno
			//html trail-starno  적용(starno)
			
			
		
		//insert  --> starno()  -->                  data를 trail-starno  적용
		
		
		
		
		
		
		
		
		//db값변경  -->추가,삭제
		
		
		
		
		
	})
	

//<i class="fa-solid fa-star"></i> 칠해진거
//<i class="fa-regular fa-star"></i> 빈거

//-------------------------------------------------------------------------------
		    	    
	// 기록하지 않음	
    $(".back").on("click", function() {
        // 여기에 이동할 링크를 넣어주세요
        window.location.href = "${pageContext.request.contextPath}/m/map";
    });	
	
	// 버튼 클릭 이벤트 리스너 추가  
    $("#confirmButton").on("click", function() {
        // 다른 페이지로 이동할 URL을 여기에 입력
        var newPageURL = "${pageContext.request.contextPath}/m/map";  // 원하는 페이지 URL로 변경
        // 페이지 리디렉션
        window.location.href = newPageURL;
    });
   
	
	    
	</script>

	<script>
        // 네이버 지도 API 스크립트 로딩 후 initMap 함수 호출
        naver.maps.onJSContentLoaded = initMap;
        
        function initMap() {
            // 지도 초기화 및 설정 작업을 수행하세요.
        }
    </script>

</body>
</html>