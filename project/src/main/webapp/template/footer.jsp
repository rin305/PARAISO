<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="format-detection"
	content="telephone=no, address=no, email=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>PARAISO 리조트</title>

<!-- CSS Import -->
<link type="text/css" href="<%=request.getContextPath() %>/css/basic.css" rel="stylesheet" />
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/layout.css">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>AOS.init();</script> <!-- 이걸 해줘야 AOS적용됨  -->

<!-- 플러그인 -->
<style>
.manager{
background:#0000B7;
}
.manager:hover{
background:navy;
}
</style>
</head>

<body>
<!-- Footer Start -->
<div id="footer">

    <!-- topgo -->
    <!-- 상단으로 올라가는 기능 구현 -->
    <div class="copy" style="padding: 0px">
        <button id="ft_btn_close" class="btn_top radius03">TOP</button>
    </div>

    <!-- footer 최하단 박스-->
    <div class="copy" id="ft_copy">
        <div class="bc_box">
            <div style="display:flex; flex-direction:row;align-items: center; ">
                <p>주식회사 PARAISO</p>
                <p style="font-size:10px; margin:0 6px">|</p>
                <p>서울 강남구 테헤란로1길 10 세경빌딩</p>
                <p style="font-size:10px; margin:0 6px">|</p>
                <p>대표이사 : PARAISO</p>
                <p style="font-size:10px; margin:0 6px">|</p>
                <p>사업자번호 : 02-538-3644</p>
            </div>
            <div style="display:flex; flex-direction:row;align-items: center; ">
                <p>예약실 : 예약실 : 02-538-3644</p>
                <p style="font-size:10px; margin:0 6px">|</p>
                <p>프론트 : 02-538-3644</p>
                <p style="font-size:10px; margin:0 6px">|</p>
                <p>이메일 : almostparaiso@gmail.com</p>
                <p style="font-size:10px; margin:0 6px">|</p>
                <p>FAX : 02-538-3644</p>
            </div>
            ⓒ 2023 PARAISO. ALL RIGHTS RESERVED.
        </div>
        <!-- 카피라이트(내용) -->
    </div>

    <a href="<%=request.getContextPath()%>/reserveList.do" class="resevr_icon">
        <span class="reser_box_bg"></span>
        <span class="rese_btn_grp">
					<span class="calendar_icon">
					</span>
					<span class="resevr_txt">온라인 예약하기</span>
				</span>
    </a>
</div>

<!-- Script Import -->
<script src="./js/index.js?ver=1"></script>
<script src="./js/footer.js?ver=1"></script>
<script src="./js/header.js?ver=1"></script> 
</body>
</html>