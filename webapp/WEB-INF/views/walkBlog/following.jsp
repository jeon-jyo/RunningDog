<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkBlog/index.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/98aecd1b62.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>


	<div class="backgroundImg">
		<img src="${pageContext.request.contextPath}/assets/images/산책로.png" alt="">

	</div>



	<section>
		<div class="contents">




			<div class="profileSection">
				<div class="calendar">
					<img src="${pageContext.request.contextPath}/assets/images/캘린더.png" alt="">
				</div>

				<div class="profileWrapper">
					<div class="wrap">
						<div class="profileImg">
							<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
						</div>
						<h1 class="userName">호두마루</h1>
						<button class="followButton">팔로우</button>
					</div>
					<div class="mainDogCard">
						<div class="coworkingDog">산책 파트너</div>
						<div class="maindogCardBox">
							<div class="mainDogCard1">
								<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
								<div class="mainDogCardName">마루</div>
							</div>
							<div class="mainDogCard2">
								<img src="${pageContext.request.contextPath}/assets/images/리트리버.png" alt="">
								<div class="mainDogCardName">리트리버</div>
							</div>
							<div class="mainDogCard3">
								<img src="${pageContext.request.contextPath}/assets/images/도지.png" alt="">
								<div class="mainDogCardName">도지</div>
							</div>
							<div class="mainDogCard4">
								<img src="${pageContext.request.contextPath}/assets/images/연탄.png" alt="">
								<div class="mainDogCardName">연탄</div>
							</div>
						</div>


					</div>


				</div>



			</div>

			<div class="mainWrapper">

				<div class="mainPosts">

					<div class="category">
						<div class="tab record">산책기록</div>
						<div class="tab meeting">산책모임</div>
						<div class="tab following active">팔로잉</div>
						<div class="tab blank"></div>
					</div>

					<div class="followingSection">
						<h2>팔로잉</h2>
						<div class="selector">
							<select class="form-select form-select-sm" aria-label="Small select example">
								<option selected>팔로워</option>
								<option value="1">팔로잉</option>


							</select>
						</div>
						<div class="followings">
							<div class="following1">
								<button class="followButton">팔로우</button>
								<img src="${pageContext.request.contextPath}/assets/images/연탄.png" alt="">
								<div class="followingNickname">닉네임1</div>

							</div>

							<div class="following2">
								<button class="followButton">팔로우</button>
								<img src="${pageContext.request.contextPath}/assets/images/산책로.png" alt="">
								<div class="followingNickname">닉네임2</div>

							</div>
							<div class="following3">
								<button class="followButton">팔로우</button>
								<img src="${pageContext.request.contextPath}/assets/images/산책로2.png" alt="">
								<div class="followingNickname">닉네임3</div>

							</div>
						</div>
					</div>




				</div>


				<div class="mainSidebar">
					<div class="clubsWrapper">
						<h3 class="clubs">동아리</h3>
						<div class="clubBox">
							<div class="clubCard1">
								<img src="${pageContext.request.contextPath}/assets/images/산책로.png" alt="">
								<div class="clubCardName">동아리1</div>
							</div>
							<div class="clubCard2">
								<img src="${pageContext.request.contextPath}/assets/images/산책로3.png" alt="">
								<div class="clubCardName">동아리2</div>
							</div>
							<div class="clubCard3">
								<img src="${pageContext.request.contextPath}/assets/images/산책로2.png" alt="">
								<div class="clubCardName">동아리3</div>
							</div>
							<div class="clubCard4">
								<img src="${pageContext.request.contextPath}/assets/images/산책로.png" alt="">
								<div class="clubCardName">동아리4</div>
							</div>
						</div>
					</div>
					<div class="socialWrapper">
						<div class="socialBox">
							<h3 class="social">소셜 네트워크</h3>
							<div class="followingBox">
								<div class="followText">팔로잉</div>
								<div class="followNum">1</div>
							</div>
							<div class="followerBox">
								<div class="followText">팔로워</div>
								<div class="followNum">0</div>
							</div>
						</div>


					</div>
					<div class="stats">

						<table>
							<caption>영수증</caption>
							<thead>
								<tr>
									<th>메뉴</th>
									<th>가격</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>피자</td>
									<td>12,000</td>
								</tr>
								<tr>
									<td>스파게티</td>
									<td>8,000</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td>총액</td>
									<td>20,000</td>
								</tr>
							</tfoot>
						</table>


					</div>
				</div>

			</div>



		</div>

	</section>

</body>



</html>