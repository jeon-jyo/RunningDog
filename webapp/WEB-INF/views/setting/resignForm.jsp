<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">


</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<jsp:include page="sideBar.jsp"></jsp:include>
	
	
	<form action="${pageContext.request.contextPath}/setting/resign" id="profile">
	
		<div class="firstElement">
			<h1>회원탈퇴</h1>
			<div>#${sessionScope.authUser.code}</div>
		</div>
		
		<div class="warningBox">
			<div class="warning">
				<span>* 사용 중인 아이디는 탈퇴 후 재사용 및 복구가 불가능합니다.</span>
				<span>* 친구가 있을 경우 자동으로 해제됩니다.</span>
				<span class="lastSpan">회원탈퇴를 위해 비밀번호를 입력해주세요.</span>
			</div>
		</div>
		<div class="noBottomStyle">
			<div class="resignLabel selectedBold">아이디</div>
			<div>${requestScope.selectUser.id}</div>
			<input type="hidden" name="id" value="${requestScope.selectUser.id}">
		</div>	
		<div>
			<div class="resignLabel selectedBold">비밀번호</div>
			<input type="text" name="password">
		</div>

		<div class="noBorder">
			<button type="submit" class="button">회원탈퇴</button>
		</div>
				
	</form>


</div>


</body>
</html>