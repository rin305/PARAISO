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
        <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
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
    	.btn-reply{
    	 color:white; 
        background:#363636;
       	position:relative;
       	margin-top:56px;
       	width:80px;
    	}
    	.btn-reply:hover{
    	color: #white !important;
  		background-color:black;
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
        <h1 id="mtitle">커뮤니티</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/faci_top.png"/>
    </div>
</div>

<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area">
        <div class="subtitbox02">
            <h1 id="ltitle">문의하기</h1>
        </div>
    <div class="area_sub">
      <table cellpadding="0" cellspacing="0" class="view_tbv">
        <thead>
<!--        제목 / 조회수    -->
        	<tr>
          		<th class="tbv_ti" style="padding:20px; background-color:#fafafa;"><b>제목</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${article.qna_subject}
          		<span class="tbv_ti_right">No. ${article.qna_num} &nbsp;&nbsp;</span>
          		<span class="tbv_ti_right">조회수 : ${article.qna_readcount}&nbsp;&nbsp;</span>
          		
          		</th>
        	</tr>

<!--        
작성자 / 작성일자   
 -->
        <tr>
          <th class="tbv_in">
				<span class="tbv_ti_left ">&nbsp;&nbsp;&nbsp;&nbsp;작성자 
				<span style="font-weight:400">&nbsp;&nbsp;${article.qna_writer}</span></span>
				
					&nbsp;
					&nbsp;
				 ${article.qna_date}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</th>
        </tr>
        </thead>
        <tbody>

        <tr>
          <td class="con"><p style="text-align: center;"><br><br></p>
            <p style="text-align: center;">
              	${article.qna_content}
            </p>
          </td>
        </tr>

        </tbody>
      </table>
      <div class="tb_btn2">
        <button class="btn btn-list">
        	<a href="<%=request.getContextPath()%>/QnaList.do?pageNum=${pageNum}">목록으로</a>
        </button>
        </div>
        <div class="tb_btn3" style="float:right;">
      <c:if test="${admincheck==true}">
        <button class="btn btn-reply">
        	<a href="<%=request.getContextPath()%>/QnaWriteForm.do?qna_num=${article.qna_num}&qna_ref=${article.qna_ref}&qna_re_step=${article.qna_re_step}&qna_re_level=${article.qna_re_level}">답변</a>
      </button>
      </c:if>
      <c:if test="${contentCheck==true && admincheck==true}">
      <button class="btn btn-edit">
        	<a href="<%=request.getContextPath()%>/QnaUpdateForm.do?qna_num=${article.qna_num}&pageNum=${pageNum}">수정</a>
        </button>
        
        <button class="btn btn-delete">
        	<a href="<%=request.getContextPath()%>/QnaDeleteForm.do?qna_num=${article.qna_num}&pageNum=${pageNum}"
					onclick="return confirm('삭제된 게시물은 복구되지 않습니다. 삭제하시겠습니까?');">삭제</a>
        </button>
        </c:if>
        <c:if test="${contentCheck==true&&admincheck==false}">
        </c:if>
        <c:if test="${contentCheck==false&&admincheck==false}">
        <button class="btn btn-edit">
        	<a href="<%=request.getContextPath()%>/QnaUpdateForm.do?qna_num=${article.qna_num}&pageNum=${pageNum}">수정</a>
        </button>
        <button class="btn btn-delete">
        	<a href="<%=request.getContextPath()%>/QnaDeleteForm.do?qna_num=${article.qna_num}&pageNum=${pageNum}"
					onclick="return confirm('삭제된 게시물은 복구되지 않습니다. 삭제하시겠습니까?');">삭제</a>
        </button> 
        </c:if> 
      </div>
    </div>

  </div>
  <!-- Content End -->
</div>
<!-- contents End -->

<!-- container End -->


<!-- <script>AOS.init();</script> -->
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>
        