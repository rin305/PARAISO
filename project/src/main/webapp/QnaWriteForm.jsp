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
    <title>문의 게시판</title>
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
<style>
.info_cont_right{
margin-right:10%;
}
</style>
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
            <h1 id="ltitle">문의하기</h1>
        </div>
        <form id="frm" method="post"  name="writeform" action="QnaWritePro.do"
          onsubmit="return writeSave()">
            <input type="hidden" name="eegbcode" value="KOR">
            <input type="hidden" name="bmbeonho" value="0000">
            <!-- 입력하지 않고 매개변수로 전달해서 테이블에 저장(hidden 4개) -->
			<input type="hidden" name="qna_num" value="${qna_num}">
			<input type="hidden" name="qna_ref" value="${qna_ref}">
			<input type="hidden" name="qna_re_step" value="${qna_re_step}">
			<input type="hidden" name="qna_re_level" value="${qna_re_level}">	
			<input type="hidden" name="qna_writer" value="${qna_writer}">
			<input type="hidden" name="pageNum" value="${pageNum}">
            <table cellpadding="0" cellspacing="0" class="view_tbt">
                <caption>기본뷰</caption>
                <colgroup>
                    <col width="20%">
                    <col width="80%">
                </colgroup>
                <tbody>
                <tr>
                    <th>문의유형</th><!-- 문의유형 -->
                    <td>
                        <div class="ibox">
                            <select name="qna_type" id="smyeong" type="text" class="i_text" data-check="required"
                                   style="width:100px" required>
                                <option value="" selected>선택</option>   
                                <option>결제문의</option>
                                <option>이용문의</option>
                                <option>시설문의</option>
                                <option>건의사항</option>
                                <option>기타</option>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>제목</th><!-- 제목 -->
                    <td>
                        <div class="ibox">
                            <input name="qna_subject" id="smyeong" type="text" class="i_text" data-check="required"
                                   style="width:400px">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="2">
                        <div class="ibox">
                            <textarea data-check="required" name="qna_content" id="jm" style="width:98%; height:350px;"
                                      placeholder="문의 내용을 입력하세요." class="i_area"></textarea>
                        </div>
                    </td>
                </tr>
                </tbody>
                  
        
        </div>
            </table>
              <div class="buttons" style="margin-left:80%;">
            <input type="submit" value="작성하기"  class="section_cont_text_btn section_cont_text_btn qna_list_btn">
            <input type="button" value="목록보기"  onclick="document.location.href='QnaList.do?pageNum=${pageNum}'"
              class="section_cont_text_btn section_cont_text_btn qna_list_btn" style="background:#555;">
      </div>
        </form>
    <!-- Content End -->

    <!-- Content End -->
</div>
<script src="./js/info.js?ver=1"></script>
<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>