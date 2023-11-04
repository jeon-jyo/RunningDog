<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/assets/css/walkBlog/index.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../global/header.jsp"></jsp:include>
<div class="editContents">

<div class="editTitleBox">
<div class="editTitle">산책기록 수정</div>
<button class="saveButton">저장</button>

</div>
   

<div class="editData">
<div class="imgContainer">
<img src="${pageContext.request.contextPath}/assets/images/산책데이터.png" alt="">
</div>
<table class="editDataTable">
<tbody>
<tr>
<td>날짜</td>
<td>2023년 10월 31일</td>
</tr>
<tr>
<td>산책거리</td>
<td>0.55 km</td>
</tr>
<tr>
<td>산책시간</td>
<td>7분 24초</td>
</tr>


</tbody>

</table>



</div>
<div class="editMain">




<div class="editTitleWrapper">
	<h1>제목</h1>

<div class="editTitleinput-group">
  
  <textarea class="form-control" aria-label="With textarea"></textarea>
</div>
</div>

<div class="descriptionBox">
<h1>내용</h1>
<div class="editTitleinput-group">
  
  <textarea class="form-control" aria-label="With textarea"></textarea>
</div>

</div>

<h1>사진</h1>

</div>


</div>




</body>
</html>