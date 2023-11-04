<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책소식 홈</title>
<link href="${pageContext.request.contextPath}/assets/css/community/myAddress.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/community/commHome.css" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- header&nav -->
	<jsp:include page="/WEB-INF/views/global/header.jsp"></jsp:include>
	
	<div class="contents">		
		<div class="subtitle">
			<h1> 산책소식 홈 </h1>
			<!-- 글쓰기 버튼 -->
			<ul class="mine">
				<button class="badge text-bg-primary">  
					<a class="aTag" href="${pageContext.request.contextPath}/comm/insert" >글쓰기</a>
				</button>&nbsp;
				<a class="aTags" href="${pageContext.request.contextPath}/comm/admin"> 내 소식 </a>&nbsp;
				<a class="aTags" href=""> 내 게시글 </a>&nbsp;
				<a class="aTags" href=""> 내 댓글 </a>
			</ul>
		</div>	
			
		<div class="search">		
			<div class="address">
				<span class="myColor">천호동</span>&nbsp; <i class="fa-regular fa-square-caret-down"></i>
			</div>	
			
			<div>
				<button class="img-button" type="submit" name="click" value="">
				<i class="fas fa-search"></i>
				</button>	
				<input type="text" class="box" value="검색">			
			</div>								
		</div>	
		
		<!-- -------------------------------------------------------------- -->	
				
		<div class="content">
						    			        
	      	<div class="likeBox">
	      		<div id="lBox" class="likeBox-01">
	      			<h3 id="h3"> 우리동네 인기강아지 </h3>
	      			<img id="mainImg" src="${pageContext.request.contextPath}/assets/images/234.jpg" alt="Profile Image 1">
	      			<div id="subBox">
	      				<img id="subImg" src="${pageContext.request.contextPath}/assets/images/345.jpg" alt="Profile Image 1">
	      				<img id="subImg" src="${pageContext.request.contextPath}/assets/images/123.jpg" alt="Profile Image 1">
	      		
	      			</div>
	      		</div>
	      			
	      		<div id="lBox" class="likeBox-02">
	      		
	      			<h3 id="h3"> 우리동네 인기소식 </h3>
	      			<!-- -------------------------------style="font-size: 24px;"------------------------------- -->
	      			<div class="content-info">
			         	<div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/345.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 소식 </span>&nbsp;강아지 산책의 중요성! : 도그마루 유용한 정보</div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기...</div>
				            <div class="like"> <i id="likeIcon" class="fa-solid fa-heart">&nbsp;12</i> &nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/345.jpg"></a>
				        </div>					        
			         </div>
			         <!-- -------------------------------------------------------------- -->
			         <div class="content-info">
			         	<div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/345.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 정보 </span>&nbsp;"자기가 원하는 대로만 가려고 해요"…올바른 강아지 산책법</div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기...</div>
				            <div class="like"> <i id="likeIcon" class="fa-solid fa-heart">&nbsp;12</i> &nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/345.jpg"></a>
				        </div>					        
			         </div>
			         <!-- -------------------------------------------------------------- -->
			         <div class="content-info">
			         	<div class="textArea">
			            	<div class="author-info">
				                <div class="profile-circle">
				                    <img src="${pageContext.request.contextPath}/assets/images/345.jpg" alt="Profile Image 1">
				                </div>
				                <div class="author-details">
							        <div class="profile">루비엄마</div>
							        <div class="time">7분전</div>
							    </div>
				            </div>
			            
				            <div class="title"><span class="badge text-bg-success"> 질문 </span>&nbsp;강아지 산책, 왜 주인을 항상 앞서서 가는걸까?</div>
				            <div class="content-text">여러분들은 강아지 산책의 중요성에 대해서 알고 계신가요? 더운 여름이 지나가고, 
				            산책을 하기 좋은 따뜻한 날이 오면서 반려견과 함께 바깥을 나가는 일은 정말 즐거운 일이랍니다. 
				            보통 강아지들의 산책시기는 접종이 끝난 4개월이 적당하다고 하시는데요. 하지만 이시기에 산책을 하게 되면 사회성을 키우기...</div>
				            <div class="like"> <i id="likeIcon" class="fa-solid fa-heart">&nbsp;12</i> &nbsp; 댓글 7&nbsp; 조회수 32  </div>
			            </div>			            
			            <div class="images">
				            <a><img src="${pageContext.request.contextPath}/assets/images/345.jpg"></a>
				        </div>					        
			         </div>
	      		</div>
	      		
	      	</div>
	      	
	      	<div class="rankingBox">
	      		<div id="rBox" class="rankingBox-01">
	      			<h3 id="h3"> 우리동네 핫한소식 </h3>
	      			<div class="ranking">
	      				<li id="rNum">1.<a id="tNum"> 안녕하세요. 강아지가 참 이쁘죠</a></li>
	      				<li id="rNum">2.<a id="tNum"> 강아지 산책 강아지 산책의 중요성! : 도그마루...</a></li>
	      				<li id="rNum">3.<a id="tNum"> [칼럼] (8) 초보 견주가 알아야할 강아지 산책 ...</a></li>
	      				<li id="rNum">4.<a id="tNum"> 필수 강아지 산책 용품 | 이것만은 꼭 챙겨요!</a></li>
	      				<li id="rNum">5.<a id="tNum"> 강아지 산책, 왜 주인을 항상 앞서서 가는걸까?</a></li>
	      				<li id="rNum">6.<a id="tNum"> 반려견 산책과 죄책감…"매일 못하면 학대일...</a></li>
	      				<li id="rNum">7.<a id="tNum"> 강아지 산책, 왜 주인을 항상 앞서서 가는걸까?</a></li>
	      				<li id="rNum">8.<a id="tNum"> 강형욱이 산책하는 법 | Trail Dog [그 남자의...</a></li>
	      				<li id="rNum">9.<a id="tNum"> 강아지 산책, 주말에만 시켜줘도 괜찮을까요?</a></li>
	      				<li id="rNum">10.<a id="tNum"> 매번 똑같은 산책로가 지겹다면? '서울 산책...</a></li>	      			
	      			</div>
	      		</div>
	      		
	      		<div id="rBox" class="rankingBox-02">
	      			<h3 id="h3"> 우리동네 핫한소식 </h3>
	      			<div class="ranking">
	      				<li id="rNum">1.<a id="tNum"> 안녕하세요. 강아지가 참 이쁘죠</a></li>
	      				<li id="rNum">2.<a id="tNum"> 강아지 산책 강아지 산책의 중요성! : 도그마루...</a></li>
	      				<li id="rNum">3.<a id="tNum"> [칼럼] (8) 초보 견주가 알아야할 강아지 산책 ...</a></li>
	      				<li id="rNum">4.<a id="tNum"> 필수 강아지 산책 용품 | 이것만은 꼭 챙겨요!</a></li>
	      				<li id="rNum">5.<a id="tNum"> 강아지 산책, 왜 주인을 항상 앞서서 가는걸까?</a></li>
	      				<li id="rNum">6.<a id="tNum"> 반려견 산책과 죄책감…"매일 못하면 학대일...</a></li>
	      				<li id="rNum">7.<a id="tNum"> 강아지 산책, 왜 주인을 항상 앞서서 가는걸까?</a></li>
	      				<li id="rNum">8.<a id="tNum"> 강형욱이 산책하는 법 | Trail Dog [그 남자의...</a></li>
	      				<li id="rNum">9.<a id="tNum"> 강아지 산책, 주말에만 시켜줘도 괜찮을까요?</a></li>
	      				<li id="rNum">10.<a id="tNum"> 매번 똑같은 산책로가 지겹다면? '서울 산책...</a></li>		      			
	      			</div>
	      		</div>
	      		
	      		<div id="rBox" class="rankingBox-03">
	      			<h3 id="h3"> 우리동네 핫한소식 </h3>
	      			<div class="ranking">
	      				<li id="rNum">1.<a id="tNum"> 안녕하세요. 강아지가 참 이쁘죠</a></li>
	      				<li id="rNum">2.<a id="tNum"> 강아지 산책 강아지 산책의 중요성! : 도그마루...</a></li>
	      				<li id="rNum">3.<a id="tNum"> [칼럼] (8) 초보 견주가 알아야할 강아지 산책 ...</a></li>
	      				<li id="rNum">4.<a id="tNum"> 필수 강아지 산책 용품 | 이것만은 꼭 챙겨요!</a></li>
	      				<li id="rNum">5.<a id="tNum"> 강아지 산책, 왜 주인을 항상 앞서서 가는걸까?</a></li>
	      				<li id="rNum">6.<a id="tNum"> 반려견 산책과 죄책감…"매일 못하면 학대일...</a></li>
	      				<li id="rNum">7.<a id="tNum"> 강아지 산책, 왜 주인을 항상 앞서서 가는걸까?</a></li>
	      				<li id="rNum">8.<a id="tNum"> 강형욱이 산책하는 법 | Trail Dog [그 남자의...</a></li>
	      				<li id="rNum">9.<a id="tNum"> 강아지 산책, 주말에만 시켜줘도 괜찮을까요?</a></li>
	      				<li id="rNum">10.<a id="tNum"> 매번 똑같은 산책로가 지겹다면? '서울 산책...</a></li>	      			
	      			</div>
	      		</div>
	      	</div>
			
		</div>
		
				
		
		
		
			
				
	</div>
	
</body>
</html>