<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>PARAISO 리조트</title>

    <!-- CSS Import -->
<!--     <script src="./js/index.js"></script> -->
    <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- 플러그인 -->

</head>

<body>
<jsp:include page="/template/header.jsp"></jsp:include>

        <div id="dropMenuBg"></div>


<!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="mtitle">부대시설</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/faci_top.png"/>
    </div>
</div>
<!-- //서브상단이미지 -->
	
	
			<!-- Contents Start -->
			<div id="contents_sub">
				<div class="content_area">
					<div class="subtitbox02">
						<h1 id="ltitle">레스토랑</h1>
					</div>
					
<!-- 슬라이드 Start -->
	<!-- 슬라이드 사용 여부 / 환경설정에서 수정가능 -->
		<div class="sub_slide_area">
            <!-- 슬라이드 큰이미지 -->
            <div class="sub_slide_big">
                <!-- 슬라이드 큰 이미지 버튼 -->
                <div class="slide_btn_area">
                    <a class="slide_big_btn_left"></a>
                    <a class="slide_big_btn_right"></a>
                </div>
                <img src="./image/add1_big1.jpeg" alt="이미지슬라이드큰이미지" id="sub_slider_big_pic"/>
            </div>
			
			
			<!-- 썸네일 그룹 -->
			<div class="s_slider_grp">
				<!-- 슬라이드 버튼 -->
				<div>
					<a class="slide_btn_left"></a>
					<a class="slide_btn_right"></a>
				</div>
				<!-- 썸네일 -->
				<ul class="sub_slide_small" style="overflow: hidden;">				
						<li class="active" id="small_slide_1">
							<img src="./image/add1_nav1.jpeg" alt="이미지슬라이드작은이미지">						 
							<span class="hover_bg"></span>
						</li>
					
						<li id="small_slide_2">
							<img src="./image/add1_nav2.jpeg" alt="이미지슬라이드작은이미지"> 							 
							<span class="hover_bg"></span>
						</li>
					
						<li id="small_slide_3">
							<img src="./image/add1_nav3.jpeg" alt="이미지슬라이드작은이미지"> 	 
							<span class="hover_bg"></span>
						</li>

                        <li id="small_slide_4">
							<img src="./image/add1_nav4.jpeg" alt="이미지슬라이드작은이미지"> 	 
							<span class="hover_bg"></span>
						</li>
				</ul>
			</div>
			<!--//썸네일 그룹 -->
		</div>
	<!-- 슬라이드 End -->
	
	
<!-- 	<td> -->
	<div class="info_text_grp">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="info_cont_box">
<div class="info_cont_tbox">
<div class="info_cont_left">
<h2 class="info_cont_title">레스토랑</h2>
<p class="info_cont_txt">PARAISO만의 풍미가득, 정성이 담긴 요리를<br>
    로비 1층 레스토랑에서 만나보세요.</p>
</div>
</div>
<p>&nbsp;&nbsp;</p>
<div class="info_ntb_box">
<table class="info_ntb"><colgroup> <col width="20%" /> <col width="80%" />
<tbody>
<tr>
  <th class="info_ntb_th">
    <img src="./image/add1_mid3.png" alt="">
  </th>
  <td class="info_ntb_td">
    <B>한식뷔페</B><br><br>
    성인 : 26,000원, 어린이(5세~초등학생) : 10,000원
  </td>
</tr>
<tr>
  <th class="info_ntb_th">
    <img src="./image/add1_mid2.png" alt="">
  </th>
</th>
<td class="info_ntb_td">
  <B>디너코스</B><br><br>
  운영시간 : 18:00 ~ 21:00 (Last order : 20:30)<br>
  </td>
</tr>
</tbody>
</table>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="con_box_guide">
<h3 class="con_tit">※ 안내사항</h3>
<div class="con_box_tbox">
<p class="con_box_txt"><span style="font-size: medium;">
    &middot; </span></p>
<p class="con_box_txt"><span style="font-size: medium;">
    &middot; 호텔 사정상 한상차림 운영 될 수 있습니다.</span></p>
</div>
</div>
</div>
</div>
	

	<!-- 탭 시작 -->
	
	<!-- 탭 끝 -->

				</div>
				<!-- Content End -->
			</div>



<script src="./js/fac1.js?ver=1"></script>
<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>

