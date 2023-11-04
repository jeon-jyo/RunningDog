<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<ul id="settingsMenu">
		<li class=""><a href="${pageContext.request.contextPath}/setting/myProfile">내 정보</a></li>
		<li class=""><a href="${pageContext.request.contextPath}/setting/dogList">강아지</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogList">강아지 카드</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogInsert">강아지 등록</a></li>
		<li class=""><a href="${pageContext.request.contextPath}/setting/friendList">친구</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendList">친구 목록</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApplied">내가 받은 신청</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApply">내가 한 신청</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendSearch">회원 검색</a></li>
		<li class="last_li selected"><a href="${pageContext.request.contextPath}/setting/resign">회원탈퇴</a></li>
	</ul>
	
	
	<form action="" id="profile">
	
		<div class="firstElement">
			<h1>회원탈퇴</h1>
			<div>#12345</div>
		</div>
		
		<div class="warningBox">
			<div class="warning">
				<span>* 사용 중인 아이디는 탈퇴 후 재사용 및 복구가 불가능합니다.</span>
				<span>* 패밀리가 등록되어 있을 경우 탈퇴가 불가능합니다.</span>
				<span class="lastSpan">회원탈퇴를 위해 비밀번호를 입력해주세요.</span>
			</div>
		</div>
		<div class="noBottomStyle">
			<div class="resignLabel selectedBold">아이디</div>
			<div>test1234</div>
			<input type="hidden" name="id" value="아이디 불러오기">
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