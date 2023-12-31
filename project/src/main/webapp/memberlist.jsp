<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link type="text/css" href="./css/basic.css?ver=1" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
</head>

<body>
<jsp:include page="/template/header.jsp"></jsp:include>

        <div id="dropMenuBg"></div>

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
	top: 120px;
}

.btn-edit:hover {
	color: #white !important;
	background-color: black;
}
</style>

</head>



<!-- 서브상단이미지 -->
<div class="sub_topgrp">
  <div class="subtitbox">
    <h1 id="mtitle">관리자 페이지</h1>
  </div>
  <div class="s_topimg">
    <img src="./image/faci_top.png"/>
  </div>
</div>



<head>
<title>객실가격 수정</title>
</head>

<body>
<div id="contents_sub">
  <div class="content_area">
    <div class="subtitbox02">
		 <h1 id="ltitle">회원 목록</h1>
	</div>
<di style="width: 1600px !important; left: 0px;min-height: 1300px; height: 100%; margin: 0 auto; padding-top: 50px;">
	<table class="info_ntb"  style="float:left; left:-100px; position:absolute; width: 1500px; margin: 0 auto;">
<%-- 	 <colgroup>
                  <col width="8%"/>
                  <col width="8%"/>
                  <col width="5%"/>
                  <col width="5%"/>
                  <col width="8%"/>
                  <col width="8%"/>
                  <col width="20%"/>
                  <col width="15%"/>
                  <col width="5%"/>
                  <col width="5%"/>
                  <col width="9%"/>
                  <col width="9%"/>
                </colgroup> --%>
		<thead>
			<tr>
				<th class=" notice_style">회원아이디</th>
				<th class=" notice_style">비밀번호</th>
				<th class=" notice_style">회원이름</th>
				<th class=" notice_style">회원성별</th>
				<th class=" notice_style">회원생일</th>
				<th class=" notice_style">연락처</th>
				<th class=" notice_style">주소</th>
				<th class=" notice_style">상세주소</th>
				<th class=" notice_style">우편번호</th>
				<th class=" notice_style">등급</th>
				<th class=" notice_style">가입날짜</th>
				<th class=" notice_style">이메일</th>
			</tr>
		</thead>
		 <tbody>
		 <c:forEach var="vo" items="${list}">
			<tr height="30" class="notice_hover">
				<td class="notice_td">${vo.mem_id}</td>
				<td class="notice_td">${vo.mem_pw}</td>
				<td class="notice_td">${vo.mem_name}</td>
				<td class="notice_td">${vo.mem_gender}</td>
				<td class="notice_td">${vo.mem_birth}</td>
				<td class="notice_td">${vo.mem_phone}</td>
				<td class="notice_td">${vo.mem_addr}</td>
				<td class="notice_td">${vo.mem_addr2}</td>
				<td class="notice_td">${vo.mem_zip}</td>
				<td class="notice_td">${vo.mem_grade}</td>
				<td class="notice_td">${vo.mem_date}</td>
				<td class="notice_td">${vo.mem_email}</td>
			</tr>
		 </c:forEach>
		</tbody>
	</table>
</div>