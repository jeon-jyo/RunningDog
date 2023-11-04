<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책소식 글쓰기</title>
<link href="${pageContext.request.contextPath}/assets/css/community/myAddress.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/community/commInsert.css" rel="stylesheet" type="text/css">
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
			<h1>산책소식 글쓰기</h1>
			<!-- 글쓰기 버튼 -->
			<ul class="mine">				
				<a class="aTags" href=""> 내 소식 </a>&nbsp;
				<a class="aTags" href=""> 내 게시글 </a>&nbsp;
				<a class="aTags" href=""> 내 댓글 </a>
			</ul>
		</div>	
	
		<div class="content">		
			<div class="insertForm">
			
				<div class="insertHeader">
					<select class="form-select" aria-label="Default select example">
						<option selected value="1">우리동네 소통창구</option>
						<option value="2">강아지 자랑하기</option>
					</select>
				</div>
				
				<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				  <label class="btn btn-outline-success" for="btnradio1">소식</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				  <label class="btn btn-outline-success" for="btnradio2">정보</label>
				
				  <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
				  <label class="btn btn-outline-success" for="btnradio3">질문</label>
				</div>
				
				<button id="button" type="button" class="btn btn-secondary"
				        style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
				  취소
				</button>
				
				<button id="button" type="button" class="btn btn-primary"
				        style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;">
				  등록
				</button>			
			</div>
			
			<!-- 부트스트랩에서 가져온 인풋 폼 -->
			<label for="inputPassword5" class="form-label">제목</label>
			<input type="text" id="inputPassword5" class="form-control" aria-describedby="passwordHelpBlock">
			<div id="passwordHelpBlock" class="form-text">
			  제목을 입력해주세요.
			</div>
			
			<div class="insertBox">				
				<div id="summernote"></div>
			</div>
			
				
		</div>		
				
	</div>
	
	<!-- summernote js-->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
	integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>
	
	<!-- language pack -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>
	
	<!-- 이거 키면 헤더가 작동 안함
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	-->
	
	<script>
	$('#summernote').summernote({
	  placeholder: 'Summernote for Bootstrap 5',
	  tabsize: 2,
	  height: 700,
	  lang: 'ko-KR', // default: 'en-US'
	});
	</script>
	
</body>
</html>