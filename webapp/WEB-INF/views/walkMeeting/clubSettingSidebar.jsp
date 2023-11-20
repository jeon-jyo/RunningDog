<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/clubSettingSidebar.css" rel="stylesheet" type="text/css">

<div class="clubSidebar">
	<div class="sideClub">
		<div class="imgBox">
			<img class="coverImg" src="${pageContext.request.contextPath}/assets/images/dog5.jpg">
		</div>
		<p>강아지 산악회</p>
	</div>
	<hr>
	<ul>
		<li class="position-relative"><a class="stretched-link" href="${pageContext.request.contextPath}/walkmeeting/membersetting">멤버관리</a></li>
		<li class="position-relative"><a class="stretched-link" href="">동아리관리</a></li>
		<li class="position-relative"><a class="stretched-link" href="${pageContext.request.contextPath}/walkmeeting/clubauthority">권한관리</a></li>
		<li class="position-relative"><a class="stretched-link" href="${pageContext.request.contextPath}/walkmeeting/boardsetting">게시판관리</a></li>
		<li class="position-relative"><a class="stretched-link" href="">승인요청</a></li>
		<li class="position-relative"><i class="fa-solid fa-house">&nbsp;</i><a class="stretched-link" href="${pageContext.request.contextPath}/walkmeeting/club">돌아가기</a></li>
	</ul>
</div>