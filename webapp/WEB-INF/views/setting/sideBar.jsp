<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sideBar</title>

<link href="${pageContext.request.contextPath}/assets/css/setting/sideBar.css" rel="stylesheet" type="text/css">
</head>
<body>

	<%-- <c:if test="${requestScope['javax.servlet.forward.servlet_path'] == '/setting/myProfile"> --%>

	<ul id="settingsMenu">
	
		<!-- 마이 프로필 -->	
		<li class="
			<c:if test="${requestScope.crtMenu == 'm'}">
				selected
			</c:if>
			">   	
			<a href="${pageContext.request.contextPath}/setting/myProfile">내 정보</a>
		</li>
		
		
		<!-- 강아지 -->	
		<li class="
			<c:if test="${requestScope.crtMenu == 'dl' 
					   || requestScope.crtMenu == 'di' 
					   || requestScope.crtMenu == 'dm'}">
				selected
			</c:if>
			">   	
			<a href="${pageContext.request.contextPath}/setting/dogList">강아지</a>
		</li>
		
		<!-- 강아지 카드 -->	
		<li class="settingSubLi 
			<c:if test="${requestScope.crtMenu == 'dl' 
			 	 	   || requestScope.crtMenu == 'dm'}">
				selectedBold
			</c:if>
			">   	
			<a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogList">강아지 카드</a>
		</li>
		
		<!-- 강아지 등록 -->	
		<li class="settingSubLi noTopBorder  
			<c:if test="${requestScope.crtMenu == 'di'}">
				selectedBold
			</c:if>
			">   	
			<a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogInsertForm">강아지 등록</a>
		</li>
		
		
		<!-- 친구 -->	
		<li class="  
			<c:if test="${requestScope.crtMenu == 'fl'
					   || requestScope.crtMenu == 'fad'
					   || requestScope.crtMenu == 'fa'
					   || requestScope.crtMenu == 'fs'}">
				selected
			</c:if>
			">   	
			<a href="${pageContext.request.contextPath}/setting/friendList?crtPage=1">친구</a>
		</li>
		
		<!-- 친구 목록 -->	
		<li class="settingSubLi
			<c:if test="${requestScope.crtMenu == 'fl'}">
				selectedBold 
			</c:if>
			">   	
			<a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendList?crtPage=1">친구 목록</a>
		</li>
		
		<!-- 친구 신청 받은 거 -->	
		<li class="settingSubLi noTopBorder
			<c:if test="${requestScope.crtMenu == 'fad'}">
				selectedBold 
			</c:if>
			">   	
			<a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendAppliedList?crtPage=1">내가 받은 신청</a>
		</li>
		
		<!-- 친구 신청 한 거 -->	
		<li class="settingSubLi noTopBorder
			<c:if test="${requestScope.crtMenu == 'fa'}">
				selectedBold 
			</c:if>
			">   	
			<a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApplyList?crtPage=1">내가 한 신청</a>
		</li>
		
		<!-- 친구 검색 -->	
		<li class="settingSubLi noTopBorder
			<c:if test="${requestScope.crtMenu == 'fs'}">
				selectedBold 
			</c:if>
			">   	
			<a class="setting_sub" href="${pageContext.request.contextPath}/setting/userSearch?crtPage=0">친구 신청</a>
		</li>
		
		
		<!-- 탈퇴 -->	
		<li class="last_li
			<c:if test="${requestScope.crtMenu == 'r'}">
				selected 
			</c:if>
			">   	
			<a href="${pageContext.request.contextPath}/setting/resignForm">회원탈퇴</a>
		</li>
		
	</ul>
	
	
</body>
</html>


