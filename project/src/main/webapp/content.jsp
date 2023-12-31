<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/template/header.jsp"></jsp:include>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 게시판</title>
        <link type="text/css" href="./css/basic.css?ver=1" rel="stylesheet"/>
      <!-- 플러그인 -->
  <style>
    .select {
      -moz-appearance: none;
      -webkit-appearance: none;
      appearance: none;
      border: none;
    }
       .btn-list{
        color:black; 
        background-color:#DDDDDD;
        top:10px;
        }
        .btn-list:hover{
		color: white !important;
  		background-color:black;
		transition:0.8s;
        }
        .btn{
        width:100px;
        box-shadow: none;
        margin:10px;
        bottom:100px;
        border:none;
        border-radius: 13px;
        height:45px;
        position:relative;
        font-size:15px;
        }
        
      .btn-edit{
       	position:relative;
       	margin-top:56px;
       	width:80px;
       	color:white;
       	background-color:rgb(86, 97, 120);
        }
        .btn-delete{
       	position:relative;
       	margin-top:56px;
       	width:80px;
       	background-color:#A50000;
       	color:white;
        }
		.btn-delete:hover{
  		background-color:#ED0000;
		color: #white !important;
		transition:0.5s;
		}
        .btn-edit:hover{
        color:white !important;
  		background-color:#0000C9;
  		transition:0.5s;
        }
  </style>    
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
  
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  
  <!-- CSS Import -->
  <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	
</head>
<body>

<!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="mtitle">문의하기</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/faci_top.png"/>
    </div>
</div>

<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area">
        <div class="subtitbox02">
            <h1 id="ltitle">글상세보기</h1>
        </div>
    <div class="area_sub">
      <table cellpadding="0" cellspacing="0" class="view_tbv">
        <thead>
<!--        제목 / 조회수    -->
        <tr >
          <th class="tbv_ti" style="padding:20px; background-color:#fafafa;"><b>제목</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${article.notice_subject}
          <span class="tbv_ti_right">No. ${article.notice_num}</span>
          </th>
        </tr>

<!--        
작성자 / 작성일자   
 -->
        <tr>
          <th class="tbv_in">
					&nbsp;
					&nbsp;
					&nbsp;
				 ${article.notice_time}
			</th>
        </tr>
        </thead>
        <tbody>

        <tr>
          <td class="con"><p style="text-align: center;">
          <img src="#" alt=""><br><br></p>
            <p style="text-align: center;">
              	${article.notice_content}
            </p>
          </td>
        </tr>

        </tbody>
      </table>
      <div class="tb_btn2">
        <button class="btn btn-list">
        	<a href="/ParaisoResort/list.do?pageNum=${pageNum}" >목록으로</a>
        </button>
      </div>
      <div class="tb_btn3" style="float:right;">
      <c:if test="${admincheck}">
      <button class="btn btn-edit">
        	<a href="<%=request.getContextPath() %>/updateForm.do?notice_num=${article.notice_num}&pageNum=${pageNum}">수정</a>
        </button>
        <button class="btn btn-delete">
        	<a href="<%=request.getContextPath() %>/deleteForm.do?notice_num=${article.notice_num}&pageNum=${pageNum}"
					onclick="return confirm('삭제된 게시물은 복구되지 않습니다. 삭제하시겠습니까?');">삭제</a>
        </button>
      </c:if>
      </div>
    </div>
  </div>
</div>
<!-- contents End -->

<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>
        