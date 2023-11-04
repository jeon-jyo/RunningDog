<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/clubBoardSetting.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<jsp:include page="clubSettingSidebar.jsp"></jsp:include>
		<div class="content">
			<h1>게시판 관리</h1>
			<table class="table">
				<thead>
					<tr>
						<th scope="col" style="width: 23%">게시판 이름</th>
						<th scope="col" style="width: 23%">총 게시글 수</th>
						<th scope="col" style="width: 23%">최근 게시글 수(1주일)</th>
						<th scope="col" style="width: 23%">만들어진 날짜</th>
						<th scope="col" style="width: 8%"></th>
					</tr>
				</thead>
				<tbody class="draggble">
					<tr draggable="true">
						<td>자유게시판(기본)</td>
						<td>3개</td>
						<td>1개</td>
						<td>2023.10.31</td>
						<td>
							<i class="fa-solid fa-square-minus" style="color: #ff0000;"></i>
							<i class="fa-solid fa-square-plus addBoard" style="color: #fc5200;"></i>
						</td>
					</tr>
					<tr draggable="true">
						<td>공지사항(기본)</td>
						<td>1개</td>
						<td>3개</td>
						<td>2023.10.31</td>
						<td>
							<i class="fa-solid fa-square-minus" style="color: #ff0000;"></i>
							<i class="fa-solid fa-square-plus addBoard" style="color: #fc5200;"></i>
						</td>
					</tr>
					<tr draggable="true">
						<td>모임후기(기본)</td>
						<td>1개</td>
						<td>3개</td>
						<td>2023.10.31</td>
						<td>
							<i class="fa-solid fa-square-minus" style="color: #ff0000;"></i>
							<i class="fa-solid fa-square-plus addBoard" style="color: #fc5200;"></i>
						</td>
					</tr>
				</tbody>
			</table>
			
		</div>
	</div>
	
	<script>
	const columns = document.querySelectorAll(".draggble");

	columns.forEach((column) => {
	    new Sortable(column, {
	        group: "shared",
	        animation: 150,
	        ghostClass: "blue-background-class"
	    });
	});
	const addBoards= document.querySelectorAll(".addBoard");
	const table= document.querySelector(".table");
	addBoards.forEach((add) => {
		add.addEventListener("click", () => {
			const chk = document.querySelector(".insertTd");
			if(chk != null) return;
			const newRow = table.insertRow();
			newRow.className = "insertTd";
			const newCell = newRow.insertCell(0);
			const tempHtml = "<div class='input-group'>" 
					           +  "<input type='text' class='form-control' placeholder='등록할 게시판 이름을 입력해주세요.' aria-label='ecipients username' aria-describedby='button-addon2'>"
						       +  "<button class='btn btn-outline-primary' type='button' id='button-addon2'>등록하기</button>"
						     +"</div>";
			newCell.innerHTML = tempHtml;		     
			newCell.setAttribute("colspan","5");
		})
	})
	
	
	</script>
</body>
</html>