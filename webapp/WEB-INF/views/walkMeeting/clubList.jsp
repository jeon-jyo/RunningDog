<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/clubList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1>우리동네 동아리</h1>
		<div class="infoHeader">
			<div class="left location">
				<span class="myColor">천호동</span> 동아리 <i class="fa-regular fa-square-caret-down"></i>
			</div>
			<div class="right">
				<span>내 <span class="myColor">산책모임</span></span>&nbsp;&nbsp; 
				<span>내 동아리 <span class="myColor">0</span>개</span>&nbsp;&nbsp; 
				<span>내 모임 <span class="myColor">0</span>개
				</span>
			</div>
		</div>
		<div class="semiHeader">
			<div class="input-group input-group-sm">
			  <span class="input-group-text" id="basic-addon1">검색</span>
			  <input type="text" class="form-control" placeholder="동아리 이름을 입력해주세요." aria-label="Username" aria-describedby="basic-addon1">
			  <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색하기</button>
			</div>
			<select class="form-select form-select-sm" aria-label="Small select example">
			  <option selected>최신순</option>
			  <option value="1">멤버순</option>
			</select>
		</div>
		<div class="clubList">
			<div class="club">
				<p class="clubTitle left">강아지 산악회</p>
				<div class="imgBox right">
					<img src="${pageContext.request.contextPath}/assets/images/dog5.jpg" class="coverImg">
				</div>
				<p class="clubDescription left">강아지 산책과 함께 견주분들의 건강을 위해서! 매주 토요일 여러 산에서 모임을 엽니다</p>
				
				<div class="clubInfo">
					<p>남자만 1980 ~ 2000년생</p>
					<p>멤버 5명</p>
				</div>
			</div>
			<div class="club">
				<p class="clubTitle left">강아지 산악회</p>
				<div class="imgBox right">
					<img src="${pageContext.request.contextPath}/assets/images/dog5.jpg" class="coverImg">
				</div>
				<p class="clubDescription left">강아지 산책과 함께 견주분들의 건강을 위해서! 매주 토요일 여러 산에서 모임을 엽니다</p>
				
				<div class="clubInfo">
					<p>남자만 1980 ~ 2000년생</p>
					<p>멤버 5명</p>
				</div>
			</div>
			<div class="club">
				<p class="clubTitle left">강아지 산악회</p>
				<div class="imgBox right">
					<img src="${pageContext.request.contextPath}/assets/images/dog5.jpg" class="coverImg">
				</div>
				<p class="clubDescription left">강아지 산책과 함께 견주분들의 건강을 위해서! 매주 토요일 여러 산에서 모임을 엽니다</p>
				
				<div class="clubInfo">
					<p>남자만 1980 ~ 2000년생</p>
					<p>멤버 5명</p>
				</div>
			</div>
			<div class="club">
				<p class="clubTitle left">강아지 산악회</p>
				<div class="imgBox right">
					<img src="${pageContext.request.contextPath}/assets/images/dog5.jpg" class="coverImg">
				</div>
				<p class="clubDescription left">강아지 산책과 함께 견주분들의 건강을 위해서! 매주 토요일 여러 산에서 모임을 엽니다</p>
				
				<div class="clubInfo">
					<p>남자만 1980 ~ 2000년생</p>
					<p>멤버 5명</p>
				</div>
			</div>
			<div class="club">
				<p class="clubTitle left">강아지 산악회</p>
				<div class="imgBox right">
					<img src="${pageContext.request.contextPath}/assets/images/dog5.jpg" class="coverImg">
				</div>
				<p class="clubDescription left">강아지 산책과 함께 견주분들의 건강을 위해서! 매주 토요일 여러 산에서 모임을 엽니다</p>
				
				<div class="clubInfo">
					<p>멤버 5명</p>
				</div>
			</div>
			<div class="club">
				<p class="clubTitle left">강아지 산악회</p>
				<div class="imgBox right">
					<img src="${pageContext.request.contextPath}/assets/images/dog5.jpg" class="coverImg">
				</div>
				<p class="clubDescription left">강아지 산책과 함께 견주분들의 건강을 위해서! 매주 토요일 여러 산에서 모임을 엽니다</p>
				
				<div class="clubInfo">
					<p>멤버 5명</p>
				</div>
			</div>
			<div class="club">
				<p class="clubTitle left">강아지 산악회</p>
				<div class="imgBox right">
					<img src="${pageContext.request.contextPath}/assets/images/dog5.jpg" class="coverImg">
				</div>
				<p class="clubDescription left">강아지 산책과 함께 견주분들의 건강을 위해서! 매주 토요일 여러 산에서 모임을 엽니다</p>
				
				<div class="clubInfo">
					<p>멤버 5명</p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>