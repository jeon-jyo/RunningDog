<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/login_join.css" rel="stylesheet" type="text/css">


</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>
	
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