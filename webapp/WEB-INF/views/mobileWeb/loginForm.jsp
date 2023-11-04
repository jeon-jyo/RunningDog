<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 모바일용 웹페이지로 변환 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>러닝독 모바일로그인</title>
 <!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
		
<!-- 부트스트랩 cdn , 폰트어썸 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/109d7bd609.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
<!-- css -->
<link href="${pageContext.request.contextPath}/assets/css/mobileWeb/login_join.css" rel="stylesheet" type="text/css">

</head>
<body>

<div id="loginContainer">
	
	<div id="loginLetterBox">
		<div id="loginLetter">로그인</div>	
	</div>

	<form action="/login" id="loginForm">
	
		<div class="">
			<a href="" class="social formEliments" id="naver"><img alt="" src="${pageContext.request.contextPath}/assets/images/naver-icon-file.png">네이버로 로그인</a>
		</div>
		<div class="">
			<a href="" class="social formEliments" id="google"><img alt="" src="${pageContext.request.contextPath}/assets/images/google_logo.png">구글로 로그인</a>
		</div>
		
		<div id="idLoginMessage">아이디로 로그인</div>
		
		<div class="">
			<input type="text" name="id" id="id" class="rm formEliments" placeholder="아이디">
		
			<input type="password" name="password" id="password" class="rm formEliments" placeholder="비밀번호">
		</div>
		
		<button type="submit" id="loginBtn" class="rm formEliments">로그인</button>
		
		<div id="subMenuBox">
			<a href="" class="subMenu">아이디 찾기</a>
			<a href="" class="subMenu subMenuC">비밀번호 찾기</a>
			<a href="" class="subMenu">회원가입</a>
		</div>
	
	</form>
	
</div>


</body>
</html>