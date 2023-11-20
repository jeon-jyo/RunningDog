<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/setting/setting.css" rel="stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<div class="pageContainer">

	<jsp:include page="sideBar.jsp"></jsp:include>
	
	<form method="post" action="${pageContext.request.contextPath}/setting/modifyMyProfile" id="profile" enctype="multipart/form-data">
	
		<div class="firstElement">
			<h1>내 정보 수정</h1>
			<div>#${requestScope.selectUser.code}</div>
		</div>
		
<!--  		<div class="imageArea"> -->
<!-- 			<div class="settingLabel">프로필 이미지</div> -->
<%-- 			<c:choose> --%>
<%-- 			    <c:when test="${requestScope.selectUser.saveName != null && requestScope.selectUser.saveName != ''}"> --%>
<!-- 			   		Result값이 있다면 실행할 로직 -->
<%-- 			   		<img id="savedProfileImg" class="profileImg" alt="" src="${pageContext.request.contextPath}/rdimg/userProfile/${requestScope.selectUser.saveName}"> --%>
<%-- 			    </c:when> --%>
<%-- 			    <c:otherwise> --%>
<!-- 					 그렇지 않다면 실행할 로직 -->
<%-- 					 <img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg"> --%>
<%-- 			    </c:otherwise> --%>
<%-- 			</c:choose> --%>
<!-- 			<button type="button" id="showImgModal">이미지 업로드</button> -->
<!-- 		</div> -->
		
		<div class="imageArea">
			<div class="settingLabel">프로필 이미지</div>
			<c:choose>
			    <c:when test="${requestScope.selectUser.saveName != null && requestScope.selectUser.saveName != ''}">
			   		<!-- Result값이 있다면 실행할 로직 -->
			   		<img class="profileImg" alt="" src="${pageContext.request.contextPath}/rdimg/userProfile/${requestScope.selectUser.saveName}">
			    </c:when>
			    <c:otherwise>
					 <!-- 그렇지 않다면 실행할 로직 -->
					 <img class="profileImg" alt="" src="${pageContext.request.contextPath}/assets/images/default_profile_img_white.jpg">
			    </c:otherwise>
			</c:choose>
			<label for="inputFile2" class="upload-btn" id="uploadLabel">
				<input id="inputFile2" type="file" name="file" accept="image/*">
			    <span class="form-text" >이미지 선택</span>
		    </label>
		</div>
		
		<div>
			<div class="settingLabel">닉네임</div>
			<input type="text" name="name" value="${requestScope.selectUser.name}" maxlength="10">
		</div>
		
		<div>
			<div class="settingLabel">생일</div>
			<c:if test="${requestScope.selectUser.birth != null && requestScope.selectUser.birth != ''}">
				<input type="date" name="birth" value="${requestScope.selectUser.birth}">
			</c:if>
			<c:if test="${requestScope.selectUser.birth == null && requestScope.selectUser.birth != ''}">
				<input type="date" name="birth" value="">
			</c:if>
		</div>
		
		<div class="genderSelect">
			<div class="settingLabel">성별</div>
			<c:if test="${requestScope.selectUser.gender != null && requestScope.selectUser.gender != ''}">
				<c:if test="${requestScope.selectUser.gender == 'female'}">
					<input type="radio" name="gender" value="male">남
					<input type="radio" name="gender" value="female" checked="checked">여
				</c:if>
				<c:if test="${requestScope.selectUser.gender == 'male'}">
					<input type="radio" name="gender" value="male" checked="checked">남
					<input type="radio" name="gender" value="female">여
				</c:if>
			</c:if>
			<c:if test="${requestScope.selectUser.gender == null && requestScope.selectUser.gender != ''}">
				<input type="radio" name="gender" value="male">남
				<input type="radio" name="gender" value="female">여
			</c:if>
		</div>
		
		<div>
			<div class="settingLabel">동네</div>
			<c:choose>
			    <c:when test="${requestScope.selectUser.locationNo == 1100000000}">
			   		<div class="address">${requestScope.selectUser.si}&nbsp;&nbsp;${requestScope.selectUser.gu}</div>
			    </c:when>
			    <c:otherwise>
					 <div class="address">${requestScope.selectUser.si}&nbsp;&nbsp;${requestScope.selectUser.gu}&nbsp;&nbsp;${requestScope.selectUser.dong}</div>
			    </c:otherwise>
			</c:choose>
			<input type="hidden" name="locationNo" id="hideLoNo" value="${requestScope.selectUser.locationNo}">
			<button type="button" id="searchAddress">동네 검색</button>
		</div>
		<!-- 주소 찾기 누르면 창 띄우기 -->
		<!-- 주소 가져올 때 locationNo 가져와서 그걸로 select -->

		<div class="noBorder">
			<button type="submit" class="button">수정 완료</button>
		</div>
		
	</form>	
	
</div>




<div class="modal fade" id="addressModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<input type="text" class="form-control" id="searchAddressInput" placeholder="구 혹은, 동으로 검색해보세요">
				<button id="searchAddressBtn" type="button" class="btn btn-primary">동네 검색</button>
			</div>
			
			<form id="" method="post" action="">
				<div class="modal-body">
					<div id="showAddressList" class="form-group">
						<table id="addressListTable">
							<thead id="theadTr">
								<tr>
									<td>시</td>
									<td>구</td>
									<td>동</td>
								</tr>
							</thead>
							<tbody id="addressListTbody">
							
							</tbody>
						</table>
					</div>
				</div>
			</form>
			
		</div>
	</div>
