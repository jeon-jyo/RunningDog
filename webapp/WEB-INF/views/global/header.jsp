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
				<li class="manu-left">
					<div class="dropdown">
						<a class="drop-toggle d-inline-flex align-items-center fw-semibold" role="button" data-bs-toggle="dropdown" aria-expanded="false">산책로</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkTrail/main?listKey=main">추천 산책로</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkTrail/main?listKey=my">등록한 산책로</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkTrail/main?listKey=star">찜한 산책로</a></li>
						</ul>
					</div>
				</li>
				<li>
					<div class="dropdown">
						<a class="drop-toggle d-inline-flex align-items-center fw-semibold" role="button" data-bs-toggle="dropdown" aria-expanded="false">산책모임</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkmeeting/meetinglist?crtPage=1">우리동네 모임</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkmeeting/mymeetinglist?crtPage=1">내 모임</a></li>
						</ul>
					</div>
				</li>
			</ul>
			
			<div class="my-menu">
				<ul class="left">
					<c:if test="${ authUser != null  }">
						<li>
							<a class="dropdown-item oranged" href="${pageContext.request.contextPath}/walkBlog/${authUser.code}?page=1">내 산책 블로그</a>
						</li>
					</c:if>
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
			</div>
			
		</nav>
		
	</header>
</body>
</html>