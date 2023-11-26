<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/assets/css/global/index.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/index.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/109d7bd609.js" crossorigin="anonymous"></script>



</head>
<body>

<section>

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
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkTrail/main?listKey=main">추천 산책로</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkTrail/main?listKey=my">등록한 산책로</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkTrail/main?listKey=star">찜한 산책로</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/walkTrail/walkLog">산책로 등록하기</a></li>
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
							<a class="dropdown-item orange" href="${pageContext.request.contextPath}/walkBlog/${authUser.code}?page=1">내 산책 블로그</a>
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

    <div class="videoFrame">
        <!-- <video src="../video.mp4" autoplay loop muted></video> -->
        <video src="${pageContext.request.contextPath}/assets/video/wd1080.mp4" autoplay loop muted></video>
    </div>
    
    <div class="gradientBg"></div>
    
    <div class="main_box">
        <div class="title">
            <h2><span>Running Dog</span>walk with me, Perrito</h2>
            <p>
            	밖으로 나가 산책로나 집 앞 공원을 둘러보세요. 
                지친 삶에서 잠시나마 벗어나기 위해, 기분 전환을 위해, 여유를 즐기는 사람.
				지상에 있는 모든 동물은 어딘가에 갇혀 평생을 살아가는 것을 그다지 좋아하지 않아요.
				물론 당신의 친구는 보호자의 동반 없이는 집 밖으로 한 발자국도 나서지 않을 거에요.&nbsp;
				러닝독과 함께 걷는 즐거움을 느껴보세요. 
            </p>
        </div>

        <div class="aniv">
            <span>Anniversary</span>
            <strong>21</strong>
        </div>
    </div>
    
</section>

</body>
</html>


