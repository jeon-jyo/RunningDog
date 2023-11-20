<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/clubDetail.css" rel="stylesheet" type="text/css">
<jsp:include page="../global/header.jsp"></jsp:include>
<div class="clubBanner">
	<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog1.jpg">
</div>
<div class="contents">
	<div class="clubProfile">
		<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog2.jpg">
	</div>
	<div class="wrap">
		<div class="myInfo">
			<span>내 <span class="myColor">활동</span></span>&nbsp;&nbsp; <span>내 게시글 <span class="myColor">0</span>개
			</span>&nbsp;&nbsp; <span>내 댓글 <span class="myColor">0</span>개
			</span>&nbsp;&nbsp; <span>내 모임 <span class="myColor">0</span>개
			</span>
		</div>
		<div class="clubInfo">
			<h2 class="clubTitle">
				강아지 산악회 <a class="fa-solid fa-gear" href="${pageContext.request.contextPath}/walkmeeting/membersetting"></a>
			</h2>
			<p>
				<i class="fa-solid fa-location-dot"></i>서울특별시 강동구 천호동
			</p>
			<p>
				<i class="fa-solid fa-user-group"></i>32명
			</p>
			<p>강아지 산책과 함께 견주분들의 건강을 위해서! 메주 토요일 여러 산에서 모임을 엽니다</p>
		</div>
		<button class="btn btn-primary">동아리 가입</button>
	</div>
	<ul class="clubCategory">
		<li class="tab active"><a> 동아리 홈 </a></li>
		<li class="tab"><a> 게시판 </a></li>
		<li class="tab"><a> 모임 </a></li>
		<li class="tab"><a> 멤버 </a></li>
	</ul>
</div>

