<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 상세</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/meetingDetail.css" rel="stylesheet" type="text/css">
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tull6ku3q"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="${pageContext.request.contextPath}/assets/css/global/slick.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>

</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
	
		<!-- status = F나 E면 모임이 종료됨 메세지 -->
		<c:if test="${requestScope.meetingMap.meetingVo.status == 'E' || requestScope.meetingMap.meetingVo.status == 'F'}">
			<div class="endMessage">종료된 모임입니다.</div>
		</c:if>
		
		<p class="pageTitle">${requestScope.meetingMap.meetingVo.name}</p>
		<div class="inputGroup">
			<div class="items">
				<p class="inputTitle">모임 날짜</p>
				<div>${requestScope.meetingMap.meetingVo.meetingDate}</div>
			</div>
			<div class="items">
				<p class="inputTitle">모임 인원</p>
				<div>${requestScope.meetingMap.meetingVo.currentMember}&nbsp;/&nbsp;${requestScope.meetingMap.meetingVo.maxMember}</div>
			</div>
			<div class="items">
				<p class="inputTitle">강아지 크기</p>
				<div>${requestScope.meetingMap.meetingVo.small}&nbsp;&nbsp;${requestScope.meetingMap.meetingVo.medium}&nbsp;&nbsp;${requestScope.meetingMap.meetingVo.large}</div>
			</div>
			<div class="items">
				<p class="inputTitle">모임장</p>
				<div>${requestScope.meetingMap.meetingVo.userName}</div>
			</div>
		</div>
		
		<div class="inputGroup">
			<div class="inputItem">
				<p class="inputTitle">모임 장소</p>
				<div>${requestScope.meetingMap.meetingVo.trailName}&nbsp;/&nbsp;${requestScope.meetingMap.meetingVo.spot}</div>
				<img class="mapImg" src="${pageContext.request.contextPath}/rdimg/trail/${requestScope.meetingMap.meetingVo.saveName}">
			</div>
		</div>
		
		<p class="inputTitle">모임 설명</p>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly="readonly">${requestScope.meetingMap.meetingVo.description}</textarea>
		
		<p class="inputTitle">참여 강아지</p>
		<div class="dogSlickBox">
			<button class="leftBtn lB1"><</button>
			<div class="dogList dl1">
				<c:forEach items="${requestScope.meetingMap.meetingDogList}" var="dogVo">
					<div class="dog">
						<div class="imgBox">
							<img class="coverImg" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/dog_default_img.jpg';" src="${pageContext.request.contextPath}/rdimg/dogProfile/${dogVo.saveName}">
						</div>
						<div>
							<p>이름: ${dogVo.dogName}</p>
							<p>체중: ${dogVo.weight}kg</p>
							<p>보호자: ${dogVo.userName}</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<button class="rightBtn rB1">></button>
		</div>
		
		<!-- 참여 신청 폼: 모임장 X, status == T, 맴버 아님, maxMember > currentMember 일 때 -->
		<c:if test="${(requestScope.meetingMap.meetingVo.userNo != sessionScope.authUser.userNo) &&
					  (requestScope.meetingMap.meetingVo.status == 'T') &&
					  (requestScope.meetingMap.meetingInfosVo == null) && 
					  (requestScope.meetingMap.meetingVo.currentMember < requestScope.meetingMap.meetingVo.maxMember)}">
			<p class="pageTitle">모임 참여 신청</p>
			<form action="${pageContext.request.contextPath}/walkmeeting/applyMeeting">
				<div class="dogSlickBox">
					<button class="leftBtn lB2"><</button>
					<div class="dogList dl2">
					<c:forEach items="${requestScope.meetingMap.myDogList}" var="dogVo">
						<div class="dog">
							<div class="imgBox">
								<img class="coverImg" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/dog_default_img.jpg';" src="${pageContext.request.contextPath}/rdimg/dogProfile/${dogVo.saveName}">
							</div>
							<div>
								<p>이름: ${dogVo.dogName}</p>
								<p>체중: ${dogVo.weight}kg</p>
								<p>보호자: ${dogVo.userName}</p>
								<div class="checkbox">
									선택: <input type="checkbox" value="${dogVo.dogNo}" name="dogNo">
								</div>
							</div>
						</div>
					</c:forEach>
				
					</div>
					<button class="rightBtn rB2">></button>
				</div>
		
				<input type="hidden" name="meetingNo" value="${requestScope.meetingMap.meetingVo.meetingNo}">
				
				<div class="btnArea">
					<!-- 1. 모임장 X, 목록에 없고, maxMember > currentMember 일 때 신청하기 -->
					<button type="submit" class="btn btn-primary">신청하기</button>
				</div>
			</form>
		</c:if>
		
		<!-- 2. 모임장 X, status == T, 맴버 맞을 때 신청취소 -->
		<c:if test="${(requestScope.meetingMap.meetingVo.userNo != sessionScope.authUser.userNo) &&
					  (requestScope.meetingMap.meetingVo.status == 'T') &&
					  (requestScope.meetingMap.meetingInfosVo != null)}">
			<div class="btnArea">	  
				<a href="${pageContext.request.contextPath}/walkmeeting/cancelApply?meetingNo=${requestScope.meetingMap.meetingVo.meetingNo}" class="btn colored">신청취소</a>
			</div>
		</c:if>
					
		<!-- 3. 모임장이고, status = T면 모임 폭☆파 버튼 -->
		<c:if test="${(requestScope.meetingMap.meetingVo.userNo == sessionScope.authUser.userNo) && 
					  (requestScope.meetingMap.meetingVo.status == 'T')}">
			<div class="btnArea">
				<a href="${pageContext.request.contextPath}/walkmeeting/deleteMeeting?meetingNo=${requestScope.meetingMap.meetingVo.meetingNo}&meetingDate=${requestScope.meetingMap.meetingVo.meetingDate}" class="btn colored">모임 종료</a>
			</div>
		</c:if>
		
	</div>


<script type="text/javascript">
$(function(){
    $('.dl1').slick({

        speed:1000,
     
        draggable: true,
        autoplay : false, 

        arrows: true,
        prevArrow: $('.lB1'),
        nextArrow: $('.rB1'),
        dots: true,
        
        infinite: false,
        slidesToShow: 5,
        slidesToScroll: 5

    });
    
    
    $('.dl2').slick({

        speed:1000,
     
        draggable: true,
        autoplay : false, 

        arrows: true,
        prevArrow: $('.lB2'),
        nextArrow: $('.rB2'),
        dots: true,
        
        infinite: false,
        slidesToShow: 5,
        slidesToScroll: 5

    });
    
});

</script>


</body>
</html>