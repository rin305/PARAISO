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
    <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- 플러그인 -->

</head>

<body>
<jsp:include page="/template/header.jsp"></jsp:include>

        <div id="dropMenuBg"></div>
        
    <!-- 배경 -->
    <div class="bg_nav"></div>
    <!--//내비게이션 -->
</div>
        
       
   <!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="mtitle">객실안내</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/room_top.png"/>
    </div>
</div>
<!-- //서브상단이미지 -->     

<!-- Contents Start -->
			<div id="contents_sub">
				<div class="content_area">
					<div class="subtitbox02">
						<h1 id="ltitle">디럭스트윈</h1>
					</div>
					
					
					
<!-- 슬라이드 Start -->
	<!-- 슬라이드 사용 여부 / 환경설정에서 수정가능 -->
		<div class="sub_slide_area">
			<!-- 슬라이드 큰이미지 -->
			<div class="sub_slide_big">
				<!-- 슬라이드 큰 이미지 버튼 -->
				<img src="./image/room3_big1.jpg" alt="이미지슬라이드큰이미지" id="sub_slider_big_pic" />
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
							<img src="./image/room3_small1.jpg" alt="이미지슬라이드작은이미지">						 
							<span class="hover_bg"></span>
						</li>
					
						<li id="small_slide_2">
							<img src="./image/room3_small2.jpg" alt="이미지슬라이드작은이미지"> 							 
							<span class="hover_bg"></span>
						</li>
					
						<li id="small_slide_3">
							<img src="./image/room3_small3.jpg" alt="이미지슬라이드작은이미지"> 	 
							<span class="hover_bg"></span>
						</li>
					
						<li id="small_slide_4">
							<img src="./image/room3_small4.jpg" alt="이미지슬라이드작은이미지">  
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
<h2 class="info_cont_title">디럭스트윈</h2>
<p class="info_cont_txt">먼 바다 전망이 펼쳐지며 테라스가 있는 모던한 스타일의 객실</p>
</div>
</div>
<p>&nbsp;&nbsp;</p>
<div class="info_ntb_box">
<table class="info_ntb"><colgroup> <col width="15%" /> <col width="35%" /> <col width="15%" /> <col width="35%" /> </colgroup>
<tbody>
<tr><th class="info_ntb_th">체크인</th>
<td class="info_ntb_td">15:00</td>
<th class="info_ntb_th">체크아웃</th>
<td class="info_ntb_td">11:00</td>
</tr>
<tr><th class="info_ntb_th">
<p><span style="font-size: medium;">기준인원 /</span></p>
<p><span style="font-size: medium;">투숙정원</span></p>
</th>
<td class="info_ntb_td">2인 / 2인</td>
<th class="info_ntb_th">최대인원</th>
<td class="info_ntb_td">4인</td>
</tr>
<tr><th class="info_ntb_th">타입</th>
<td class="info_ntb_td">양실(트윈)</td>
<th class="info_ntb_th">사이즈</th>
<td class="info_ntb_td">49㎡</td>
</tr>
<tr><th class="info_ntb_th">전망</th>
<td class="info_ntb_td">오션뷰</td>
<th class="info_ntb_th">정상가</th>
<td class="info_ntb_td">360,000원</td>
</tr>
</tbody>
</table>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<h2 class="info_cont_main_tit">Amenities</h2>
<ul class="info_cont_ulbox">
<li class="info_cont_li info_cont_li01">
<div class="info_cont_timg"><img src="./image/Amenities1.png" alt="" /></div>
<h2 class="info_cont_tit">전자제품</h2>
<div class="info_cont_txtbox">
<p class="info_cont_txt">- TV</p>
<p class="info_cont_txt">- 냉장고</p>
<p class="info_cont_txt">- 전기포트</p>
<p class="info_cont_txt">- 헤어드라이기</p>
<p class="info_cont_txt">- 전자레인지</p>
</div>
</li>
<li class="info_cont_li info_cont_li01">
<div class="info_cont_timg"><img src="./image/Amenities2.png" alt="" /></div>
<h2 class="info_cont_tit">가구</h2>
<div class="info_cont_txtbox">
<p class="info_cont_txt">- 식탁 1개</p>
<p class="info_cont_txt">- 의자 4개</p>
<p class="info_cont_txt">- 테이블</p>
<p class="info_cont_txt">- 화장대</p>
<p class="info_cont_txt">- 소파</p>
</div>
</li>
<li class="info_cont_li info_cont_li01">
<div class="info_cont_timg"><img src="./image/Amenities3.png" alt="" /></div>
<h2 class="info_cont_tit">시설</h2>
<div class="info_cont_txtbox">
<p class="info_cont_txt">- 무료 와이파이</p>
<p class="info_cont_txt">- 다리미</p>
<p class="info_cont_txt">- 아기욕조</p>
</div>
</li>
<li class="info_cont_li info_cont_li01">
<div class="info_cont_timg"><img src="./image/Amenities4.png" alt="" /></div>
<h2 class="info_cont_tit">욕실</h2>
<div class="info_cont_txtbox">
<p class="info_cont_txt">- 샴푸</p>
<p class="info_cont_txt">- 바디워시</p>
<p class="info_cont_txt">- 타월</p>
<p class="info_cont_txt">- 칫솔</p>
<p class="info_cont_txt">- 치약</p>
<p class="info_cont_txt">- 면봉</p>
<p class="info_cont_txt">- 화장솜</p>
<p class="info_cont_txt">- 헤어캡</p>
</div>
</li>
</ul>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="con_box_guide">
<h3 class="con_tit">※ 안내사항</h3>
<div class="con_box_tbox">
<p class="con_box_txt"><span style="font-size: medium;">&middot; 이용요금은 VAT포함입니다.</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 투숙 정원 외 인원 추가 시 중학생&nbsp;이상 부터&nbsp;1박당 11,000원 별도 요금이 부과됩니다.</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 침구 추가 요청 시 투숙기간 내 1회 22,000원 별도 요금이 부과됩니다. (침구 교체 시 추가비용 발생)</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 입실시간 15시, 퇴실시간 11시입니다.</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 오후 10시 이후의 입실은 사전에 반드시 연락을 주시기 바랍니다.</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; Late C/O ~ 오후 3시, 1박 기준 50% 요금 발생, 오후 3시 이후 퇴실시에는 1일 추가 요금 적용</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 반려동물과 동반입실은 불가합니다.(당일 취소와 동일하게 적용 됨)</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot;&nbsp;호텔 내 객실을 포함한 모든 공간은 금연이며, 지정된 외부 공간에서만 흡연이 가능합니다.</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 전 객실 조리가 불가합니다.</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 객실의 모든 시설물은 이용중 훼손 시 이용객측에 변상하게 됩니다.</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 이용객 본인 부주의에 의한 안전사고는 이용객 본인이 책임지게 됩니다.</span></p>
<p class="con_box_txt"><span style="font-size: medium;">&middot; 예약전화 : 02-538-3644</span></p>
</div>
</div>
</div>
</div>
	
				</div>
			</div>


<script src="./js/room3.js?ver=1"></script>
<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>
					
        