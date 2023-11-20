<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 cdn -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/assets/css/global/header.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/global/index.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/109d7bd609.js" crossorigin="anonymous"></script>
</head>
<body>
	<header class="global-header">
		<nav>
			<ul>
				<li class="logo">
					<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/assets/images/logo.png"></a>
				</li>
				<li>
					<div class="dropdown">
						<a class="drop-toggle d-inline-flex align-items-center fw-semibold" role="button" data-bs-toggle="dropdown" aria-expanded="false">산책로</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">추천 산책로</a></li>
							<li><a class="dropdown-item" href="#">내 산책로</a></li>
						</ul>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<a class="drop-toggle d-inline-flex align-items-center fw-semibold" role="button" data-bs-toggle="dropdown" aria-expanded="false">산책모임</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkmeeting">산책모임 홈</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkmeeting/clublist">우리동네 동아리</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkmeeting/meetinglist">우리동네 모임</a></li>
						</ul>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<a class="drop-toggle d-inline-flex align-items-center fw-semibold" role="button" data-bs-toggle="dropdown" aria-expanded="false">산책블로그</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkBlog/home">산책블로그 홈</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkBlog/${authUser.code}">내 산책블로그</a></li>
						</ul>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<a class="drop-toggle d-inline-flex align-items-center fw-semibold" role="button" data-bs-toggle="dropdown" aria-expanded="false">산책소식</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">산책소식 홈</a></li>
							<li><a class="dropdown-item" href="#">우리동네 소통창구</a></li>
							<li><a class="dropdown-item" href="#">강아지 자랑하기</a></li>
						</ul>
					</div>
				</li>
			</ul>
			<ul class="right">
				<!-- 로그인 전 메뉴 -->
				<c:if test="${sessionScope.authUser == null}">
					<li><a href="${pageContext.request.contextPath}/loginForm">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/joinForm">회원가입</a></li>
	 			</c:if>
	 			
	 			<!-- 로그인 후 메뉴 -->
				<c:if test="${sessionScope.authUser != null}">
					<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/setting/myProfile">설정</a></li>
	 			</c:if>
			</ul>
			
		</nav>
		
	</header>
</body>
</html>