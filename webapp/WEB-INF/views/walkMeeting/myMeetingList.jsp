<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/meetingList.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1>내 모임</h1>
		<div class="infoHeader">
<!-- 			<div class="left location"> -->
<!-- 				<span class="myColor">천호동</span> 모임 <i class="fa-regular fa-square-caret-down"></i> -->
<!-- 			</div> -->
			<form action="${pageContext.request.contextPath}/walkmeeting/mymeetinglist?crtPage=1" method="post" id="searchUser">
				<div class="searchBox">
					<select name="what" id="searchUser">
						<option value="name">모임 제목</option>
						<option value="spot">위치</option>
					</select>
					<input type="text" name="keyword">
					<button type="submit" class="button" id="searchBtn">검색</button>
				</div>
			</form>
		</div>
		
		<div class="listBox">
			<table class="meetingList">
				<colgroup>
					<col style="width: 25%;" />
	    			<col style="width: 25%;" />
	    			<col style="width: 15%;" />
					<col style="width: 10%;" />
					<col style="width: 15%;" />
					<col style="width: 10%;" />
				</colgroup>
				<tr>
		            <th>모임 제목</th>
		            <th>위치</th>
		            <th>강아지 크기</th>
		            <th>인원 수</th>
		            <th>날짜</th>
		            <th>상태</th>
		        </tr>
		        
				<c:forEach items="${requestScope.meetingMap.meetingList}" var="MeetingsVo">
			        <tr class="mt" data-mno="${MeetingsVo.meetingNo}">
						<td>${MeetingsVo.name}</td>
			        	<td>${MeetingsVo.spot}</td>
			        	<td>${MeetingsVo.small}&nbsp;${MeetingsVo.medium}&nbsp;${MeetingsVo.large}</td>
			        	<td>${MeetingsVo.maxMember}</td>
			        	<td>${MeetingsVo.meetingDate}</td>
			        	<c:if test="${MeetingsVo.status == 'T'}">
			        		<td class="green">진행 중</td>	
			        	</c:if>	
			        	<c:if test="${MeetingsVo.status == 'E'}">
			        		<td>종료</td>	
			        	</c:if>	
					</tr>
		        </c:forEach>
		        
			</table>
			
			<div id="paging">
				<ul>
					<c:if test="${meetingMap.prev}">
						<li><a href="${pageContext.request.contextPath}/walkmeeting/mymeetinglist?keyword=${meetingMap.keyword}&crtPage=${meetingMap.startPageBtnNo-1}">◀</a></li>
					</c:if>
					
					<c:forEach begin="${meetingMap.startPageBtnNo}" end="${meetingMap.endPageBtnNo}" step="1" var="page">
						<c:choose>
							<c:when test="${param.crtPage == page}">
								<li class="active"><a href="${pageContext.request.contextPath}/walkmeeting/mymeetinglist?keyword=${meetingMap.keyword}&crtPage=${page}">${page}</a></li>										
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/walkmeeting/mymeetinglist?keyword=${meetingMap.keyword}&crtPage=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
					
					<c:if test="${meetingMap.next}">
						<li><a href="${pageContext.request.contextPath}/walkmeeting/mymeetinglist?keyword=${meetingMap.keyword}&crtPage=${meetingMap.endPageBtnNo+1}">▶</a></li>
					</c:if>

				</ul>
			</div>
			<a href="${pageContext.request.contextPath}/walkmeeting/meetinginsert" class="button">모임 등록</a>
		</div>
	</div>
	
<script>

$(".mt").on("click", function(){
	
	let $this = $(this);
	let mNo = parseInt($this.data("mno"));
	window.location = '${pageContext.request.contextPath}/walkmeeting/meeting?no='+mNo;
	
});


/* FullCalendar */
/* const myModalEl = document.getElementById('exampleModal')
myModalEl.addEventListener('shown.bs.modal', event => {
	var calendarEl = document.getElementById('calendar');
       var calendar = new FullCalendar.Calendar(calendarEl, {
         initialView: 'dayGridMonth',
         locale: 'ko'
       });
       calendar.render();
}) */
</script>
</body>
</html>