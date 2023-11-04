<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<ul id="settingsMenu">
<li class="selected"><a href="${pageContext.request.contextPath}/setting/myProfile">내 정보</a></li>
		<li class=""><a href="${pageContext.request.contextPath}/setting/dogList">강아지</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogList">강아지 카드</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogInsert">강아지 등록</a></li>
		<li class=""><a href="${pageContext.request.contextPath}/setting/friendList">친구</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendList">친구 목록</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApplied">내가 받은 신청</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApply">내가 한 신청</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendSearch">회원 검색</a></li>
		<li class="last_li"><a href="${pageContext.request.contextPath}/setting/resign">회원탈퇴</a></li>
	</ul>
	
	
	<div id="profile">
	
		<div class="firstElement">
			<h1>내 정보</h1>
			<div>#회원코드</div>
		</div>
		
		<div class="imageArea">
			<div class="settingLabel">프로필 이미지</div>
			<img class="profileImg" alt="" src="">
		</div>
		
		<div>
			<div class="settingLabel">닉네임</div>
			<div>아델</div>
		</div>
		
		<div>
			<div class="settingLabel">생일</div>
			<div>-</div>
		</div>
		
		<div>
			<div class="settingLabel">성별</div>
			<div>-</div>
		</div>
		
		<div>
			<div class="settingLabel">동네</div>
			<div>-</div>
		</div>
		
		<div class="noBorder">
			<a class="button" href="">내 정보 수정</a>
		</div>
				
	</div>


</div>


</body>
</html>