<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkBlog/detail.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>


	<div class="mainBox">
		<div class="dataBox">

			<div class="profileBox">
				<div class="profileWrapper1">
					<div class="profileImg1">
						<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
					</div>

					<h1 class="userName1">호두마루</h1>
				</div>

				<div class="titleBox">
					<h3 class="time">2023년 10월 21일 (토) 오후 2:04</h3>
					<h1 class="title">오후 산책</h1>

				</div>

			</div>

			<div class="dogCardBox">

				<h1 class="partnerDoglabel">함께한 강아지</h1>
				<div class="dogCards">
					<div class="dogCard1">
						<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
						<div class="dogName"></div>
					</div>
					<div class="dogCard2">
						<img src="${pageContext.request.contextPath}/assets/images/연탄.png" alt="">
						<div class="dogName"></div>
					</div>
					<div class="dogCard3">
						<img src="${pageContext.request.contextPath}/assets/images/도지.png" alt="">
						<div class="dogName"></div>
					</div>

				</div>



			</div>
			<div class="recordBox">
				<div class="distanceBox">
					<h1 class="recordData">0.55km</h1>
					<h3 class="label">산책거리</h3>
				</div>
				<div class="timeBox">
					<h1 class="recordData">0:32분</h1>
					<h3 class="label">산책시간</h3>
				</div>


			</div>


		</div>

		<div class="walkRecordSection">
			<div class="walkData">
				<img src="${pageContext.request.contextPath}/assets/images/산책데이터.png" alt="">
			</div>
			<div class="pictures">
				<div class="picture1">
					<img src="${pageContext.request.contextPath}/assets/images/도지.png" alt="">
				</div>
				<div class="picture2">
					<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
				</div>
				<div class="picture3">
					<img src="${pageContext.request.contextPath}/assets/images/산책로.png" alt="">
				</div>
				<div class="picture4">
					<img src="${pageContext.request.contextPath}/assets/images/연탄.png" alt="">
				</div>

			</div>




		</div>

		<div class="commentSection">
			<div class="comments">
				<div class="comment1">
				
				<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
				<div class="replyDate">
				2023년 10월 21일 (토) 오후 2:04
				</div>
				<div class="userIdandContent">
				<div class="replyUserId">
				똘이
				</div>
				<div class="replyContent">
				너무 귀엽네요 ^^
				</div>
				</div>
				
				
				
				</div>
				<div class="comment2">
				<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
				<div class="replyDate">
				2023년 10월 21일 (토) 오후 3:04
				</div>
				<div class="userIdandContent">
				<div class="replyUserId">
				몰랑이
				</div>
				<div class="replyContent">
				잘 보고갑니다~
				</div>
				</div>
				
				</div>
			</div>
			<div class="commentInputBox">
				<div class="input-group">
					
					<textarea class="form-control" aria-label="With textarea"></textarea>
					<button class="replyButton">등록</button>
				</div>

			</div>


		</div>



	</div>





</body>


</html>