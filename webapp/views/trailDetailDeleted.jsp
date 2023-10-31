<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailDetailDeleted</title>
<link href="${pageContext.request.contextPath}/assets/css/trailDetail.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contents">
		<h1><i class="fa-solid fa-star deleted"></i></i>&nbsp;삭제된 산책로</h1>
		
		<div class="section">
			<div class="location">이용할 수 없는 산책로입니다.</div>
		</div>
		
		<div class="map-container">
			<div class="map-container-left">
				<div class="main-map deleted"></div>
			</div>
		</div>
		<!-- // map-container -->

	</div>
</body>
<script type="text/javascript">
</script>
</html>