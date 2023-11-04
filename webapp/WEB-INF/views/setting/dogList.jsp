<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕이</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/global/slick.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>

</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<ul id="settingsMenu">
		<li class=""><a href="${pageContext.request.contextPath}/setting/myProfile">내 정보</a></li>
		<li class="selected"><a href="${pageContext.request.contextPath}/setting/dogList">강아지</a></li>
		<li class="settingSubLi selectedBold"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogList">강아지 카드</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/dogInsert">강아지 등록</a></li>
		<li class=""><a href="${pageContext.request.contextPath}/setting/friendList">친구</a></li>
		<li class="settingSubLi"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendList">친구 목록</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApplied">내가 받은 신청</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendApply">내가 한 신청</a></li>
		<li class="settingSubLi noTopBorder"><a class="setting_sub" href="${pageContext.request.contextPath}/setting/friendSearch">회원 검색</a></li>
		<li class="last_li"><a href="${pageContext.request.contextPath}/setting/resign">회원탈퇴</a></li>
	</ul>
	
	
	<div id="dogProfile">

		<div class="firstElement">
			<h1>강아지 카드</h1>
			<div>#회원코드</div>
		</div>
		
		<div class="noBorder">
			<a href="" class="button">등록하기</a>
		</div>

		<h2 class="myDogWord">우리 아이</h2>
		
		<div class="dogSlickBox">
			
			<button class="leftBtn lB1"><</button>
			
			<div class="dogCardBox dCB1">
	
				<div class="dogCard">
					
					<img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/liltriber.jpg">
					<img class="certifyMark" src="${pageContext.request.contextPath}/assets/images/bluemark.png">
					
					<h3>강아지 카드</h3>
					<div>이름: 릴파</div>
					<div>품종: </div>
					<div class="dogCardEliment">생일: 1972.11.21</div>
					<div class="dogCardEliment">성별: </div>
					<div class="dogCardEliment">체중: </div>
					<div class="dogCardEliment">중성화: </div>
					<div class="personal">성격: 천 구 백 칠 십이 년 십 일 월 이 십 이 일 김두한</div>
					<div class="lastElement">보호자: </div>
					
					<a class="iconPencil" href=""><i class="fa-regular fa-pen-to-square"></i></a>
				</div>
				
				<div class="dogCard">
					
					<img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/liltriber.jpg">
					
					<h3>강아지 카드</h3>
					<div>이름: 띨파</div>
					<div>품종: </div>
					<div class="dogCardEliment">생일: </div>
					<div class="dogCardEliment">성별: </div>
					<div class="dogCardEliment">체중: </div>
					<div class="dogCardEliment">중성화: </div>
					<div class="personal">성격: bbbb</div>
					<div class="lastElement">보호자: </div>
					
					<a class="iconPencil" href=""><i class="fa-regular fa-pen-to-square"></i></a>
				</div>
				
				<div class="dogCard">
					
					<img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/liltriber.jpg">
					
					<h3>강아지 카드</h3>
					<div>이름: 뇨파</div>
					<div>품종: </div>
					<div class="dogCardEliment">생일: </div>
					<div class="dogCardEliment">성별: </div>
					<div class="dogCardEliment">체중: </div>
					<div class="dogCardEliment">중성화: </div>
					<div class="personal">성격: qqqq</div>
					<div class="lastElement">보호자: </div>
					
					<a class="iconPencil" href=""><i class="fa-regular fa-pen-to-square"></i></a>
				</div>
				
				<div class="dogCard">
					
					<img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/liltriber.jpg">
					
					<h3>강아지 카드</h3>
					<div>이름: 이제 쓸 이름이 없다</div>
					<div>품종: </div>
					<div class="dogCardEliment">생일: </div>
					<div class="dogCardEliment">성별: </div>
					<div class="dogCardEliment">체중: </div>
					<div class="dogCardEliment">중성화: </div>
					<div class="personal">성격: asdf</div>
					<div class="lastElement">보호자: </div>
					
					<a class="iconPencil" href=""><i class="fa-regular fa-pen-to-square"></i></a>
				</div>
	
	
				<div class="dogCard emptyCard">
					강아지를 등록해보세요!
				</div>
				
			</div> <!-- dogCardBox -->
			
			<button class="rightBtn rB1">></button>
			
		</div> <!-- dogSlickBox -->
			
			
		<h2 class="">패밀리 강아지</h2>
		
		<div class="dogSlickBox">
			
			<button class="leftBtn lB2"><</button>
			
			<div class="dogCardBox dCB2">
	
				<div class="dogCard emptyCard">
					공유받은 강아지가 없어요
				</div>
	
			</div>
			
			<button class="rightBtn rB2">></button>
			
		</div> <!-- dogSlickBox -->	
			
			
	</div> <!-- dogProfile -->
</div>

	
	
<script type="text/javascript">
$(function(){
    $('.dCB1').slick({

        speed:1000,
     
        draggable: true,
        autoplay : false, 

        arrows: true,
        prevArrow: $('.lB1'),
        nextArrow: $('.rB1'),
        dots: true,
        
        infinite: false,
        slidesToShow: 2,
        slidesToScroll: 2

    });
});

$(function(){
    $('.dCB2').slick({

        speed:1000,
     
        draggable: true,
        autoplay : false, 

        arrows: true,
        prevArrow: $('.lB2'),
        nextArrow: $('.rB2'),
        dots: true,
        
        infinite: false,
        slidesToShow: 2,
        slidesToScroll: 2

    });
});

</script>


</body>
</html>