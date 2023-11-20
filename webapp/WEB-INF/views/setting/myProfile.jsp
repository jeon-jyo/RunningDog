<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">


</head>
<body>
	
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<jsp:include page="sideBar.jsp"></jsp:include>

	
	<div id="profile">
	
		<div class="firstElement">
			<h1>내 정보</h1>
			<div>#${requestScope.selectUser.code}</div>
		</div>
		
		<div class="imageArea">
			<div class="settingLabel">프로필 이미지</div>
			
			<!-- 등록한 이미지가 없으면 기본 이미지 보여주기 -->
			<c:choose>
			    <c:when test="${requestScope.selectUser.saveName != null && requestScope.selectUser.saveName != ''}">
			   		<!-- Result값이 있다면 실행할 로직 -->
			   		<img class="profileImg" alt="" src="${pageContext.request.contextPath}/rdimg/userProfile/${requestScope.selectUser.saveName}">
			    </c:when>
			    <c:otherwise>
					 <!-- 그렇지 않다면 실행할 로직 -->
					 <img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">
			    </c:otherwise>
			</c:choose>
		</div>
		
		<div>
			<div class="settingLabel">닉네임</div>
			<div>${requestScope.selectUser.name}</div>
		</div>
		
		<div>
			<div class="settingLabel">생일</div>
			<c:if test="${requestScope.selectUser.birth != null && requestScope.selectUser.birth != ''}">
				<div>${requestScope.selectUser.birth}</div>
			</c:if>
			<c:if test="${requestScope.selectUser.birth == null && requestScope.selectUser.birth != ''}">
				<div>-</div>
			</c:if>
		</div>
		
		<div>
			<div class="settingLabel">성별</div>
			<c:if test="${requestScope.selectUser.gender != null && requestScope.selectUser.gender != ''}">
				<c:if test="${requestScope.selectUser.gender == 'female'}">
					<div>여</div>
				</c:if>
				<c:if test="${requestScope.selectUser.gender == 'male'}">
					<div>남</div>
				</c:if>
			</c:if>
			<c:if test="${requestScope.selectUser.gender == null && requestScope.selectUser.gender != ''}">
				<div>-</div>
			</c:if>
		</div>
		
		<div>
			<div class="settingLabel">동네</div>
			<c:choose>
			    <c:when test="${requestScope.selectUser.locationNo == 1100000000}">
			   		<div>${requestScope.selectUser.si}&nbsp;&nbsp;${requestScope.selectUser.gu}</div>
			    </c:when>
			    <c:otherwise>
					 <div>${requestScope.selectUser.si}&nbsp;&nbsp;${requestScope.selectUser.gu}&nbsp;&nbsp;${requestScope.selectUser.dong}</div>
			    </c:otherwise>
			</c:choose>
		</div>
		
		<div class="noBorder">
			<a class="button" href="${pageContext.request.contextPath}/setting/myProfileModifyForm">내 정보 수정</a>
		</div>
				
	</div>


</div>


</body>
</html>