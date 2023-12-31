<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>

<!DOCTYPE html>
<html lang="ko">
<body>

    <!-- 배경 -->
    <div class="bg_nav"></div>
    <!--//내비게이션 -->
<!--//header -->
<jsp:include page="/template/header.jsp"></jsp:include>
<!-- Container start -->
<div id="container">
    <!-- section -->
    <div class="">
        <div id="full_slider" style="display:block;">

            <!--슬라이드 텍스트 -->
            <div class="center_bx01 main_content" style="">
                <h1 class="visual_txt_title">파라이소 리조트</h1>
                <p class="visual_txt02">당신에게 선사하는 최고의 선물</p>
            </div>

            <!-- 슬라이드 영역 -->
            <div class="slide slide_wrap">
                <div class="slide_item">
                    <img src="./image/slide01-1.png" alt="이미지 슬라이드">
                </div>
                <div class="slide_item">
                    <img src="./image/slide02-1.png" alt="이미지 슬라이드">
                </div>
                <div class="slide_item">
                    <img src="./image/slide03-1.png" alt="이미지 슬라이드">
                </div>
                <div class="slide_item">
                    <img src="./image/slide04-1.png" alt="이미지 슬라이드">
                </div>
                <div class="slide_prev_button slide_button">
                    <img src="./image/slide_big_left_s.png">
                </div>
                <div class="slide_next_button slide_button">
                    <img src="./image/slide_big_right_s.png">
                </div>
                <ul class="slide_pagination"></ul>
            </div>      
		</div>
	</div>
</div>   
<hr>


<!-- 퀵 메뉴 -->
<div class="section section01 quick_menubox">
	<div class="section_center">
		<h2 class="section_tit">QUICK MENU</h2>
			<ul class="quick_menu_ul">
			
			<li class="quick_menu_list">
				<a class="quick_menu_list_btn" href="<%=request.getContextPath()%>/room1.jsp">
					<span class="quick_menu_list_icon quick_menu_list_icon01"
						style="background-image: url(./image/quick01.png)"></span>	
						<h2 class="quick_menu_list_txt">객실 안내</h2>
				</a>
			</li>
				
			<li class="quick_menu_list">
				<a class="quick_menu_list_btn" href="<%=request.getContextPath()%>/fac1.jsp">
 					<span class="quick_menu_list_icon quick_menu_list_icon02"
						style="background-image: url(./image/quick02.png)"></span>
						<h2 class="quick_menu_list_txt">부대 시설</h2>
				</a>
			</li>
				
			<li class="quick_menu_list">
				<a class="quick_menu_list_btn" href="<%=request.getContextPath()%>/QnaList.jsp">
					<span class="quick_menu_list_icon quick_menu_list_icon03"
						style="background-image: url(./image/quick03.png)"></span>
						<h2 class="quick_menu_list_txt">커뮤니티</h2>
				</a>
			</li>
				
			<li class="quick_menu_list">
				<a class="quick_menu_list_btn" href="<%=request.getContextPath()%>/loca.jsp">
					<span class="quick_menu_list_icon quick_menu_list_icon04"
						style="background-image: url(./image/quick04.png)"></span>
						<h2 class="quick_menu_list_txt">오시는 길</h2>
				</a>
			</li>				
		</ul>
	</div>
</div>


<!-- section01 -->
<div class="section section01">
	<div class="section_center">
 		<h2 class="section_sub_tit"><!--상세내용--></h2>
		<h2 class="section_tit">DINING</h2>
			<ul class="section_cont_ul">
				<li class="section_cont_li section_cont_img" data-aos="fade-right"><!--data-aos="fade-right"드래그 할때 이미지 효과-->
					<img src="./image/image (10).png"/>
				</li>
				<li class="section_cont_li section_cont_text" data-aos="fade-left">
					<h2 class="section_cont_text_tit section_cont_text_tit01">입 안에 감도는<br>감미로운 축제의 향연</h2>
 					<p class="section_cont_text_txt section_cont_text_txt01">행복한 휴가의 시작은 행복한 식사에서부터.<br>
 					최고의 쉐프가 만들어내는 짜릿한 미각의 축제를 즐기세요.</p>
					<a class="section_cont_text_btn section_cont_text_btn" href="<%=request.getContextPath()%>/fac1.jsp">SEE MORE</a>
				</li>
			</ul>
	</div>
