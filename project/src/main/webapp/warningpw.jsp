<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/template/header.jsp"></jsp:include>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 게시판</title>
        <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
      <!-- 플러그인 -->
  <style>
    select {
      border: none;
      
    }
    option{
    border:none;
    }
    
		.qna_style {
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
		
		.qna_td {
			left: 28px;
			text-align: center;
			height: 40px;
			font-size: 15px;
			border: none;
		}
		
		.qna_hover{
			transition:all 0.5s;
		}
		.qna_hover:hover{
		 background: #e1e1e1;
		}

        .btn-edit{
        color:white; 
        background:#363636;
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
        top:10px;
        }
		
        .btn-edit:hover{
        color: #white !important;
  		background-color:black;
        }
		.mng{
		background: #eee;
		}
  </style>    
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <style>
        .info_cont_title{
        position:relative;
        top:30px;
        padding:30px;
        }
        
        .info_cont_text{
        position:relative;
        padding:10px;
        font-size:18px;
        font-weight:355;
        color:#333;
        }
       
        .box{
           /*  padding:80px ,40px, 20px; */
           padding-top:5px;
            font:12px;
            text-align:center;
            width: 900px;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            
            margin:auto;
            top:80px;
        }  
        .input-box{
            width: 300px;
            display: inline-block;
        }
        
        .last{
           display: none;
        }
        
        .prev-btn{
        color:gray; 
        background:#F6F6F6;
        position:relative;
        /* top:880px;
  		left:430px; */
        }
        .next-btn{
        color:white; 
        background:#b9a06f;
        }
        .btn-submit{
        color:white; 
        background:#363636;
        }
        .btn{
        width:130px;
        box-shadow: none;
        margin:10px;
        bottom:100px;
        border:none;
        border-radius: 13px;
        height:45px;
        position:relative;
        font-size:15px;
        }
        
        .next-btn:hover{
        background:#B29762;
        }
        .prev-btn:hover{
          color: #161D2D !important;
  		background-color:#DDDDDD;
        }
        .btn-submit:hover{
        color: #white !important;
  		background-color:black;
        }
        .center{
        text-align:center;
        }
        .row{
        padding-top:100px;
        }
        .info_cont_txt{
        position:relative;
        }
        
        .form-input{
        width: 220px;
        border-radius:4px;
        border:1px solid #ccc;
        height:36px; 
        font-size:16px;
        color:#666;
        padding-left:10px;
        }
       .form-input:focus{
        outline: 1.5px solid black;
		border-radius :4px;
        } 
        .input-msg{
        font-size:25px;
        margin-left:auto;
        margin-right:auto;
        text-align:10px;
        color:#353535;
        }
        .info_input_box{
        position:relative;
        top:20px;
        }
        .bold{
        font-weight:600;
        padding-right:10px;
        font-size:18px;
        }
        .img_bar{
       	width:900px;
       	height:110px;
       	margin:auto;
       	display:block;
       	padding-top:50px;
        }
    </style>
  
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
        <h1 id="mtitle">회원가입/로그인</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/faci_top.png"/>
    </div>
</div>

<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area">
        <div class="subtitbox02">
            <h1 id="ltitle">비밀번호 변경 안내</h1>
        </div>
        <div class="info-container">
        <div class="info_cont_text center">임시 비밀번호는 보안에 취약하여 다른 비밀번호로 변경하길 권유드립니다.</div>
        <div class="info_cont_text center">다른 비밀번호로 변경하시겠습니까?</div>
<br>
<div class="center">
	<button class="btn next-btn" onclick="location.href='<%=request.getContextPath()%>/changePw.jsp'">
		비밀번호 변경
	</button>
	<button class="btn btn-submit" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">
		다음에 변경하기
	</button>
	</div>
</body>
</html>