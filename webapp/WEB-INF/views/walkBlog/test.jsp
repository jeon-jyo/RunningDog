<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드 폼</title>
    <link href="${pageContext.request.contextPath}/assets/css/global/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/setting/login_join.css" rel="stylesheet" type="text/css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Style -->
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
<body>
<jsp:include page="../global/header.jsp"></jsp:include>

<%--    <div id="loginLetterBox">--%>
<%--        <div id="loginLetter">회원가입</div>--%>
<%--    </div>--%>

<%--    <form action="${pageContext.request.contextPath}/join" id="loginForm">--%>
<%--        <input type="text" name="id" class="rm formEliments joinformEliments" placeholder="아이디">--%>
<%--        <!-- <span class="warning">중복된 아이디 입니다.</span> -->--%>
<%--        <input type="text" name="name" class="rm formEliments joinformEliments" placeholder="닉네임">--%>
<%--        <!-- <span class="warning">닉네임은 10자 이하여야 합니다.</span> -->--%>
<%--        <input type="password" name="password" class="rm formEliments joinformEliments" placeholder="비밀번호">--%>
<%--        <!-- <span class="warning">비밀번호는 8자 이상이여야 합니다.</span> -->--%>
<%--        <input type="password" class="rm formEliments joinformEliments" placeholder="비밀번호 확인">--%>
<%--        <!-- <span class="warning">비밀번호가 일치하지 않습니다.</span> -->--%>
<%--        <button type="submit" id="loginBtn" class="rm formEliments">회원가입</button>--%>
<%--    </form>--%>

<div class="post-form">
    <form name="frm" action="${pageContext.request.contextPath}/walkBlog/modifyProc" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="deletedIds" value=""/>
        <input type="file" style="display: none;" id="imageUpload" onchange="selectedImage(this)"/>
        <div class="post-title">Test</div>
        <div class="post-body">Body Contents</div>
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
    </form>
</div>

</body>
</html>