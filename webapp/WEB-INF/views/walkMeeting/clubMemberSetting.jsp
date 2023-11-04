<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/clubMemberSetting.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<jsp:include page="clubSettingSidebar.jsp"></jsp:include>
		<div class="content">
			<h1>멤버관리</h1>
			<div class="input-group flex-nowrap">
				<span class="input-group-text" id="addon-wrapping">멤버 검색</span> <input type="text" class="form-control" placeholder="멤버의 닉네임을 입력해주세요" aria-label="Username" aria-describedby="addon-wrapping">
				<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col" style="width: 4%"><input class="form-check-input" type="checkbox" value=""></th>
						<th scope="col" style="width: 12%">닉네임</th>
						<th scope="col" style="width: 12%">등급</th>
						<th scope="col" style="width: 12%">가입일</th>
						<th scope="col" style="width: 12%">최종 방문일</th>
						<th scope="col" style="width: 12%">방문수</th>
						<th scope="col" style="width: 12%">게시글수</th>
						<th scope="col" style="width: 12%">댓글수</th>
						<th scope="col" style="width: 12%">모임수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td scope="row"><input class="form-check-input" type="checkbox" value=""></td>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>Mark</td>
						<td>Otto</td>
					</tr>
					<tr>
						<td scope="row"><input class="form-check-input" type="checkbox" value=""></td>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>Mark</td>
						<td>Otto</td>
					</tr>
					<tr>
						<td scope="row"><input class="form-check-input" type="checkbox" value=""></td>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
						<td>Mark</td>
						<td>Otto</td>
					</tr>
				</tbody>
			</table>
			<p>
				<span>선택 멤버를</span> <select class="form-select" aria-label="Default select example">
					<option selected>관리자</option>
					<option value="1">멤버</option>
				</select> 로
				<button class="btn btn-primary">변경</button>
				<button class="btn btn-danger">탈퇴</button>
			</p>
		</div>
		
	</div>

</body>
</html>