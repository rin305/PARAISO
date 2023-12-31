<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<!--     <script src="./js/index.js"></script> -->
<link type="text/css" href="./css/basic.css" rel="stylesheet" />
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<!-- 플러그인 -->
<style>
select {
	border: none;
}

option {
	border: none;
}

.notice_style {
	height: 1px;
	text-align: center;
	color: black;
	font-size: 16px;
	border-top: 1.5px solid black;
	border-bottom: 1.5px solid #eee;
	font-weight: 500;
	padding: 15px;
	background-color: #fafafa;
}

.notice_td {
	left: 28px;
	text-align: center;
	height: 40px;
	font-size: 15px;
	border: none;
}

.notice_hover {
	transition: all 0.5s;
}

.notice_hover:hover {
	background: #eee;
}

.btn-edit {
	color: white;
	background: #363636;
}

.btn {
	width: 80px;
	box-shadow: none;
	margin: 10px;
	border: none;
	border-radius: 10px;
	height: 35px;
	position: absolute;
	font-size: 15px;
	top: -10px;
}

.btn-edit:hover {
	color: #white !important;
	background-color: black;
}
</style>
</head>

<body>
	<jsp:include page="/template/header.jsp"></jsp:include>

	<div id="dropMenuBg"></div>



	<!-- 서브상단이미지 -->
	<div class="sub_topgrp">
		<div class="subtitbox">
			<h1 id="mtitle">관리자</h1>
		</div>
		<div class="s_topimg">
			<img src="./image/faci_top.png" />
		</div>
	</div>
	<!-- //서브상단이미지 -->


	<!-- Contents Start -->
	<div id="contents_sub">
		<div class="content_area">
			<div class="subtitbox02">
				<h1 id="ltitle">매출목록</h1>
			</div>
			<div class="contents_sub"
				style="width: 1500px !important; min-height: 1300px; height: 100%; margin: 0 auto; padding-top: 50px;">
				<div class="reser_area">
					<div class="resergrp" style="float:left; left:-100px; position:absolute; width: 1300px; margin: 0 auto;">
						<div id="btno1_div" class="detail_list roomIntro">
							<div class="detail_date_grp"
								style="width: 430px; margin: 0 auto;">
								<div class="date_grp cal_bg" style="font-size: 15px;">
									<b>결제기간</b> <span class="date_select"> <input
										type="date"
										style="height: 30px; width: 150px; font-size: 15px;"
										id="check_in_date" data-title="시작일">
									</span> <span>&nbsp;&nbsp;~&nbsp;&nbsp;</span> <span
										class="date_select"> <input type="date"
										style="height: 30px; width: 150px; font-size: 15px;"
										id="check_out_date" data-title="마감일">
									</span> <span class="last_word">
										<button class="btn btn-edit">검색</button>
									</span>
								</div>
							</div>
							<h1 class="sales_h1">총 매출 : 1,000,000</h1>
							<table class="info_ntb" style="float:left; left:-100px; position:absolute; width: 1500px; margin: 0 auto;">
								<thead>
									<tr>
										<th class=" notice_style">예약번호</th>
										<th class=" notice_style">회원아이디</th>
										<th class=" notice_style">방고유번호</th>
										<th class=" notice_style">예약자명</th>
										<th class=" notice_style">결제번호</th>
										<th class=" notice_style">예약취소</th>
										<th class=" notice_style">이용시작일</th>
										<th class=" notice_style">이용종료일</th>
										<th class=" notice_style">예약가격</th>
										<th class=" notice_style">예약인원</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${list}">
										<tr height="30" class="notice_hover">
											<td class="notice_td">${vo.rsv_num}</td>
											<td class="notice_td">${vo.mem_id}</td>
											<td class="notice_td">${vo.room_num}</td>
											<td class="notice_td">${vo.rsv_name}</td>
											<td class="notice_td">${vo.pay_num}</td>
											<td class="notice_td">${vo.rsv_cancel}</td>
											<td class="notice_td">${vo.rsv_start}</td>
											<td class="notice_td">${vo.rsv_end}</td>
											<td class="notice_td">${vo.rsv_price}</td>
											<td class="notice_td">${vo.rsv_person}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				</div>
				</div>
				</div>
				

	<!-- Footer Start -->
	<%@ include file="/template/footer.jsp"%>


	<!-- Footer End -->
	<!-- btn_top 적용되는 거 -->
	<!--<script type="text/javascript">-->
	<!--	$(document).ready(function() {-->
	<!--		$('#ft_btn_close').bind('click', function() {-->
	<!--			$('html, body').stop().animate({scrollTop:'0'}, 600)-->
	<!--		});-->
	<!--	});	-->
	<!--</script>	-->

	<script src="./js/footer.js"></script>

</body>
</html>