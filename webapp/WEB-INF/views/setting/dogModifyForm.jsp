<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 정보 수정</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<jsp:include page="sideBar.jsp"></jsp:include>
	
	
	<form method="post" action="${pageContext.request.contextPath}/setting/updateDog" id="profile" enctype="multipart/form-data">
	
		<div class="firstElement">
			<h1>강아지 정보 수정</h1>
			<div>#${requestScope.selectUser.code}</div>
		</div>
		
		<div class="imageArea">
			<div class="settingLabel">프로필 이미지</div>
			<img class="profileImg" alt="" src="${pageContext.request.contextPath}/rdimg/dogProfile/${dogVo.saveName}">
			<label for="inputFile2" class="upload-btn" id="uploadLabel">
				<input id="inputFile2" type="file" name="file" accept="image/*">
			    <span class="form-text" >이미지 선택</span>
		    </label>
		</div>
		
		<div>
			<div class="settingLabel">이름</div>
			<input type="text" name="dogName" value="${dogVo.dogName}" maxlength="10">
		</div>
		
		<div>
			<div class="settingLabel">나이</div>
			<input class="smallBox" type="number" name="birth" value="${dogVo.birth}"> 살
		</div>
		
		<div class="genderSelect">
			<div class="settingLabel">성별</div>
			<c:choose>
			    <c:when test="${dogVo.gender == 'male'}">
			   		<input type="radio" name="gender" value="male" checked="checked">남
			   		<input type="radio" name="gender" value="female">여
			    </c:when>
			    <c:otherwise>	
			    	<input type="radio" name="gender" value="male">남	
					<input type="radio" name="gender" value="female" checked="checked">여
			    </c:otherwise>
			</c:choose>

		</div>
		
		<div>
			<div class="settingLabel">체중</div>
			<input class="smallBox" type="number" name="weight" step="0.1" value="${dogVo.weight}"> kg
		</div>
		
		<div>
			<div class="settingLabel">견종</div>
			<input id="kind" type="text" name="kind" value="${dogVo.kind}">
		</div>
				
		<div class="genderSelect">
			<div class="settingLabel">중성화</div>
			<c:choose>
			    <c:when test="${dogListVo.neuter == 'T'}">
			   		<input type="radio" name="neuter" value="T" checked="checked">했어요
					<input type="radio" name="neuter" value="F">안 했어요
			    </c:when>
			    <c:when test="${dogListVo.neuter == 'F'}">
			   		<input type="radio" name="neuter" value="T">했어요
					<input type="radio" name="neuter" value="F" checked="checked">안 했어요
			    </c:when>
			    <c:otherwise>
					<input type="radio" name="neuter" value="T">했어요
					<input type="radio" name="neuter" value="F">안 했어요
			    </c:otherwise>
			</c:choose>
		</div>
		
		<div>
			<div class="settingLabel vertialTop">성격</div>
				<input class="personality" type="text" name="personality" maxlength="22" value="${dogVo.personality}" placeholder="22자까지 입력 가능">			
		</div>

		<div>
			<div class="settingLabel vertialTop">프로필 색상</div>
			<input type="color" name="color" value="${dogVo.color}">
		</div>
		
		<input type="hidden" name="dogNo" value="${dogVo.dogNo}">
		
		<div class="noBorder marginBottom">
			<button type="submit" class="button">수정 완료</button>
			<a href="${pageContext.request.contextPath}/setting/deleteDog?no=${dogVo.dogNo}" class="button deleteBtn">강아지 삭제</a>
		</div>
		
	</form>	
	
</div>

	

<script type="text/javascript">

//이미지 미리보기 코드2 URL.createObjectURL()
const input2 = $("#inputFile2");
const img2 = $(".profileImg");

input2.on('change', function() {
	const imageSrc2 = URL.createObjectURL(input2.prop("files")[0]);
	img2.attr("src", imageSrc2);
	img2.on("load", function(){
		URL.revokeObjectURL(imageSrc2);
	});
});



</script>


</body>
</html>