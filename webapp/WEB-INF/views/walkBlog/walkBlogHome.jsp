<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/assets/css/walkBlog/index.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>


	<div class="contents">
		<div class="mainHeader">
			<h1>산책모임 홈</h1>
			<div class="infoHeader">
				<div class="left location">
					<span class="myColor">천호동</span> 산책일지 <i class="fa-regular fa-square-caret-down"></i>
				</div>
				<div class="right">
					<span>내 <span class="myColor">산책일지</span></span>&nbsp;&nbsp;
					<!-- <span>내 동아리 <span class="myColor">0</span>개</span>&nbsp;&nbsp; 
				<span>내 모임 <span class="myColor">0</span>개
				</span> -->
				</div>
			</div>


		</div>

		<div class="homeMainSection">
			<div class="popularSidebar">
			<div class="pSidebar1">
			<img src="${pageContext.request.contextPath}/assets/images/인기1.png" alt="">
			</div>
			<div class="pSidebar2">
			<img src="${pageContext.request.contextPath}/assets/images/인기3.png" alt="">
			</div>
			<div class="pSidebar3">
			<img src="${pageContext.request.contextPath}/assets/images/인기4.png" alt="">
			</div>
			
			</div>
		
			<div class="bestWrapper">
				<div class="bestTitle">
				<div class="walKing active1">우리동네 산책왕</div>
				<div class="popKing ">우리동네 인기왕</div>
				</div>
				<div class="bestBody">
				<div class="bestWalkWrapper">
				<div class="bestWalk2">
				<img src="${pageContext.request.contextPath}/assets/images/산책일지2.png" alt="">
				</div>
				<div class="bestWalk3">
				<img src="${pageContext.request.contextPath}/assets/images/산책일지3.png" alt="">
				</div>
				</div>
				
				<div class="bestWalk1">
				<img src="${pageContext.request.contextPath}/assets/images/산책일지1.png" alt="">
				</div>
				
				</div>


			</div>
			
			
			<div class="category homeCategory">
						<div class="tab all active">전체</div>
						
						<div class="tab following">팔로잉</div>
						<div class="tab"></div>
						<div class="tab blank"></div>
						
					</div>
			
			 
			
			<div class="homeRecordList"> 
			
			<div class="mainRecordSection">
						<div class="mainRecord1">


							<div class="MRprofileBox">

								<div class="MRprofileWrapper1">
									<div class="MRprofileImg1">
										<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
									</div>

									<div class="MRuserName1">호두마루</div>
								</div>
								<div class="wrappingBox">
									<div class="MRtitleBox">
										<div class="MRtime">2023년 10월 21일 (토) 오후 2:04</div>
										<div class="MRtitle">오후 산책</div>

									</div>
									<div class="MRrecordBox">
										<div class="MRdistanceBox">
											<div class="MRrecordData">0.55km</div>
											<div class="MRlabel">산책거리</div>
										</div>
										<div class="MRtimeBox">
											<div class="MRrecordData">0:32분</div>
											<div class="MRlabel">산책시간</div>
										</div>


									</div>
								</div>


								<div class="modifyDelete">
									<button class="modifyButton">수정</button>
									<button class="deleteButton">삭제</button>



								</div>
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
									<div class="MRcomment1">

										<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
										<div class="MRreplyDate">2023년 10월 21일 (토) 오후 2:04</div>
										<div class="MRuserIdandContent">
											<div class="MRreplyUserId">똘이</div>
											<div class="MRreplyContent">너무 귀엽네요 ^^</div>
										</div>



									</div>
									<div class="MRcomment2">
										<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
										<div class="MRreplyDate">2023년 10월 21일 (토) 오후 3:04</div>
										<div class="MRuserIdandContent">
											<div class="MRreplyUserId">몰랑이</div>
											<div class="MRreplyContent">잘 보고갑니다~</div>
										</div>

									</div>
								</div>
								<div class="MRcommentInputBox">
									<div class="MRinput-group">

										<textarea class="form-control" aria-label="With textarea"></textarea>

									</div>
									<button class="MRreplyButton">등록</button>
								</div>


							</div>
							<div class="MRborder"></div>
						</div>

					</div>
			</div>
			
			





		</div>





	</div>

</body>
</html>