<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/clubInsert.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1>동아리 생성</h1>
		<div class="mb-3">
		  <label for="clubName" class="form-label inputname">동아리 이름</label>
		  <input type="email" class="form-control" id="clubName" placeholder="동아리 이름을 입력해주세요.">
		</div>
		<div class="mb-3">
		  <label for="clubAddress" class="form-label inputname">동아리 주소</label>
		  <input type="email" class="form-control" id="clubAddress" placeholder="동아리 주소를 입력해주세요.">
		</div>
		<label class="form-label inputname">성별</label><br>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="gender" id="gender">
		  <label class="form-check-label" for="flexRadioDefault1">
		    전체
		  </label>
		</div>
		<div class="form-check form-check-inline mb-3">
		  <input class="form-check-input" type="radio" name="gender" id="gender" checked>
		  <label class="form-check-label" for="flexRadioDefault2">
		    남자만
		  </label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="gender" id="gender" checked>
		  <label class="form-check-label" for="flexRadioDefault2">
		    여자만
		  </label>
		</div>
		
		<br><label class="form-label  inputname">나이</label> <br>
		<div class="form-check form-switch ageCheck mb-3">
		  <input class="form-check-input" checked type="checkbox" role="switch" id="flexSwitchCheckDefault">
		  <label class="form-check-label" for="flexSwitchCheckDefault">
		    상관 없음
		  </label>
		</div>
		<div class="input-group mb-3 form-check-inline dateGroup">
		  <input type="date" class="form-control" placeholder="Username" aria-label="Username">
		  <span class="input-group-text">~</span>
		  <input type="date" class="form-control" placeholder="Server" aria-label="Server">
		</div>
		
		<label class="form-label inputname">가입방법</label><br>
		<div class="form-check form-check-inline">
		  <input class="form-check-input " type="radio" name="join" id="join">
		  <label class="form-check-label" for="flexRadioDefault1">
		    모두
		  </label>
		</div>
		<div class="form-check form-check-inline mb-3">
		  <input class="form-check-input" type="radio" name="join" id="join" checked>
		  <label class="form-check-label" for="flexRadioDefault2">
		    요청 후 승인
		  </label>
		</div>
		
		<div class="mb-3">
		  <label for="formFile" class="form-label inputname">동아리 프로필 사진</label>
		  <input class="form-control" type="file" id="formFile">
		</div>
		
		<div class="mb-3">
		  <label for="formFile" class="form-label inputname">동아리 커버 사진</label>
		  <input class="form-control" type="file" id="formFile">
		</div>
		
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label inputname">동아리 설명</label>
		  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		
		<div class="buttonGroup">
			<button class="btn btn-danger">취소</button>
			<button class="btn btn-primary">생성</button>
		</div>
		
	</div>
</body>
</html>