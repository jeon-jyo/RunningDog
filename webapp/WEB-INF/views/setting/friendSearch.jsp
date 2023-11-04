<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패밀리 추가</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<ul id="settingsMenu">
		<li class=""><a href="${pageContext.request.contextPath}/setting/myProfile">내 정보</a></li>
		<li class=""><a href="${pageContext.request.contextPath}/setting/dogList">강아지</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogList">강아지 카드</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogInsert">강아지 등록</a></li>
		<li class="selected"><a href="${pageContext.request.contextPath}/setting/friendList">친구</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendList">친구 목록</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApplied">내가 받은 신청</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApply">내가 한 신청</a></li>
		<li class="settingSubLi noTopBorder selectedBold"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendSearch">회원 검색</a></li>
		<li class="last_li"><a href="${pageContext.request.contextPath}/setting/resign">회원탈퇴</a></li>
	</ul>
	
	
	<div id="friendProfile">

		<div class="firstElement">
			<h1>회원 검색</h1>
			<div>#12345</div>
		</div>
		
		<div class="listBox">
		
			<form action="" method="get" id="searchUser">
				<div class="searchBox">
					<select name="select" id="searchUser">
						<option value="nickname">닉네임</option>
						<option value="birth">회원코드</option>
					</select>
					<input type="number" name="user_code" placeholder="회원 코드로 검색">
					<button type="submit" class="button" id="searchBtn">검색</button>
				</div>
			</form>
			
			<table class="friendList">
				<colgroup>
					<col style="width: 10%;" />
	    			<col style="width: 25%;" />
	    			<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 35%;" />
					<col style="width: 10%;" />
				</colgroup>
				<tr>
		            <th>프로필</th>
		            <th>닉네임(#회원코드)</th>
		            <th>나이</th>
		            <th>성별</th>
		            <th>동네</th>
		            <th>신청하기</th>
		        </tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg"></td>
					<td>요시미츠(#21345)</td>
					<td>27</td>
					<td>남</td>
					<td>서울특별시 강동구 천호동</td>
					<td><a href="" class="deleteBtn ok">친구 신청</a></td>
					<!-- delete?no=${GuestVo.no} -->
				</tr>
			</table>
			<table class="friendList">
				<tr>
					<td>해당 회원이 존재하지 않습니다.</td>
				</tr>
			</table>
			
			<div id="paging">
				<ul>
					<li><a href="">◀</a></li>
					<li class="selectedBold"><a href="">1</a></li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
					<li><a href="">6</a></li>
					<li><a href="">7</a></li>
					<li><a href="">8</a></li>
					<li><a href="">9</a></li>
					<li><a href="">10</a></li>
					<li><a href="">▶</a></li>
				</ul>
			</div>
		</div>
	</div>
	
</div>

</body>
</html>