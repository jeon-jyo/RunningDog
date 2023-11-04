<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/login_join.css" rel="stylesheet" type="text/css">


</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>
	
<div id="loginContainer">
	
	<div id="loginLetterBox">
		<div id="loginLetter">회원가입</div>	
	</div>

	<form action="/join" id="loginForm">
	
		<input type="text" name="id" class="rm formEliments joinformEliments" placeholder="아이디">
		<!-- <span class="warning">중복된 아이디 입니다.</span> -->
		
		<input type="text" name="name" class="rm formEliments joinformEliments" placeholder="닉네임">
		<!-- <span class="warning">닉네임은 10자 이하여야 합니다.</span> -->
		
		<input type="password" name="password" class="rm formEliments joinformEliments" placeholder="비밀번호">
		<!-- <span class="warning">비밀번호는 8자 이상이여야 합니다.</span> -->
		
		<input type="password" name="password_check" class="rm formEliments joinformEliments" placeholder="비밀번호 확인">
		<!-- <span class="warning">비밀번호가 일치하지 않습니다.</span> -->
		
		<button type="submit" id="loginBtn" class="rm formEliments">회원가입</button>

	</form>
	
</div>
	
</body>
</html>