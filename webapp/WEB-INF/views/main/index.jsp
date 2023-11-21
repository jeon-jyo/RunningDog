<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/index.css" rel="stylesheet" type="text/css">


</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<section>
    <div class="videoFrame">
        <!-- <video src="../video.mp4" autoplay loop muted></video> -->
        <video src="${pageContext.request.contextPath}/assets/video/wd1080.mp4" autoplay loop muted></video>
    </div>
    
</section>

</body>
</html>


