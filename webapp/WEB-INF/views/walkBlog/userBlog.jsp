<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkBlog/index.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://kit.fontawesome.com/98aecd1b62.js" crossorigin="anonymous"></script>
<script>
	function toggleFollowButton() {
		var followButton = document.getElementById("followButton");

		if (followButton.innerText === "팔로우") {
			followButton.innerText = "팔로잉";
		} else {
			followButton.innerText = "팔로우";
		}
	}

	function addComment(walkLogNo) {
		var commentText = document.getElementById("commentText").value;
		console.log(commentText);
		console.log(${ShowLogVo.walkLogNo});
		
		if (commentText.trim() !== "") {
			// Ajax 호출
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/walkBlog/addComment",
				data : {
					walkLogNo : walkLogNo, // 적절한 walkLogNo 전달
					content : commentText
				},
				success : function(response) {
					// 성공 시, 화면 갱신 등 추가 작업 가능
					console.log("댓글 등록 성공");
				},
				error : function(error) {
					console.error("댓글 등록 실패: " + error);
				}
			});
		}
	}
</script>
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
						<h1 class="userName">${blogInfoVo.name}</h1>

						<c:if test="${requestScope.blogInfoVo.authId != requestScope.blogInfoVo.paramId }">
							<button id="followButton" class="followButton" onclick="toggleFollowButton()">
								<c:if test="${requestScope.blogInfoVo.followNo == 0}">
						팔로우
						
						</c:if>

								<c:if test="${requestScope.blogInfoVo.followNo == 1}">
						팔로잉
						
						</c:if>

							</button>
						</c:if>
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
						<div class="tab record active">산책기록</div>

						<div class="tab meeting">산책모임</div>
						<div class="tab following">팔로잉</div>
						<div class="tab blank"></div>
					</div>


					<div class="mainRecordSection">



						<c:forEach items="${walkLogList}" var="ShowLogVo">
							<c:if test="${not empty ShowLogVo.status and  String.valueOf(ShowLogVo.status) eq 'T'}">
								<div class="mainRecord1">


									<div class="MRprofileBox">

										<div class="MRprofileWrapper1">
											<div class="MRprofileImg1">
												<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
											</div>

											<div class="MRuserName1">${ShowLogVo.name}</div>
										</div>
										<div class="wrappingBox">
											<div class="MRtitleBox">
												<div class="MRtime">${ShowLogVo.regDate}</div>
												<div class="MRtitle">오후 산책</div>

											</div>
											<div class="MRrecordBox">
												<div class="MRdistanceBox">
													<div class="MRrecordData">${ShowLogVo.distance}km</div>
													<div class="MRlabel">산책거리</div>
												</div>
												<div class="MRtimeBox">
													<div class="MRrecordData">0:32분</div>
													<div class="MRlabel">산책시간</div>
												</div>


											</div>
										</div>

										<c:if test="${requestScope.blogInfoVo.authId == requestScope.blogInfoVo.paramId }">
											<div class="modifyDelete">
												<button class="modifyButton">수정</button>
												<button type="button" class="deleteButton" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
												<!-- <button class="deleteButton">삭제</button> -->

												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">정말 삭제하시겠습니까?</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
																<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/walkBlog/delete?no=${ShowLogVo.walkLogNo}'">삭제</button>
															</div>
														</div>
													</div>
												</div>

											</div>
										</c:if>
										<div class="MRdogCardBox">

											<div class="MRpartnerDoglabel">함께한 강아지</div>
											<div class="MRdogCards">
												<div class="MRdogCard1">
													<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
													<div class="MRdogName">마루</div>
												</div>
												<div class="MRdogCard2">
													<img src="${pageContext.request.contextPath}/assets/images/연탄.png" alt="">
													<div class="MRdogName">연탄</div>
												</div>
												<div class="MRdogCard3">
													<img src="${pageContext.request.contextPath}/assets/images/도지.png" alt="">
													<div class="MRdogName">도지</div>
												</div>

											</div>



										</div>


									</div>

									<div class="MRwalkRecordSection">
										<div class="MRwalkData">
											<img src="${pageContext.request.contextPath}/assets/images/산책데이터.png" alt="">
										</div>
										<div class="MRpictures">
											<div class="MRpicture1">
												<img src="${pageContext.request.contextPath}/assets/images/도지.png" alt="">
											</div>
											<div class="MRpicture2">
												<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
											</div>
											<div class="MRpicture3">
												<img src="${pageContext.request.contextPath}/assets/images/산책로.png" alt="">
											</div>
											<div class="MRpicture4">
												<img src="${pageContext.request.contextPath}/assets/images/연탄.png" alt="">
											</div>

										</div>




									</div>

									<div class="MRcommentSection">

										<div class="MRcomments">
											<c:forEach items="${ShowLogVo.showLogCmtList}" var="cmt">
												<%-- <c:if test="${not empty ShowLogVo.status and  String.valueOf(ShowLogVo.status) eq 'T'}"> --%>
												<div class="MRcomment1">

													<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
													<div class="MRreplyDate">${cmt.regDate}</div>
													<div class="MRuserIdandContent">
														<div class="MRreplyUserId">${cmt.name}</div>
														<div class="MRreplyContent">${cmt.content}</div>
													</div>



												</div>
												<%-- </c:if> --%>
											</c:forEach>


										</div>
										<div class="MRcommentInputBox">
											<div class="MRinput-group">
												<textarea id="commentText" class="form-control" aria-label="With textarea"></textarea>
											</div>
											<button class="MRreplyButton" onclick="addComment('${ShowLogVo.walkLogNo}')">등록</button>
										</div>


									</div>
									<div class="MRborder"></div>
								</div>
							</c:if>
						</c:forEach>
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
								<div class="followNum">${blogInfoVo.followingNum}</div>
							</div>
							<div class="followerBox">
								<div class="followText">팔로워</div>
								<div class="followNum">${blogInfoVo.followerNum}</div>
							</div>
						</div>


					</div>
					<div class="stats">

						<h3 class="statslabel">호두마루님의 기록</h3>
						<table class="statsTable">

							<tr>
								<th>이번 달</th>
							</tr>




							<tr>
								<td>산책횟수</td>
								<td>1</td>
							</tr>
							<tr>
								<td>산책거리</td>
								<td>0.55km</td>
							</tr>


							<tr>
								<td>산책시간</td>
								<td>32분</td>
							</tr>




						</table>

						<table class="statsTableAll">

							<tr>
								<th>총 기록</th>
							</tr>




							<tr>
								<td>산책횟수</td>
								<td>1</td>
							</tr>
							<tr>
								<td>산책거리</td>
								<td>0.55km</td>
							</tr>


							<tr>
								<td>산책시간</td>
								<td>32분</td>
							</tr>




						</table>
					</div>
				</div>

			</div>



		</div>

	</section>


</body>





</html>