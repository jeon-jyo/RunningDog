<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

	<jsp:include page="sideBar.jsp"></jsp:include>
	
	
	<div id="dogProfile">

		<div class="firstElement">
			<h1>강아지 카드</h1>
			<div>#${requestScope.selectUser.code}</div>
		</div>
		
		<div class="noBorder">
			<a href="${pageContext.request.contextPath}/setting/dogInsertForm" class="button">등록하기</a>
		</div>

		<h2 class="myDogWord">우리 아이</h2>
		
		<div class="dogSlickBox">
			
			<button class="leftBtn lB1"><</button>
			
			<div class="dogCardBox dCB1">
	
			<c:choose>
			    <c:when test="${not empty requestScope.dogListMap.dogList || requestScope.dogListMap.dogList.size() != 0}">
				   	<c:forEach items="${requestScope.dogListMap.dogList}" var="dogVo">
						<div class="dogCard" style="background-color: ${dogVo.color};">
							<img class="profileImg" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/dog_default_img.jpg';" src="${pageContext.request.contextPath}/rdimg/dogProfile/${dogVo.saveName}">
							
							<h3>강아지 카드</h3>
							<div>이름: ${dogVo.dogName}</div>
							<c:choose>
							    <c:when test="${dogVo.kind != null && dogVo.kind != ''}">
   									<div>품종: ${dogVo.kind}</div>
							    </c:when>
							    <c:otherwise>
	 								<div>품종: -</div>
							    </c:otherwise>
							</c:choose>
							<div class="dogCardElimentL">나이: ${dogVo.birth} 살</div>
							<c:if test="${dogVo.gender == 'female'}">
								<div class="dogCardElimentS">성별: 여</div>
							</c:if>
							<c:if test="${dogVo.gender == 'male'}">
								<div class="dogCardElimentS">성별: 남</div>
							</c:if>
							<div class="dogCardElimentL">체중: ${dogVo.weight} kg</div>
							<c:choose>
							    <c:when test="${dogVo.neuter == 'T'}">
							   		<div class="dogCardElimentS">중성화: O</div>
							    </c:when>
							    <c:when test="${dogVo.neuter == 'F'}">
							   		<div class="dogCardElimentS">중성화: X</div>
							    </c:when>
							    <c:otherwise>
									 <div class="dogCardElimentS">중성화: -</div>
							    </c:otherwise>
							</c:choose>
							<c:choose>
							    <c:when test="${dogVo.personality != null && dogVo.personality != ''}">
							   		<div class="personal">성격: ${dogVo.personality}</div>
							    </c:when>
							    <c:otherwise>
									<div class="personal">성격: -</div>
							    </c:otherwise>
							</c:choose>
							
							<div class="lastElement">보호자: ${dogVo.userName}</div>
							
							<!-- null + 값 예외 처리 해야 함 -->
							
							<a class="iconPencil" href="${pageContext.request.contextPath}/setting/dogModifyForm?no=${dogVo.dogNo}"><i class="fa-regular fa-pen-to-square"></i></a>
						</div>
					</c:forEach>
			    </c:when>
			    <c:otherwise>
					 <div class="dogCard emptyCard">
					강아지를 등록해보세요!
					</div>
			    </c:otherwise>
			</c:choose>

				<!-- 인증마크 -->
				<%-- <img class="certifyMark" src="${pageContext.request.contextPath}/assets/images/bluemark.png"> --%>

			</div> <!-- dogCardBox -->
			
			<button class="rightBtn rB1">></button>
			
		</div> <!-- dogSlickBox -->
			
			
		<h2 class="">친구 강아지</h2>
		
		<div class="dogSlickBox">
			
			<button class="leftBtn lB2"><</button>
			
			<div class="dogCardBox dCB2">
			<c:choose>
			    <c:when test="${not empty requestScope.dogListMap.friendDogList || requestScope.dogListMap.friendDogList.size() != 0}">
				   	<c:forEach items="${requestScope.dogListMap.friendDogList}" var="dogVo">
						<div class="dogCard" style="background-color: ${dogVo.color};">
							<img class="profileImg" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/dog_default_img.jpg';" src="${pageContext.request.contextPath}/rdimg/dogProfile/${dogVo.saveName}">
							
							<h3>강아지 카드</h3>
							<div>이름: ${dogVo.dogName}</div>
							<c:choose>
							    <c:when test="${dogVo.kind != null && dogVo.kind != ''}">
   									<div>품종: ${dogVo.kind}</div>
							    </c:when>
							    <c:otherwise>
	 								<div>품종: -</div>
							    </c:otherwise>
							</c:choose>
							<div class="dogCardElimentL">나이: ${dogVo.birth} 살</div>
							<c:if test="${dogVo.gender == 'female'}">
								<div class="dogCardElimentS">성별: 여</div>
							</c:if>
							<c:if test="${dogVo.gender == 'male'}">
								<div class="dogCardElimentS">성별: 남</div>
							</c:if>
							<div class="dogCardElimentL">체중: ${dogVo.weight} kg</div>
							<c:choose>
							    <c:when test="${dogVo.neuter == 'T'}">
							   		<div class="dogCardElimentS">중성화: O</div>
							    </c:when>
							    <c:when test="${dogVo.neuter == 'F'}">
							   		<div class="dogCardElimentS">중성화: X</div>
							    </c:when>
							    <c:otherwise>
									 <div class="dogCardElimentS">중성화: -</div>
							    </c:otherwise>
							</c:choose>
							<c:choose>
							    <c:when test="${dogVo.personality != null && dogVo.personality != ''}">
							   		<div class="personal">성격: ${dogVo.personality}</div>
							    </c:when>
							    <c:otherwise>
									<div class="personal">성격: -</div>
							    </c:otherwise>
							</c:choose>
							
							<div class="lastElement">보호자: ${dogVo.userName}</div>
						</div>
					</c:forEach>
			    </c:when>
			    <c:otherwise>
					<div class="dogCard emptyCard">
						공유받은 강아지가 없어요
					</div>
			    </c:otherwise>
			</c:choose>
			
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