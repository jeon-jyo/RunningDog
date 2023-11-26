<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/walkMeeting/meetingInsert.css" rel="stylesheet" type="text/css">
<script src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=3tull6ku3q"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="${pageContext.request.contextPath}/assets/css/global/slick.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>

</head>
<body>
	<jsp:include page="../global/header.jsp"></jsp:include>
	<form action="${pageContext.request.contextPath}/walkmeeting/insertMeeting" class="contents">
		<p class="pageTitle">모임 등록</p>
		<p class="inputTitle">모임 이름</p>
		<input type="text" class="form-control meetingTitle" placeholder="모임명 입력" aria-label="Username" name="name">
		<div class="inputGroup">
			<p class="inputTitle">모임 날짜 입력</p>
			<div class="inputItem datetime">
				<input type="date" class="form-control" placeholder="Username" aria-label="Username" name="meetingDate">
				<input type="time" name="time" class="time">
			</div>
			<div class="inputMember">
				<p class="inputTitle">모임 인원 입력</p>
				<input class="fmradio form-check-input" type="radio" name="maxMember" id="" value="2">2
				<input class="mradio form-check-input" type="radio" name="maxMember" id="" value="3">3
				<input class="mradio form-check-input" type="radio" name="maxMember" id="" value="4">4
				<input class="mradio form-check-input" type="radio" name="maxMember" id="" value="5">5
				<input class="mradio form-check-input" type="radio" name="maxMember" id="" value="6">6
				<input class="mradio form-check-input" type="radio" name="maxMember" id="" value="7">7
				<input class="mradio form-check-input" type="radio" name="maxMember" id="" value="8">8
			</div>
		</div>
		<p class="inputTitle">강아지 크기</p>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="T" name="small">
		  <label class="form-check-label" for="inlineCheckbox1">소형견</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="T" name="medium">
		  <label class="form-check-label" for="inlineCheckbox2">중형견</label>
		</div>
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="T" name="large">
		  <label class="form-check-label" for="inlineCheckbox3">대형견</label>
		</div>
		<i class="fa-solid fa-circle-exclamation" data-bs-html="true" data-toggle="tooltip" data-placement="top" 
		title="~7kg 소형견 <br> 7~11kg 중형견 <br> 11kg ~ 대형견"></i>
	
		<div class="inputGroup">
			<div class="inputImg">
				<p class="inputTitle">산책로 선택</p>
				<input id="tnameInput" type="text" class="form-control" placeholder="" aria-label="Username" readonly="readonly">
				<input type="hidden" name="trailNo" value="" class="tnameInput">
				<button id="searchTrailBtn" class="btn btn-primary" type="button">산책로 찾기</button>
				<img class="mapImg" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/anber_remaster.jpg';" src="">
			</div>
		</div>
				
		<p class="inputTitle">모임 설명</p>
		<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="모임 설명 입력" name="description"></textarea>
		
		<p class="inputTitle">강아지 선택</p>
		<div class="dogSlickBox">
			<button class="leftBtn lB1"><</button>
			<div class="dogList">
			
				<c:forEach items="${requestScope.dogList}" var="dogVo">
					<div class="dog">
						<div class="imgBox">
							<img class="coverImg" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/images/dog_default_img.jpg';" src="${pageContext.request.contextPath}/rdimg/dogProfile/${dogVo.saveName}">
						</div>
						<div>
							<p>이름: ${dogVo.dogName}</p>
							<p>체중: ${dogVo.weight}kg</p>
							<p>보호자: ${dogVo.userName}</p>
							<div class="checkbox">
								선택: <input type="checkbox" value="${dogVo.dogNo}" name="dogNo">
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			<button class="rightBtn rB1">></button>
		</div>

		<div class="btnArea">
			<button type="submit" class="btn btn-primary">등록하기</button>
		</div>
	</form>

		
	<div class="modal fade" id="addressModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<select name="what" id="searchUser">
						<option value="name">산책로 이름</option>
						<option value="spot">동네</option>
					</select>
					<input type="text" class="form-control" id="searchAddressInput" placeholder="이름이나 위치로 검색해보세요">
					<button id="searchAddressBtn" type="button" class="btn btn-primary">검색하기</button>
				</div>
				
				<form id="" method="post" action="">
					<div class="modal-body">
						<div id="showAddressList" class="form-group">
							<table id="trailListTable">
								<thead id="theadTr">
									<tr>
										<td>이름</td>
										<td>위치</td>
										<td>길이</td>
										<td>소요시간</td>
									</tr>
								</thead>
								<tbody id="trailListTbody">
								
								</tbody>
							</table>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>



<script type="text/javascript">
$(function(){
    $('.dogList').slick({

        speed:1000,
     
        draggable: true,
        autoplay : false, 

        arrows: true,
         prevArrow: $('.lB1'),
         nextArrow: $('.rB1'),
        dots: true,
        
        infinite: false,
        slidesToShow: 5,
        slidesToScroll: 5

    });
});

$(function () {
  $('[data-toggle="tooltip"]').tooltip();
})



//산책로 검색 버튼 클릭 시 모달
$("#searchTrailBtn").on("click", ()=>{
	//열기
	$("#addressModal").modal("show");
});


//엔터 누르면
$("#searchAddressInput").keydown(function(e){
	if(e.keyCode == '13'){
		$("#searchAddressBtn").trigger( "click" );
	  };
});

//동네 검색 -> 리스트 뿌려줌 (ajax)
$("#searchAddressBtn").on("click", ()=>{
	
	const keyword = $("#searchAddressInput").val();
	const what = $('#searchUser option:selected').val()
	
	$.ajax({
		url : "${pageContext.request.contextPath}/walkmeeting/searchTrail",
		type : "post",
		//보낼 때
		/* contentType : "application/json", */
		data : {
			keyword: keyword,
			what: what
			},

		//받을 때
		dataType : "json",
		success : function(trailList){
			
			$("#trailListTbody").html("");
			
			for(let i = 0; i<trailList.length; i++){
				
				render(trailList[i]);
			}

		},

		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
});


function render(trailVo){
	
	let str = '';
	str += '<tr data-lno="'+trailVo.trailNo+'" class="trailSelect">';
	str += '	<td class="name">'+trailVo.name+'</td>';
	str += '	<td class="spot">'+trailVo.spot+'</td>';
	str += '	<td class="distance">'+trailVo.distance+'</td>';
	str += '	<td class="eta">'+trailVo.eta+'</td>';
	str += '	<td class="saveName" style="display:none">'+trailVo.saveName+'</td>';
	str += '</tr>';
	
	$("#trailListTbody").append(str);
};

//새로 그린 건 위임을 통해 지정해야 함
$("#trailListTable").on("click", ".trailSelect", function(){
	let $this = $(this);
	
	//input hidden에 값 넣기
	let lno = parseInt($this.data("lno"));
	$(".tnameInput").val(lno);
	
	//선택된 산책로 이름 출력
	let name = $this.children(".name").text();
	let spot = $this.children(".spot").text();
	$("#tnameInput").val(name+" / "+spot);
	
	//산책로 이미지 출력
	let saveName = $this.children(".saveName").text();
	$(".mapImg").attr("src", "${pageContext.request.contextPath}/rdimg/trail/"+saveName);
	
	
	$("#addressModal").modal("hide");
	
});



</script>


</body>
</html>