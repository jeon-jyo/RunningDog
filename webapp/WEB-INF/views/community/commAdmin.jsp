<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책소식 글쓰기</title>
<link href="${pageContext.request.contextPath}/assets/css/community/myAddress.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/community/commAdmin.css" rel="stylesheet" type="text/css">
<!-- summernote css-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
  integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
</head>
<body>

	<!-- header&nav -->
	<jsp:include page="/WEB-INF/views/global/header.jsp"></jsp:include>
	
	<div class="contents">	
		
		<div class="subtitle">
			<h1> 내 소식 </h1>
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
	
		<div class="content">		
			
			<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="#"> 우리동네 소통창구 </a>
			  </li>
			  
			  <li class="nav-item">
			    <a class="nav-link" href="#"> 강아지 자랑하기 </a>
			  </li>		
			  
			  <li class="nav-item">
			    <a class="nav-link" href="#">내 댓글</a>
			  </li>	
			  	 
			</ul>
			
			<div class="myList">
				<table class="table">
				  <thead class="table-light" >
				    <tr>
				   	  <th id="a" scope="col"></th>
				      <th id="c" scope="col">글번호</th>
				      <th id="c" scope="col">태그</th>
				      <th id="d" scope="col">제목</th>
				      <th id="b" scope="col">좋아요</th>
				      <th id="b" scope="col">댓글</th>
				      <th id="b" scope="col">조회수</th>
				      <th id="c" scope="col">글작성일</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				    <tr>
				      <td id="a"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				      <th id="c" scope="row">1</th>
				      <td id="c" >정보</td>
				      <td id="d">제목</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="c">2023.10.21</td>
				    </tr>
				    <tr>
				      <td id="a"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				      <th id="c" scope="row">1</th>
				      <td id="c" >정보</td>
				      <td id="d">제목</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="c">2023.10.21</td>
				    </tr>
				    <tr>
				      <td id="a"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				      <th id="c" scope="row">1</th>
				      <td id="c" >정보</td>
				      <td id="d">제목</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="c">2023.10.21</td>
				    </tr>
				    <tr>
				      <td id="a"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				      <th id="c" scope="row">1</th>
				      <td id="c" >정보</td>
				      <td id="d">제목</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="c">2023.10.21</td>
				    </tr>
				    <tr>
				      <td id="a"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
				      <th id="c" scope="row">1</th>
				      <td id="c" >정보</td>
				      <td id="d">제목</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="b">12</td>
				      <td id="c">2023.10.21</td>
				    </tr>
				   
				  </tbody>
				</table>
				
				<div id="cBox">
					<input id="cBoxCheck" class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> 전체선택
					
					<button id="cBoxDelete" type="button" class="btn btn-secondary btn-sm">선택삭제</button>
				</div>
				
				
				<div id="paging">
					<nav aria-label="...">
					  <ul class="pagination">
					    <li class="page-item disabled">
					      <a class="page-link">Prev</a>
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
				</div> <!--paging-->
				
			</div> <!--myList-->
									
		</div> <!--content-->
				
	</div> <!--contents-->
	
	
	
</body>
</html>