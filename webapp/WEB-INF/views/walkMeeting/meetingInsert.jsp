<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/meetingInsert.css" rel="stylesheet" type="text/css">
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tull6ku3q"></script>
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="clubDetail.jsp"></jsp:include>
	<div class="contents">
		<p class="pageTitle">모임 등록</p>
		<div class="inputGroup">
			<div class="inputItem">
				<p class="inputTitle">모임 날짜 입력</p>
				<input type="date" class="form-control" placeholder="Username" aria-label="Username">
			</div>
			<div class="inputItem">
				<p class="inputTitle">모임 인원 입력</p>
				<input type="text" class="form-control" placeholder="모임 인원 입력(최대 8명)" aria-label="Username">
			</div>
			<div class="inputItem">
				<p class="inputTitle">공개 설정</p>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" checked id="inlineRadio1" value="option1">
				  <label class="form-check-label" for="inlineRadio1">누구나</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
				  <label class="form-check-label" for="inlineRadio2">동아리 멤버만</label>
				</div>
			</div>
		</div>
		<p class="inputTitle">강아지 크기</p>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1" checked>
		  <label class="form-check-label" for="inlineCheckbox1">소형견</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2" checked>
		  <label class="form-check-label" for="inlineCheckbox2">대형견</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="option3" checked>
		  <label class="form-check-label" for="inlineCheckbox3">중형견</label>
		</div>
		<i class="fa-solid fa-circle-exclamation" data-bs-html="true" data-toggle="tooltip" data-placement="top" 
		title="~7kg 소형견 <br> 7~11kg 중형견 <br> 11kg ~ 대형견"></i>
		<p class="inputTitle">강아지 선택</p>
		<div class="dogList">
			<div class="dog">
				<div class="imgBox">
					<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog3.jpg">
				</div>
				<div>
					<p>사랑이</p>
					<p>18kg</p>
				</div>
			</div>
			<div class="dog">
				<div class="imgBox">
					<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog5.jpg">
				</div>
				<div>
					<p>사랑이</p>
					<p>18kg</p>
				</div>
			</div>
			<div class="dog">
				<div class="imgBox">
					<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog4.jpg">
				</div>
				<div>
					<p>사랑이</p>
					<p>18kg</p>
				</div>
			</div>
			<div class="dog">
				<div class="imgBox">
					<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog7.jpg">
				</div>
				<div>
					<p>사랑이</p>
					<p>18kg</p>
				</div>
			</div>
			<div class="dog">
				<div class="imgBox">
					<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog6.jpg">
				</div>
				<div>
					<p>사랑이</p>
					<p>18kg</p>
				</div>
			</div>
		</div>
		
		<div class="inputGroup">
			<div class="inputItem">
				<p class="inputTitle">모임 장소 선택</p>
				<input type="text" class="form-control" placeholder="모임 장소 검색하기" aria-label="Username">
			</div>
			<div class="inputItem">
				<p class="inputTitle">산책로</p>
				<div class="form-check form-switch">
				  <input class="form-check-input" type="checkbox" role="switch" checked id="trailChk" >
				  <label class="form-check-label" for="trailChk">끄기/켜기</label>
				</div>
			</div>
		</div>
		
		<div id="map">
			<div class="trailDetail">
				<p class="trailTitle">산책로 상세정보</p>
			</div>
		</div>
		
		<p class="inputTitle">모임 이름</p>
		<input type="text" class="form-control meetingTitle" placeholder="모임명 입력" aria-label="Username">
		<p class="inputTitle">모임 설명</p>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="모임 내용 입력"></textarea>
		<div class="btnArea">
			<button class="btn btn-primary">등록하기</button>
		</div>
	</div>
	<script type="text/javascript">
		var map = new naver.maps.Map('map');
		$("#trailChk").on("change",function() {
			if($('#trailChk').is(':checked')){
				$(".trailDetail").css("display","block");
			} else {
				$(".trailDetail").css("display","none");
			}
		})
		$(function () {
	      $('[data-toggle="tooltip"]').tooltip();
	    })
	</script>
</body>
</html>