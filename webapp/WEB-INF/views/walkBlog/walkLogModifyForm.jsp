<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Walk Log Detail</title>
<link href="${pageContext.request.contextPath}/assets/css/walkBlog/index.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://kit.fontawesome.com/98aecd1b62.js" crossorigin="anonymous"></script>
=
<script>
	
</script>

</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>

	<section>
		<div class="contents">
			<div class="mainWrapper">

				<div class="mainPosts">



					<form action="${pageContext.request.contextPath}/walkBlog/${blogInfoVo.paramCode}/${walkLog.walkLogNo}/modify" method="post">
						<div class="mainRecordSection">





							<div class="mainRecord1">

								<input type="hidden" name="walkLogNo" value="${walkLog.walkLogNo}">


								<div class="MRprofileBox">

									<div class="MRprofileWrapper1">
										<div class="MRprofileImg1">
											<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
										</div>

										<div class="MRuserName1">${walkLog.name}</div>
									</div>
									<div class="wrappingBox">
										<div class="MRtitleBox">
											<div class="MRtime">${walkLog.regDate}</div>
											<div class="MRtitle">
												<input type="text" name="title" value="${walkLog.title}">
											</div>

										</div>

										<div class="MRrecordBox">
											<div class="MRdistanceBox">
												<div class="MRrecordData">${walkLog.distanceFormatted}km</div>
												<div class="MRlabel">산책거리</div>
											</div>
											<div class="MRtimeBox">
												<div class="MRrecordData">${walkLog.logTimeFormatted}</div>
												<div class="MRlabel">산책시간</div>
											</div>


										</div>
									</div>
									<c:if test="${requestScope.blogInfoVo.authNo != requestScope.blogInfoVo.ownerNo }">
										<div class="modifyDelete"></div>
									</c:if>
									<c:if test="${requestScope.blogInfoVo.authNo == requestScope.blogInfoVo.ownerNo }">
										<div class="modifyDelete">
											<button class="modifyButton" type="submit">수정 완료</button>
											<%-- <button class="modifyButton" onclick="location.href='${pageContext.request.contextPath}/walkBlog/${blogInfoVo.paramCode}/${walkLog.walkLogNo}/modify'">수정 완료</button> --%>
											<!-- <button class="deleteButton">삭제</button> -->

											<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">정말 삭제하시겠습니까?</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
															<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/walkBlog/delete?no=${walkLog.walkLogNo}'">삭제</button>
														</div>
													</div>
												</div>
											</div>

										</div>
									</c:if>
									<div class="MRdogCardBox">

										<div class="MRpartnerDoglabel">함께한 강아지</div>
										<div class="MRdogCards">
											<div class="MRdogCard1">
												<img src="${pageContext.request.contextPath}/assets/images/마루쉐.png" alt="">
												<div class="MRdogName">마루</div>
											</div>
											<div class="MRdogCard2">
												<img src="${pageContext.request.contextPath}/assets/images/연탄.png" alt="">
												<div class="MRdogName">연탄</div>
											</div>
											<div class="MRdogCard3">
												<img src="${pageContext.request.contextPath}/assets/images/도지.png" alt="">
												<div class="MRdogName">도지</div>
											</div>

										</div>



									</div>
									<div class="walkLogContent">
										<textarea rows="7" cols="72" style="resize: none;" name="content">${walkLog.content}</textarea>
									</div>


								</div>



								<div class="MRwalkRecordSection">
									<div class="MRwalkData">
										<img src="${pageContext.request.contextPath}/assets/images/산책데이터.png" alt="">
									</div>
									<div class="MRpictures">
										<!-- 이미지 가져오기 -->
										<c:forEach items="${walkLog.imageList}" var="image">
											<div class="MRpicture${image.imageOrder} ">
												<img src="${pageContext.request.contextPath}/assets/images/${image.saveName}" alt="">
											</div>
										</c:forEach>



									</div>
								</div>




								<div class="MRborder"></div>
							</div>


						</div>
					</form>

				</div>




			</div>
		</div>
	</section>
</body>
</html>
