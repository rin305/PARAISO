<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%
	String idKey=(String)session.getAttribute("idKey");//MemberLoginAction에서 idKey를 받아옴
   	//String membership=(String)session.getAttribute("membership");
	//request.getSession().setAttribute(idKey, "idKey");
	System.out.println("index.jsp의 idKey=>"+idKey);//index에서 아이디 확인
	boolean admincheck = (boolean)session.getAttribute("admincheck");
	System.out.println("index.jsp의 admincheck=>"+admincheck);
	//관리자 여부 확인
	/* 
	String membership="비회원";
	if(memdto!=null){
		membership=memdto.getMem_grade();
			
		System.out.println("admincheck=>"+admincheck);
	}
	if(memdto==null){
		membership="비회원";
	} */
 	//생성된 회원정보 dto클래스에서 getter 메서드로 회원등급을 가져와 membership 변수에 저장함
	//System.out.println("membership=>"+membership);
	//membership 변수값 체크
	
	 //회원등급으로 관리자여부 체크 */
 
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="format-detection"
	content="telephone=no, address=no, email=no">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>PARAISO</title>

<!-- CSS Import -->
<link type="text/css" href="<%=request.getContextPath() %>/css/basic.css" rel="stylesheet" />
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/layout.css">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- Script Import -->
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

	<!-- header -->
	<!-- 로고 -->
	<c:if test="${admincheck eq false}">
	<div class="header">
	</c:if>
	<c:if test="${admincheck eq true}">
	<div class="header manager">
	</c:if>
		<div class="boxcen">
			<h1 class="logobox">
				<a href="<%=request.getContextPath() %>/index.do"> <img
					src="<%=request.getContextPath() %>/image/admin_logo.png">
				</a>
			</h1>

			<!-- 톱 네비게이션 -->
			<ul class="top_nav01 ">
				<c:if test="${idKey==null}">
					<li><a href="<%=request.getContextPath()%>/login.jsp">로그인</a></li>
					<li><a href="<%=request.getContextPath()%>/register.jsp">회원가입</a></li>
				</c:if>
				<c:if test="${idKey!=null}">
					<li><a href="<%=request.getContextPath()%>/memberInfo.do">마이페이지</a></li>
					<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
				</c:if>
				
			</ul>
		</div>

		<!-- 메인 네비게이션 -->

		<div class="m_navgrp">
			<!-- 내비게이션 -->
			<ul class="m_nav">
				<li class="dmenu">
				<a href="#" class="menuBtn">리조트 안내</a>
					<ul class="depth_nav" id="depth_nav_1">
						<li><a href="<%=request.getContextPath()%>/info.jsp" class="menuBtn topmenu">리조트 소개</a> 
						<a href="<%=request.getContextPath()%>/loca.jsp" class="menuBtn topmenu">오시는 길</a></li>
					</ul></li>
				<li class="dmenu">
				<a href="#" class="menuBtn">객실안내</a>
					<ul class="depth_nav" id="depth_nav_2">
						<li>
						<a href="<%=request.getContextPath()%>/room1.jsp" class="menuBtn topmenu">스위트룸</a> 
						<a href="<%=request.getContextPath()%>/room2.jsp" class="menuBtn topmenu">패밀리룸</a> 
							<a href="<%=request.getContextPath()%>/room3.jsp" class="menuBtn topmenu">디럭스트윈</a> 
							<a href="<%=request.getContextPath()%>/room4.jsp" class="menuBtn topmenu">비지니스룸</a></li>
					</ul></li>
				<li class="dmenu">
					<a href="#" class="menuBtn">부대시설</a>
					<ul class="depth_nav" id="depth_nav_3">
						<li>
						<a href="<%=request.getContextPath()%>/fac1.jsp" class="menuBtn topmenu">레스토랑</a> 
						<a href="<%=request.getContextPath()%>/fac3.jsp" class="menuBtn topmenu">수영장</a> 
					</ul></li>
				<li class="dmenu"><a href="#" class="menuBtn">커뮤니티</a>
					<ul class="depth_nav" id="depth_nav_4">
						<li>
							<a href="<%=request.getContextPath()%>/list.do" class="menuBtn topmenu">공지사항/이벤트</a>
							<a href="<%=request.getContextPath()%>/QnaList.do" class="menuBtn topmenu">문의하기</a>
							<a href="<%=request.getContextPath()%>/ReviewList2.do" class="menuBtn topmenu">고객후기</a>
						</li>
					</ul>
				</li>
				<li class="dmenu"><a href="#" class="menuBtn">객실예약</a>
					<ul class="depth_nav" id="depth_nav_5">
						<li><a href="<%=request.getContextPath()%>/reserveList.do" class="menuBtn topmenu">온라인 예약</a> 
						<a href="<%=request.getContextPath()%>/reservationinfo.do" class="menuBtn topmenu">예약 확인/취소</a></li>
					</ul></li>
				<!-- 관리자로 로그인 했을 경우에만 보이게 --> 
				<c:if test="${admincheck}">
				<li class="dmenu">
					<a href="#" class="menuBtn">관리자</a>
					<ul class="depth_nav" id="depth_nav_6">
						
						<li><a href="<%=request.getContextPath()%>/roomInsert.jsp" class="menuBtn topmenu">방 추가</a>
						<a href="<%=request.getContextPath()%>/roomList.do" class="menuBtn topmenu">방가격 수정</a>
						<a href="<%=request.getContextPath()%>/paylist.do" class="menuBtn topmenu">매출목록</a>
							<a href="<%=request.getContextPath()%>/memberlist.do" class="menuBtn topmenu">회원목록</a></li>
					</ul>
				</li>
				</c:if>
		<%-- 		<%} %> --%>
			</ul>
			<div id="dropMenuBg"></div>
		</div>
	</div>
	
	
<script src="./js/header.js?ver=1"></script>
</body>
</html>