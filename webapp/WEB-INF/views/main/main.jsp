<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/main.css" rel="stylesheet" type="text/css">


</head>
<body class="bg-secondary-subtle">
<jsp:include page="../global/header.jsp"></jsp:include>

<!-- 로그인 안 했을 때 동네 선택 버튼 숨기기 -->

<div id="pageContainer">

	<div class="myMenu">
	
		<div class="miniProfile backgroundWhite">
			<div class="textArea">
				<a href="">아델
					<img alt="" src="${pageContext.request.contextPath}/assets/images/adele.png">
				</a>
				<br>
				<span>(#12345)</span>	
			</div>
			<div class="menuList">
				<div class="smallMenu">
					<a href="">일지</a>
				</div>
				<div class="smallMenu">
					<a href="">모임</a>
				</div>
				<div class="smallMenu">
					<a href="">찜</a>
				</div>
				<div class="smallMenu">
					<a class="noBorder" href="">소식</a>
				</div>
			</div>
			<div class="menuList">
				<div class="smallMenu">
					<a href="">산책로</a>
				</div>
				<div class="smallMenu">
					<a href="">동아리</a>
				</div>
				<div class="smallMenu">
					<a href="">강아지</a>
				</div>
				<div class="smallMenu">
					<a class="noBorder" href="">패밀리</a>
				</div>
			</div>
			
		</div>
		
		<div class="sideMenu">
			<h3>산책 일지</h3>
			<div class="writeDate">2023.10.30</div>
			<div class="sideContent">
				<div class="sideContentTitle">일지 제목</div>
				<div class="sideContentSub">지도 표시</div>
			</div>
		</div>
		
		<div class="sideMenu">
			<h3>참여 모임</h3>
			<div class="writeDate">2023.10.30</div>
			<div class="sideContent">
				<div class="sideContentTitle">모임 제목</div>
				<div class="sideContentSub">지도 표시</div>
			</div>
		</div>
		
		<div class="sideMenu">
			<h3>찜 산책로</h3>
			<div class="writeDate">2023.10.30</div>
			<div class="sideContent">
				<div class="sideContentTitle">일지 제목</div>
				<div class="sideContentSub">지도 표시</div>
			</div>
		</div>
		
		<div class="sideMenu">
			<h3>내 소식</h3>
			<div class="writeDate">2023.10.30</div>
			<div class="sideContent">
				<div class="sideContentTitle">글 제목</div>
				<div class="sideContentWrite">
					<div>미안하다 이거 보여주려고 어그로끌었다.. 나루토 사스케 싸움수준 ㄹㅇ실화냐? 진짜 세계관최강자들의 싸움이다.. 그바보같은 나루토가 맞는지 정말 가슴이 웅장해진다 </div>
					<img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg">
				</div>
			</div>
		</div>

	</div>

	<div class="mainContent">
		<div class="mainContentOne">
			<h3>인기 산책로</h3>
			<a href="">+ 산책로 전체보기</a>
			<div class="contentHalf">
				<div class="cateTilte">많이 다닌 길</div>
				<div class="writerProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/adele.png">
					<div class="nameDate">
						<div class="nickname">아델</div>
						<div class="writeDate">1972.11.21</div>
					</div>
				</div>
				<div class="walkTitle">대충 산책로 제목 들어갈 곳</div>
				<div class="mapPlace">지도 표시</div>
			</div>
			
			<div class="contentHalf noBorder">
				<div class="cateTilte">찜 순</div>
				<div class="writerProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/adele.png">
					<div class="nameDate">
						<div class="nickname">아델</div>
						<div class="writeDate">1972.11.21</div>
					</div>
				</div>
				<div class="walkTitle">대충 산책로 제목 들어갈 곳</div>
				<div class="mapPlace">지도 표시</div>
			</div>
		</div>
		
		<div class="mainContentOne noMargin">
			<h3>인기 게시글</h3>
			<a href="">+ 게시글 전체보기</a>
			<div class="contentHalf">
				<div class="cateTilte">조회수</div>
				<div class="writerProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/adele.png">
					<div class="nameDate">
						<div class="nickname">아델</div>
						<div class="writeDate">1972.11.21</div>
					</div>
				</div>
				<div class="writeContent">
					<div class="writeContentTitle">글 제목</div>
					<div class="writeContentText">
						<div>
							청명한 달빛 그득한 죽림 어딘가
							오색 빛 나비 안내한 오솔길 따라
							나는 가만히 침소에 든 그댈 보아요
							꿈결에 아득한 꿈결에
							이른 서리 아침에 잠에서 깨어
							문득 목 놓아 울고 말았죠
							사무치게 보고 싶은 그대 그리며
							
							그대와 마주할 때마다 나는 또 짓궃게 굴겠죠
							그래도 소녀를 용서해요 가슴속은 콩닥콩닥 꺄~~~?!
							부디 이 마음 알아채지 말아 주세요
							진짜 진짜 정말 정말 보고팠어요
							밝은 달 아래서 정화수 떠 놓고 빌었다죠
							그댈 감쪽같이 속여요 전부 여우처럼 숨길 거에요
							욕심 많고 거짓뿐인 소녀의 꿈은 다 그런 법이죠
							모른 체해줘요 				
						</div>
						<img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg"  alt="${pageContext.request.contextPath}/assets/images/logo.png">
					</div>
				</div>
			</div>
			
			<div class="contentHalf noBorder">
				<div class="cateTilte">추천수</div>
				<div class="writerProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/adele.png">
					<div class="nameDate">
						<div class="nickname">아델</div>
						<div class="writeDate">1972.11.21</div>
					</div>
				</div>
				<div class="writeContent">
					<div class="writeContentTitle">글 제목</div>
					<div class="writeContentText">
						<div>
							따사한 햇살 가득한 호수 어딘가
							황금빛 물결 안내한 피안 저편에
							나는 애타게 그댈 향해 손을 뻗어요
							가까이 제발 더 가까이
							노을 지는 오후에 잠에서 깨어
							다시 목 놓아 울고 말았죠
							환영처럼 닿지 못할 그대 그리며
							
							여전히 태연한 그대를 나는 또 난처하게 해요
							황망한 그대 눈 멈춘 곳에 여우 꼬리 살랑살랑 꺄~~~?!
							부디 이 마음 알아채지 말아 주세요
							아주 아주 너무 너무 그리웠어요
							호수에 몸담아 간절히 시청드렸었다죠
							내게 홀렸어요 속았죠 전부 여우한테 당한 거예요
							질투 많고 집착뿐인 소녀의 꿈을 다 이룰 거에요
							정말로 모르죠?
						</div>
						<img src="${pageContext.request.contextPath}/assets/images/Yoshi.jpg" alt="${pageContext.request.contextPath}/assets/images/logo.png">
					</div>
				</div>
			</div>
		</div>
		
		<div class="mainContentOne noMargin">
			<h3>인기 동아리</h3>
			<a href="">+ 동아리 전체보기</a>
			<div class="contentHalf">
				<div class="cateTilte">맴버수</div>
				<div class="clubProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/dog.jpg">
					<div class="clubBox">
						<div class="clubName">강아지 동아리</div>
						<div class="clubContent">맴버 21574</div>
					</div>
				</div>
				<div class="clubProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/dog.jpg">
					<div class="clubBox">
						<div class="clubName">강아지 동아리</div>
						<div class="clubContent">맴버 21574</div>
					</div>
				</div>
				<div class="clubProfile noMargin">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/dog.jpg">
					<div class="clubBox">
						<div class="clubName">강아지 동아리</div>
						<div class="clubContent">맴버 21574</div>
					</div>
				</div>

			</div>
			
			<div class="contentHalf noBorder">
				<div class="cateTilte">모임수</div>
				<div class="clubProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/dog.jpg">
					<div class="clubBox">
						<div class="clubName">강아지 동아리</div>
						<div class="clubContent">모임 2134</div>
					</div>
				</div>
				<div class="clubProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/dog.jpg">
					<div class="clubBox">
						<div class="clubName">강아지 동아리</div>
						<div class="clubContent">모임 2134</div>
					</div>
				</div>
				<div class="clubProfile noMargin">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/dog.jpg">
					<div class="clubBox">
						<div class="clubName">강아지 동아리</div>
						<div class="clubContent">모임 2134</div>
					</div>
				</div>				
			</div>
		</div>
		
		<div class="mainContentOne noMargin">
			<h3>산책왕 & 인기왕</h3>
			<a href="">+ 산책 일지 전체보기</a>
			<div class="contentHalf">
				<div class="cateTilte">일지 작성수</div>
				<div class="writerProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/adele.png">
					<div class="nameDate">
						<div class="nickname">아델</div>
						<div class="clubName">이번 달 작성 일지: 54</div>
					</div>
				</div>
				<div class="walkTitle">대충 산책로 제목 들어갈 곳</div>
				<div class="mapPlace">지도 표시</div>
			</div>
			
			<div class="contentHalf noBorder">
				<div class="cateTilte">방문자수</div>
				<div class="writerProfile">
					<img alt="" src="${pageContext.request.contextPath}/assets/images/adele.png">
					<div class="nameDate">
						<div class="nickname">아델</div>
						<div class="clubName">이번 달 방문자 수: 1234</div>
					</div>
				</div>
				<div class="walkTitle">대충 산책로 제목 들어갈 곳</div>
				<div class="mapPlace">지도 표시</div>
			</div>
		</div>
		
	
	</div>


</div>


</body>
</html>