<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 신청</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<jsp:include page="sideBar.jsp"></jsp:include>
	
	
	<div id="friendProfile">

		<div class="firstElement">
			<h1>친구 신청</h1>
			<div>#${sessionScope.authUser.code}</div>
		</div>
		
		<div class="listBox">
		
			<form action="${pageContext.request.contextPath}/setting/friendSearchForm?crtPage=1" method="post" id="searchUser">
				<div class="searchBox">
					<select name="what" id="searchUser">
						<option value="name">닉네임</option>
						<option value="code">회원코드</option>
					</select>
					<input type="text" name="keyword">
					<button type="submit" class="button" id="searchBtn">검색</button>
				</div>
			</form>
			
			<table class="friendList">
				<colgroup>
					<col style="width: 15%;" />
	    			<col style="width: 20%;" />
	    			<col style="width: 10%;" />
					<col style="width: 10%;" />
					<col style="width: 30%;" />
					<col style="width: 15%;" />
				</colgroup>
				<tr>
		            <th>프로필</th>
		            <th>닉네임(#회원코드)</th>
		            <th>나이</th>
		            <th>성별</th>
		            <th>동네</th>
		            <th>신청하기</th>
		        </tr>

		        <c:forEach items="${requestScope.friendMap.userList}" var="friendsVo">
			        <tr>
						<td><img src="${pageContext.request.contextPath}/rdimg/userProfile/${friendsVo.saveName}"></td>
						<td>${friendsVo.name}(#${friendsVo.code})</td>
						<c:choose>
						    <c:when test="${friendsVo.birth == null || friendsVo.birth == ''}">
						   		<td>-</td>
						    </c:when>
						    <c:otherwise>
						    	<td>${friendsVo.birth}</td>
						    </c:otherwise>
						</c:choose>
						<c:choose>
						    <c:when test="${friendsVo.gender == 'male'}">
						   		<td>남</td>
						    </c:when>
						    <c:when test="${friendsVo.gender == 'female'}">
						   		<td>여</td>
						    </c:when>
						    <c:otherwise>
						    	<td>-</td>
						    </c:otherwise>
						</c:choose>
						<c:choose>
						    <c:when test="${friendsVo.locationNo == 1100000000}">
						   		<td>${friendsVo.si}&nbsp;&nbsp;${friendsVo.gu}</td>
						    </c:when>
						    <c:otherwise>
						    	<td>${friendsVo.si}&nbsp;&nbsp;${friendsVo.gu}&nbsp;&nbsp;${friendsVo.dong}</td>
						    </c:otherwise>
						</c:choose>
						<td  id="t${friendsVo.userNo}"><button id="btn${friendsVo.userNo}" data-userno="${friendsVo.userNo}" class="deleteBtn okBtn">친구 신청</button></td>
						<!-- delete?no=${GuestVo.no} -->
					</tr>
		        </c:forEach>
		        
			</table>
			
			<c:if test="${param.crtPage == '0'}">
		        <div class="dummyTable">강아지를 공유하고 싶은 회원을 검색해주세요</div>
			</c:if>
			
			
				<div id="paging" 
					<c:if test="${param.crtPage == '0'}">
						class="hidePaging"
					</c:if>
				>
					<ul>
						<c:if test="${friendMap.prev}">
							<li><a href="${pageContext.request.contextPath}/setting/friendSearchForm?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${friendMap.startPageBtnNo-1}">◀</a></li>
						</c:if>
						
						<c:forEach begin="${friendMap.startPageBtnNo}" end="${friendMap.endPageBtnNo}" step="1" var="page">
							<c:choose>
								<c:when test="${param.crtPage == page}">
									<li class="active"><a href="${pageContext.request.contextPath}/setting/friendSearchForm?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${page}">${page}</a></li>										
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/setting/friendSearchForm?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${page}">${page}</a></li>
								</c:otherwise>
							</c:choose>
							
						</c:forEach>
						
						<c:if test="${friendMap.next}">
							<li><a href="${pageContext.request.contextPath}/setting/friendSearchForm?what=${friendMap.what}&keyword=${friendMap.keyword}&crtPage=${friendMap.endPageBtnNo+1}">▶</a></li>
						</c:if>
	
					</ul>
				</div> <!-- paging -->

		</div>
	</div>
	
</div>




<script type="text/javascript">

//친구 추가 (ajax)
$(".okBtn").on("click", function(){
	
	let $this = $(this);
	let userNo = parseInt($this.data("userno"));
	
	$.ajax({
		url : "${pageContext.request.contextPath}/setting/insertFriend",
		type : "post",
		//보낼 때
		/* contentType : "application/json", */
		data : {userNo: userNo},

		//받을 때
		dataType : "text",
		success : function(count){
			
			if(count == "1"){
				alert("친구 신청 성공");
 				$("#btn"+userNo).remove();
				$("#t"+userNo).text("진행 중");
			}else{
				alert("친구 신청 실패");
			}

		},
     
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});

});



</script>





</body>
</html>