</div>







<!-- <!-- 이미지등록 팝업(모달)창 --> -->
<!-- <div class="modal fade" id="addModal"> -->
<!-- 	<div class="modal-dialog"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!-- 				<h4 class="modal-title">이미지등록</h4> -->
<!-- 			</div> -->
			
<!-- 			<form id="myProfileImgForm" method="post" action=""> -->
<!-- 				<div class="modal-body"> -->
<!-- 					<div class="form-group"> -->
<%-- 						<img class="profileImgModal" alt="" src="${pageContext.request.contextPath}/rdimg/userProfile/${requestScope.selectUser.saveName}"> --%>
<!-- 						<label for="inputFile" class="upload-btn"> -->
<!-- 							<input id="inputFile" type="file" name="file" accept="image/*"> -->
<!-- 						    <span class="form-text" >이미지 선택</span> -->
<!-- 					    </label> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<button type="button" class="btn" id="btnUpload">등록</button> -->
<!-- 				</div> -->
<!-- 			</form> -->
			
<!-- 		</div>/.modal-content -->
<!-- 	</div>/.modal-dialog -->
<!-- </div>/.modal -->



	
<script type="text/javascript">

// //이미지 업로드 모달창 버튼 클릭 시
// $("#showImgModal").on("click", ()=>{
// 	//열기
// 	$("#addModal").modal("show");
// });


//주소 검색 버튼 클릭 시 모달
$("#searchAddress").on("click", ()=>{
	//열기
	$("#addressModal").modal("show");
});

//모달 닫기
$(".btn-close").on("click", ()=>{
	//닫기
	$("#addressModal").modal("hide");
});


// //이미지 미리보기 코드 URL.createObjectURL()
// const input = document.querySelector('#inputFile');
// const img = document.querySelectorAll('.profileImgModal');

// input.addEventListener('change', () => {
// 	const imageSrc = URL.createObjectURL(input.files[0]);
// 	img[0].src = imageSrc;
// 	img.onload = () => {
// 		URL.revokeObjectURL(imageSrc);
// 	}
// });


//이미지 미리보기 코드2 URL.createObjectURL()
const input2 = $("#inputFile2");
const img2 = $(".profileImg");

input2.on('change', function() {
	const imageSrc2 = URL.createObjectURL(input2.prop("files")[0]);
	img2.attr("src", imageSrc2);
	img2.on("load", function(){
		URL.revokeObjectURL(imageSrc2);
	});
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
	
	$.ajax({
		url : "${pageContext.request.contextPath}/setting/selectAddressList",
		type : "post",
		//보낼 때
		/* contentType : "application/json", */
		data : {keyword: keyword},

		//받을 때
		dataType : "json",
		success : function(addressList){
			
			$("#addressListTbody").html("");
			
			for(let i = 0; i<addressList.length; i++){
				
				render(addressList[i]);
			}

		},

		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
});


function render(userVo){
	
	let str = '';
	str += '<tr data-lno="'+userVo.locationNo+'" class="addressSelect">';
	str += '	<td class="si">'+userVo.si+'</td>';
	str += '	<td class="gu">'+userVo.gu+'</td>';
	str += '	<td class="dong">'+userVo.dong+'</td>';
	str += '</tr>';
	
	$("#addressListTbody").append(str);
};

//새로 그린 건 위임을 통해 지정해야 함
$("#addressListTable").on("click", ".addressSelect", function(){
	let $this = $(this);
	let lno = parseInt($this.data("lno"));
	//data- 대분자 구분 못함 
	$("#hideLoNo").val(lno);
	
	let si = $this.children(".si").text();
	let gu = $this.children(".gu").text();
	let dong = $this.children(".dong").text();
	
	$(".address").html(si + "&nbsp;&nbsp;" + gu + "&nbsp;&nbsp;" + dong);
	
	$("#addressModal").modal("hide");
});



// //이미지 등록 누르면 db에 저장 (ajax)
// $("#btnUpload").on("click", ()=>{
	
// 	var formData = new FormData($('#myProfileImgForm')[0]);

// 	$.ajax({
// 		url : "${pageContext.request.contextPath}/setting/ploadMyProfileImg",
// 		type : "post",
// 		//보낼 때
// 		/* contentType : "application/json", */
// 		data : formData,

// 		//받을 때
// 		dataType : "text",
// 		success : function(saveName){
// 			console.log(saveName);
			
// 			$("#savedProfileImg").attr("src", "${pageContext.request.contextPath}/rdimg/userProfile/"+saveName);

// 		},

// 		cache: false,
//         contentType: false,
//         processData: false,
        
// 		error : function(XHR, status, error) {
// 			console.error(status + " : " + error);
// 		}
// 	});
	
// 	//modal 닫기
// 	$("#addModal").modal("hide");
	
// });




/* const input = document.querySelector("#inputFile");
const img = document.querySelector(".profileImg");

const handleFile = (files) => {
	  const blobUrl = URL.createObjectURL(files[0])
	  img.src = blobUrl
	  img.onload = () => {
		  URL.revokeObjectURL(blobUrl);
	  }
}
input.addEventListener('change', (e) => handleFile(e.target.files)); */



</script>




</body>
</html>

