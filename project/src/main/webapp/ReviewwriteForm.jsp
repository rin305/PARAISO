<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>    
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후기 게시판</title>
        <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
        
      <!-- 플러그인 -->
  <style>
  
  
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
        <h1 id="mtitle">후기작성하기</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/faci_top.png"/>
    </div>
</div>

<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area">
        <div class="subtitbox02">
            <h1 id="ltitle">후기작성</h1>
        </div>
        <form id="frm" method="post"  name="writeform" action="ReviewWritePro.do"
          onsubmit="return writeSave()">
            <input type="hidden" name="eegbcode" value="KOR">
            <input type="hidden" name="bmbeonho" value="0000">
            <!-- 입력하지 않고 매개변수로 전달해서 테이블에 저장(hidden 4개) -->
			<input type="hidden" name="review_num" value="${review_num}">
			<input type="hidden" name="review_ref" value="${review_ref}">
			<input type="hidden" name="review_re_step" value="${review_re_step}">
			<input type="hidden" name="review_re_level" value="${review_re_level}">	
			

			<input type="hidden" name="pageNum" value="${pageNum}">
            <table cellpadding="0" cellspacing="0" class="view_tbt">
                <caption>기본뷰</caption>
                <colgroup>
                    <col width="20%">
                    <col width="80%">
                </colgroup>
                <tbody>
                <tr>
                    <th>객실유형</th><!-- 문의유형 -->
                    <td>
                        <div class="ibox">
                            <select name="room_type" id="smyeong" type="text" class="i_text" data-check="required"
                                   style="width:100px">
                                <option value="" selected>선택</option>   
                                <option>스위트룸</option>
                                <option>디럭스룸</option>
                                <option>프리미어</option>
                                <option>디럭스</option>
                               
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>제목</th><!-- 제목 -->
                    <td>
                        <div class="ibox">
                            <input name="review_subject" id="smyeong" type="text" class="i_text" data-check="required"
                                   style="width:400px">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="2">
                        <div class="ibox">
                            <textarea data-check="required" name="review_content" id="jm" style="width:98%; height:350px;"
                                      placeholder="후기 내용을 입력하세요." class="i_area"></textarea>
                        </div>
                    </td>
                </tr>
               <!--  <tr>
                  <td>파일첨부</td>
                  <td colspan="2">
                        <div class="ibox">
                        	<form action="">
                           <input type="file" name="file_input">
                           <input type="submit">
                           </form>
                        </div>
                    </td> -->
                  
                </tbody>
                  
        
        </div>
            </table>
              <div class="info_cont_left">
            <input type="submit" value="작성하기"  class="section_cont_text_btn section_cont_text_btn qna_list_btn">
            <input type="button" value="목록보기"  onclick="document.location.href='ReviewList.do?pageNum=${pageNum}'"
              class="section_cont_text_btn section_cont_text_btn qna_list_btn" style="background:#555;">
        </form>
    
    </div>
    <!-- Content End -->

    <!-- Content End -->
</div>
<script src="./js/info.js?ver=1"></script>
<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>