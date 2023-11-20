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
<style>
   .post-form {
      padding: 20px;
      border: 1px solid grey;
   }
   .post-title {
      font-size: 18px;
      font-weight: bold;
   }
   .post-body {
      margin-top: 20px;
      padding-bottom: 20px;
      border-bottom: 1px solid black;
   }

   #post-images {
      margin-top: 20px;
   }

   #post-images > div {
      display: inline-block;
      width: 120px;
      height: 120px;
      vertical-align: top;
   }
   #post-images > div:not(:last-child) {
      margin-right: 5px;
   }
   #post-images .image-item {
      position: relative;
      background-size: cover !important;
      background-position: 50% 50% !important;
   }
   #post-images .image-item .delete-btn {
      content: 'x';
      position: absolute;
      background: white;
      border-radius: 10px;
      border: 1px solid darkgrey;
      top: 2px;
      right: 2px;
      width: 20px;
      height: 20px;
      text-align: center;
      line-height: 18px;
   }
   #post-images .image-item .delete-btn:hover {
      cursor: pointer;
   }

   #post-images .image-add {
      border: 1px solid grey;
      line-height: 120px;
      text-align: center;
   }

   #post-images .image-add:hover {
      cursor: pointer;
      font-weight: bold;
   }

   .post-actions {
      margin-top: 20px;
   }
</style>

<!-- Script -->
<script>
   // 파일 삭제 처리용 익명 함수
   const removeFileId = (function() {
      const ids = [];
      return {
         add(id) {
            if (ids.includes(id)) return false;
            ids.push(id);
         },
         getAll() {
            return ids;
         }
      }
   }());

   /**
    * 추가 버튼 노출 여부
    */
   function setBtnState() {
      const imageCnt = $(`#post-images > div.image-item`).length;
      if (imageCnt >= 4) {
         $('.image-add').css('display', 'none');
      } else {
         $('.image-add').css('display', 'inline-block');
      }
   }

   /**
    * 이미지 제거
    */
   function deleteImage(_this) {
      const target = $(_this).parent();
      const id = target.attr('id');
      if (id) {
         console.log(id);
         removeFileId.add(id);
         console.log(removeFileId.getAll());
         document.frm.deletedIds.value = removeFileId.getAll().join(',');
      }
      target.remove();
      setBtnState();
   }

   function addImage() {
      const fileInput = $('<input type="file" name="images" style="display: none;"/>');
      $(`form[name='frm']`).append(fileInput);
      fileInput.change((event) => selectedImage(event));
      fileInput.click();
   }

   function selectedImage(event) {
      const file = event.target.files[0];
      if (!file) {
         $(`input[name='images']:last-child`).remove()
         return;
      }
      const fileReader = new FileReader();
      fileReader.addEventListener('load', (evt) => {
         const i = $('.image-item').length;
         // 이미지 객체
         const imageItem = $('<div></div>');
         imageItem.addClass('image-item');
         imageItem.css('background-image', 'url("' + evt.target.result + '")');
         // 삭제 버튼 객체
         const closeBtn = $('<div class="delete-btn">x</div>');
         closeBtn.on('click', () => deleteImage(closeBtn));
         imageItem.append(closeBtn)
         // 이미지 추가
         if (i === 0) {
            $('#post-images').prepend(imageItem);
         } else {
            $('#post-images > div.image-item:nth-child(' + i + ')').after(imageItem);
         }
         setBtnState();
      });
      fileReader.readAsDataURL(file);
   }
</script>
</head>
<body onload="setBtnState()">
   <jsp:include page="../global/header.jsp"></jsp:include>

   <section>
      <div class="contents">
         <div class="mainWrapper">

            <div class="mainPosts">



               <form name="frm" action="${pageContext.request.contextPath}/walkBlog/${blogInfoVo.paramCode}/${walkLog.walkLogNo}/modify" method="post">

                  <input type="hidden" name="deletedIds" value=""/>
                  <input type="file" style="display: none;" id="imageUpload" onchange="selectedImage(this)"/>
                  
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

                              <!-- 이미지 파트 -->
<%--                              <c:forEach items="${walkLog.imageList}" var="image">--%>
<%--                                 <div class="MRpicture${image.imageOrder} ">--%>
<%--                                    <img src="${pageContext.request.contextPath}/assets/images/${image.saveName}" alt="">--%>
<%--                                 </div>--%>
<%--                              </c:forEach>--%>


                              <div id="post-images">
                                 <c:forEach items="${imageList}" var="image">
                                    <div class="image-item" id="${image.imageNo}" style="background: url(${pageContext.request.contextPath}/rdimg/${image.saveName}">
                                       <div class="delete-btn" onclick="deleteImage(this)">x</div>
                                    </div>
                                 </c:forEach>
                                 <div class="image-add" onclick="addImage()">+</div>
                              </div>
                              <div class="post-actions">
                                 <button type="submit">입력</button>
                              </div>


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