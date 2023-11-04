<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강아지 자랑하기</title>
<link href="${pageContext.request.contextPath}/assets/css/community/myAddress.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/community/commGallery.css" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- header&nav -->
	<jsp:include page="/WEB-INF/views/global/header.jsp"></jsp:include>
	
	<div class="contents">		
		<div class="subtitle">
			<h1>강아지 자랑하기</h1>
			<!-- 글쓰기 버튼 -->
			<ul class="mine">
				<button class="badge text-bg-primary">  
					<a class="aTag" href="${pageContext.request.contextPath}/comm/insert" >글쓰기</a>
				</button>&nbsp;
				<a class="aTags" href=""> 내 소식 </a>&nbsp;
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
				
		<div class="content">
		
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
		</div>
		
		<!-- -------------------------------------------------------------- -->
		
		<div class="content">
		
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
		</div>
		
				
		<!-- -------------------------------------------------------------- -->
		
		<div class="content">
		
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
			<!-- ---------------------- -->
			
			<div class="galleryBox">
				<div class="text-center">
					<img src="${pageContext.request.contextPath}/assets/images/345.jpg" class="img-thumbnail" alt="...">
				</div>
				<div class="galleryContent">
					<li class="icon"><i class="fa-solid fa-heart"></i> 12</li>	
					<li> 프로필 사진을 ...</li>				
					<li> 루비엄마 </li>
					<li> 방금전 댓글10 조회2 </li>
				</div>
			</div>	
			
		</div>
		
				
		<!-- -------------------------------------------------------------- -->
	
		
		<div id="list">
			<div id="paging">
				<nav aria-label="...">
				  <ul class="pagination">
				    <li class="page-item disabled">
				      <a class="page-link">Previous</a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    
				    <li class="page-item active" aria-current="page">
				      <a class="page-link" href="#">2</a>
				    </li>
				    
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    
				    <li class="page-item"><a class="page-link" href="#">4</a></li>
				    
				    <li class="page-item"><a class="page-link" href="#">5</a></li>
				    
				    <li class="page-item"><a class="page-link" href="#">6</a></li>
				    
				    <li class="page-item"><a class="page-link" href="#">7</a></li>
				    
				    <li class="page-item"><a class="page-link" href="#">8</a></li>
				    
				    <li class="page-item"><a class="page-link" href="#">9</a></li>
				    
				    <li class="page-item"><a class="page-link" href="#">10</a></li>
				    
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				    
				  </ul>
				</nav>
			</div>
		</div>	
			
				
	</div>
	
</body>
</html>