</div>


<!-- section02 -->
<div class="section section02">
	<div class="section_center">
		<h2 class="section_sub_tit"><!--상세내용--></h2>
		<h2 class="section_tit">FACILITIES</h2>
			<ul class="section_cont_ul">
				<li class="section_cont_li section_cont_text" data-aos="fade-right">
					<h2 class="section_cont_text_tit section_cont_text_tit01">바로 여기,<br/>PARAISO니까</h2>
					<p class="section_cont_text_txt section_cont_text_txt01">명실상부 최고의 리조트에서 누릴 수 있는 황홀한 서비스.
					 <br/>오직 PARAISO만이 줄 수 있는 최상의 만족감을 누리세요.</p>
					<a class="section_cont_text_btn section_cont_text_btn" href="<%=request.getContextPath()%>/fac1.jsp">SEE MORE</a>
				</li>
				<li class="section_cont_li section_cont_img" data-aos="fade-left">
					<img src="./image/image (11).png"/>
				</li>
			</ul>
	</div>
</div>

<!-- section03 -->
<div class="section section03">
	<div class="section_center">
		<h2 class="section_sub_tit"><!--상세내용--></h2>
		<h2 class="section_tit">LOCATION</h2>
			<ul class="section_cont_ul">
				<li class="section_cont_li section_cont_img" data-aos="fade-right">
					<img src="./image/image (3).jpg"/>
				</li>
				<li class="section_cont_li section_cont_text" data-aos="fade-left">
					<h2 class="section_cont_text_tit section_cont_text_tit01">사랑하는 이들과<br/>잊지 못할 최고의 추억</h2>
					<p class="section_cont_text_txt section_cont_text_txt01">자세한 경로 안내를 통해 PARAISO 리조트를 지금 바로 만나보세요.</p>
					<a class="section_cont_text_btn section_cont_text_btn" href="<%=request.getContextPath()%>/loca.jsp">SEE MORE</a>
				</li>
			</ul>
	</div>
</div>

<!-- Footer Start -->
<div id="footer">

	<div class="copy" style="padding: 0px">
		<button id="ft_btn_close" class="btn_top radius03">TOP</button>
	</div>

<div class="pop_tabbox">
	<ul class="sns_listbox"></ul>
</div>

<div class="copy" id="ft_copy">
	<div class="bc_box"><!-- foot_하단 정보 -->
		<div class="wrap" 
			style="display:flex; flex-direction:row;align-items: center; ">
			<p >주식회사 PARAISO</p>
			<p style="font-size:10px; margin:0 6px">|</p>
			<p>서울 강남구 테헤란로1길 10 세경빌딩</p>
 			<p style="font-size:10px; margin:0 6px">|</p>
			<p>대표이사 : PARAISO</p>
			<p style="font-size:10px; margin:0 6px">|</p>
			<p>사업자번호 : 02-538-3644</p>
		</div>
	
		<div class="wrap2"
			style="display:flex; flex-direction:row;align-items: center; ">
			<p>예약실 : 02-538-3644</p>
  			<p style="font-size:10px; margin:0 6px">|</p>
			<p>프론트 : 02-538-3644</p>
 			<p style="font-size:10px; margin:0 6px">|</p>
			<p>이메일 : almostparaiso@gmail.com</p>
			<p style="font-size:10px; margin:0 6px">|</p>
			<p>FAX : 02-538-3644</p>
		</div>
	</div>                
</div><!-- 카피라이트(내용) -->


	<a href="<%=request.getContextPath()%>/reserveList.do" class="resevr_icon">
		<span class="reser_box_bg"></span>
			<span class="rese_btn_grp">
				<span class="calendar_icon"></span>
				<span class="resevr_txt">온라인 예약하기</span>
		</span>
	</a>
</div><!-- <div id="footer"> -->


<!-- Script Import -->
<script>AOS.init();</script> <!-- 이걸 해줘야 AOS적용됨  -->
<script src="<%=request.getContextPath()%>/js/index.js?ver=7"></script>
<script src="<%=request.getContextPath()%>/js/footer.js?ver=7"></script>
<script src="<%=request.getContextPath()%>/js/header.js?ver=7"></script>
</body>

</html>
