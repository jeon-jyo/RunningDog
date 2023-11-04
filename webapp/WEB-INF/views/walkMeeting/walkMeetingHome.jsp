<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/walkMeetingHome.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<div class="contents">
		<h1>산책모임 홈</h1>
		<div class="infoHeader">
			<div class="left location">
				<span class="myColor">천호동</span> 산책모임 <i class="fa-regular fa-square-caret-down"></i>
			</div>
			<div class="right">
				<span>내 <span class="myColor">산책모임</span></span>&nbsp;&nbsp; 
				<span>내 동아리 <span class="myColor">0</span>개</span>&nbsp;&nbsp; 
				<span>내 모임 <span class="myColor">0</span>개
				</span>
			</div>
		</div>
		<div class="semiHeader">
			<p>내 동아리</p>
		</div>
		<div class="clubList">
			<div class="club">
				<div class="cover addCover">
					<i class="fa-solid fa-circle-plus fa-2xl" style="color: #999999;"></i>
				</div>
				<div class="clubInfo addClubInfo">만들기</div>
			</div>
			<div class="club">
				<div class="cover">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg">
				</div>
				<div class="clubInfo">
					<p class="clubName">강아지 산악회</p>
					<p class="clubLocation">서울특별시 강동구 천호동</p>
					<p class="clubMember">멤버 23</p>
				</div>
			</div>
			<div class="club">
				<div class="cover">
					<img src="${pageContext.request.contextPath}/assets/images/dog2.jpg">
				</div>
				<div class="clubInfo">
					<p class="clubName">강아지 산악회</p>
					<p class="clubLocation">서울특별시 강동구 천호동</p>
					<p class="clubMember">멤버 23</p>
				</div>
			</div>
			<div class="club">
				<div class="cover">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg">
				</div>
				<div class="clubInfo">
					<p class="clubName">강아지 산악회</p>
					<p class="clubLocation">서울특별시 강동구 천호동</p>
					<p class="clubMember">멤버 23</p>
				</div>
			</div>
			<div class="club">
				<div class="cover">
					<img src="${pageContext.request.contextPath}/assets/images/dog2.jpg">
				</div>
				<div class="clubInfo">
					<p class="clubName">강아지 산악회</p>
					<p class="clubLocation">서울특별시 강동구 천호동</p>
					<p class="clubMember">멤버 23</p>
				</div>
			</div>
			<div class="club">
				<div class="cover">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg">
				</div>
				<div class="clubInfo">
					<p class="clubName">강아지 산악회</p>
					<p class="clubLocation">서울특별시 강동구 천호동</p>
					<p class="clubMember">멤버 23</p>
				</div>
			</div>
			<div class="club">
				<div class="cover">
					<img src="${pageContext.request.contextPath}/assets/images/dog2.jpg">
				</div>
				<div class="clubInfo">
					<p class="clubName">강아지 산악회</p>
					<p class="clubLocation">서울특별시 강동구 천호동</p>
					<p class="clubMember">멤버 23</p>
				</div>
			</div>
			<div class="club">
				<div class="cover">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg">
				</div>
				<div class="clubInfo">
					<p class="clubName">강아지 산악회</p>
					<p class="clubLocation">서울특별시 강동구 천호동</p>
					<p class="clubMember">멤버 23</p>
				</div>
			</div>
			<div class="club">
				<div class="cover">
					<img src="${pageContext.request.contextPath}/assets/images/dog2.jpg">
				</div>
				<div class="clubInfo">
					<p class="clubName">강아지 산악회</p>
					<p class="clubLocation">서울특별시 강동구 천호동</p>
					<p class="clubMember">멤버 23</p>
				</div>
			</div>
		</div>

		<div class="semiHeader">
			<p>모임 일정</p>
			<div class="left">
				<button class="btn badge text-bg-primary">내 동아리</button> <button class="btn badge text-bg-secondary">전체</button>
			</div>
			<span class="right">+더보기</span>
		</div>
		<div class="meetingList">
			<div class="meeting">
				<div class="meetingTitle">
					<div class="left">
						어쩌구
					</div>
					<div class="right">
						저쩌구
					</div>
				</div>
				<div class="meetingContent ">
					<div class="cource left">
						<img src="${pageContext.request.contextPath}/assets/images/cource.png">
					</div>
					<div class="meetingInfo left">
						<p class="meetingTime">
							<i class="fa-regular fa-calendar"></i>
							10/13 08시 30분
						</p>
						<p class="meetingPersonel">
							<i class="fa-solid fa-user-group"></i>
							8명
						</p>
						<p class="meetingDog">
							<i class="fa-solid fa-dog"></i>
							대형견 불가
						</p>
						<p class="meetingSpot">
							<i class="fa-solid fa-location-dot"></i>
							서울특별시 강동구 천호동 천호대로 141
						</p>
						가나다라마바사가나다라마바사가나다라마바사가나다라마바사
					</div>
				</div>
				<div class="memberList">
					<i class="fa-solid fa-circle-user">
						<i class="fa-solid fa-crown" style="color: #ffea00;"></i>
					</i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
				</div>
			</div>
			<div class="meeting">
				<div class="meetingTitle">
					<div class="left">
						어쩌구
					</div>
					<div class="right">
						저쩌구
					</div>
				</div>
				<div class="meetingContent ">
					<div class="cource left">
						<img src="${pageContext.request.contextPath}/assets/images/cource.png">
					</div>
					<div class="meetingInfo left">
						<p class="meetingTime">
							<i class="fa-regular fa-calendar"></i>
							10/13 08시 30분
						</p>
						<p class="meetingPersonel">
							<i class="fa-solid fa-user-group"></i>
							8명
						</p>
						<p class="meetingDog">
							<i class="fa-solid fa-dog"></i>
							대형견 불가
						</p>
						<p class="meetingSpot">
							<i class="fa-solid fa-location-dot"></i>
							서울특별시 강동구 천호동 천호대로 141
						</p>
						가나다라마바사가나다라마바사가나다라마바사가나다라마바사
					</div>
				</div>
				<div class="memberList">
					<i class="fa-solid fa-circle-user">
						<i class="fa-solid fa-crown" style="color: #ffea00;"></i>
					</i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
				</div>
			</div>
			<div class="meeting">
				<div class="meetingTitle">
					<div class="left">
						어쩌구
					</div>
					<div class="right">
						저쩌구
					</div>
				</div>
				<div class="meetingContent ">
					<div class="cource left">
						<img src="${pageContext.request.contextPath}/assets/images/cource.png">
					</div>
					<div class="meetingInfo left">
						<p class="meetingTime">
							<i class="fa-regular fa-calendar"></i>
							10/13 08시 30분
						</p>
						<p class="meetingPersonel">
							<i class="fa-solid fa-user-group"></i>
							8명
						</p>
						<p class="meetingDog">
							<i class="fa-solid fa-dog"></i>
							대형견 불가
						</p>
						<p class="meetingSpot">
							<i class="fa-solid fa-location-dot"></i>
							서울특별시 강동구 천호동 천호대로 141
						</p>
						가나다라마바사가나다라마바사가나다라마바사가나다라마바사
					</div>
				</div>
				<div class="memberList">
					<i class="fa-solid fa-circle-user">
						<i class="fa-solid fa-crown" style="color: #ffea00;"></i>
					</i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
				</div>
			</div>
			<div class="meeting">
				<div class="meetingTitle">
					<div class="left">
						어쩌구
					</div>
					<div class="right">
						저쩌구
					</div>
				</div>
				<div class="meetingContent ">
					<div class="cource left">
						<img src="${pageContext.request.contextPath}/assets/images/cource.png">
					</div>
					<div class="meetingInfo left">
						<p class="meetingTime">
							<i class="fa-regular fa-calendar"></i>
							10/13 08시 30분
						</p>
						<p class="meetingPersonel">
							<i class="fa-solid fa-user-group"></i>
							8명
						</p>
						<p class="meetingDog">
							<i class="fa-solid fa-dog"></i>
							대형견 불가
						</p>
						<p class="meetingSpot">
							<i class="fa-solid fa-location-dot"></i>
							서울특별시 강동구 천호동 천호대로 141
						</p>
						가나다라마바사가나다라마바사가나다라마바사가나다라마바사
					</div>
				</div>
				<div class="memberList">
					<i class="fa-solid fa-circle-user">
						<i class="fa-solid fa-crown" style="color: #ffea00;"></i>
					</i>
					<i class="fa-solid fa-circle-user"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
					<i class="fa-solid fa-circle-plus" style="color: #216ae8;"></i>
				</div>
			</div>
		</div>
		<div class="semiHeader">
			<p class="left">이런 동아리 어때요</p>
			<span class="right">+더보기</span>
		</div>
		<div class="recommendClubList">
			<div class="recommendClub">
				<div class="imgBox left">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
				</div>
				<div class="recommendClubInfo right">
					<p class="clubTitle">강아지 산악회</p>
					<p class="clubDescription">강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지</p>
					<p class="clubInfo">멤버 3  서울특별시 강동구 천호동</p>
				</div>
			</div>
			<div class="recommendClub">
				<div class="imgBox left">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
				</div>
				<div class="recommendClubInfo right">
					<p class="clubTitle">강아지 산악회</p>
					<p class="clubDescription">강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지</p>
					<p class="clubInfo">멤버 3  서울특별시 강동구 천호동</p>
				</div>
			</div>
			<div class="recommendClub">
				<div class="imgBox left">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
				</div>
				<div class="recommendClubInfo right">
					<p class="clubTitle">강아지 산악회</p>
					<p class="clubDescription">강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지</p>
					<p class="clubInfo">멤버 3  서울특별시 강동구 천호동</p>
				</div>
			</div>
			<div class="recommendClub">
				<div class="imgBox left">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
				</div>
				<div class="recommendClubInfo right">
					<p class="clubTitle">강아지 산악회</p>
					<p class="clubDescription">강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지강아지</p>
					<p class="clubInfo">멤버 3  서울특별시 강동구 천호동</p>
				</div>
			</div>
		</div>
		<p>인기글</p>
		<div class="bestPostList">
			<div class="bestPost">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
					<div class="imgCount">
						3
					</div>
				</div>
				<div class="postInfo">
					<p class="postTitle">강아지랑 놀았어용 너무 너무 너무 재밌었습니다</p>
					<p>강아지 산악회</p>
					<p>
						<i class="fa-solid fa-heart" style="color: #ff0000;">&nbsp;13</i>
						댓글 0
						조회 0
					</p>
				</div>
			</div>
			<div class="bestPost">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
					<div class="imgCount">
						3
					</div>
				</div>
				<div class="postInfo">
					<p class="postTitle">강아지랑 놀았어용 너무 너무 너무 재밌었습니다</p>
					<p>강아지 산악회</p>
					<p>
						<i class="fa-solid fa-heart" style="color: #ff0000;">&nbsp;13</i>
						댓글 0
						조회 0
					</p>
				</div>
			</div>
			<div class="bestPost">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
					<div class="imgCount">
						3
					</div>
				</div>
				<div class="postInfo">
					<p class="postTitle">강아지랑 놀았어용 너무 너무 너무 재밌었습니다</p>
					<p>강아지 산악회</p>
					<p>
						<i class="fa-solid fa-heart" style="color: #ff0000;">&nbsp;13</i>
						댓글 0
						조회 0
					</p>
				</div>
			</div>
			<div class="bestPost">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
					<div class="imgCount">
						3
					</div>
				</div>
				<div class="postInfo">
					<p class="postTitle">강아지랑 놀았어용 너무 너무 너무 재밌었습니다</p>
					<p>강아지 산악회</p>
					<p>
						<i class="fa-solid fa-heart" style="color: #ff0000;">&nbsp;13</i>
						댓글 0
						조회 0
					</p>
				</div>
			</div>
			<div class="bestPost">
				<div class="imgBox">
					<img src="${pageContext.request.contextPath}/assets/images/dog1.jpg" class="coverImg">
					<div class="imgCount">
						3
					</div>
				</div>
				<div class="postInfo">
					<p class="postTitle">강아지랑 놀았어용 너무 너무 너무 재밌었습니다</p>
					<p>강아지 산악회</p>
					<p>
						<i class="fa-solid fa-heart" style="color: #ff0000;">&nbsp;13</i>
						댓글 0
						조회 0
					</p>
				</div>
			</div>
		</div>


	</div>
</body>
</html>