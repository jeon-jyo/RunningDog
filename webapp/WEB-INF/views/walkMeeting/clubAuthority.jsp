<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/clubAuthority.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<jsp:include page="clubSettingSidebar.jsp"></jsp:include>
		<div class="content">
			<h1>권한관리</h1>
			<p class="selectTitle">공지사항 등록</p>
			<select class="form-select" aria-label="Default select example">
				<option selected>동아리장</option>
				<option value="1">동아리장,관리자</option>
			</select>
			<p class="selectTitle">다른 멤버의 게시글,댓글 삭제</p>
			<select class="form-select" aria-label="Default select example">
				<option selected>동아리장</option>
				<option value="1">동아리장,관리자</option>
			</select>
			<p class="selectTitle">멤버 가입 승인</p>
			<select class="form-select" aria-label="Default select example">
				<option selected>동아리장</option>
				<option value="1">동아리장,관리자</option>
			</select>
			<p class="selectTitle">멤버 내보내기 및 차단</p>
			<select class="form-select" aria-label="Default select example">
				<option selected>동아리장</option>
				<option value="1">동아리장,관리자</option>
			</select>
		</div>
	</div>
</body>
</html>