<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 등록</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<jsp:include page="sideBar.jsp"></jsp:include>
	
	
	<form method="post" action="${pageContext.request.contextPath}/setting/dogInsert" id="profile" enctype="multipart/form-data">
	
		<div class="firstElement">
			<h1>강아지 등록</h1>
			<div>#${requestScope.selectUser.code}</div>
		</div>
		
		<div class="imageArea">
			<div class="settingLabel">프로필 이미지</div>
				 <img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/dog_default_img.jpg">
			<label for="inputFile2" class="upload-btn" id="uploadLabel">
				<input id="inputFile2" type="file" name="file" accept="image/*">
			    <span class="form-text" >이미지 선택</span>
		    </label>
		</div>
		
<!-- 		<div> -->
<!-- 			<div class="settingLabel vertialTop">동물등록번호</div> -->
			
<!-- 			<div class="checkAnimalBox"> -->
<!-- 				<div class="checkAnimalNum"> -->
<!-- 					<select name="selectOwner" id="profile"> -->
<!-- 						<option value="소유주">소유주</option> -->
<!-- 						<option value="생년월일">생년월일</option> -->
<!-- 					</select> -->
<!-- 					<input type="text" name="" value=""> -->
<!-- 				</div> -->
<!-- 				<div class="checkAnimalNum"> -->
<!-- 					<select name="selectAnimalNum" id="profile"> -->
<!-- 						<option value="">등록번호</option> -->
<!-- 						<option value="">RFID</option> -->
<!-- 					</select> -->
<!-- 					<input type="number" name="" value="" maxlength="15"> -->
<!-- 				</div> -->
				
<!-- 				<button class="" id="animalBtn" type="submit">조회</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<div>
			<div class="settingLabel">이름</div>
			<input type="text" name="dogName" value="" maxlength="10">
		</div>
		
		<div>
			<div class="settingLabel">나이</div>
			<input class="smallBox" type="number" name="birth" value=""> 살
		</div>
		
		<div class="genderSelect">
			<div class="settingLabel">성별</div>
			<input type="radio" name="gender" value="male">남
			<input type="radio" name="gender" value="female">여
		</div>
		
		<div>
			<div class="settingLabel">체중</div>
			<input class="smallBox" type="number" name="weight" step="0.1" value=""> kg
		</div>
		
		<!-- 이름 성별 생일 체중 not null 처리 해야 함 -->
		
		<div>
			<div class="settingLabel">견종</div>
			<input id="kind" type="text" name="kind" value="">
		</div>
				
		<div class="genderSelect">
			<div class="settingLabel">중성화</div>
			<input type="radio" name="neuter" value="T">했어요
			<input type="radio" name="neuter" value="F">안 했어요
		</div>
		
		<div>
			<div class="settingLabel vertialTop">성격</div>
			<input class="personality" type="text" name="personality" maxlength="22" placeholder="22자까지 입력 가능">
		</div>

		<div>
			<div class="settingLabel vertialTop">프로필 색상</div>
			<input type="color" name="color" value="#D2D2D2">
		</div>
		
		<div class="noBorder marginBottom">
			<button type="submit" class="button">등록하기</button>
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