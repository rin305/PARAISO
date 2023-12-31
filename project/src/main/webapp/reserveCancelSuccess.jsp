<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
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

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
<!-- 로고 -->
<!--//header -->


<!-- 서브상단이미지 -->
<div class="sub_topgrp">
  <div class="subtitbox">
    <h1 id="mtitle">구매내역관리</h1>
  </div>
  <div class="s_topimg">
    <img src="./image/faci_top.png"/>
  </div>
</div>
<!-- //서브상단이미지 -->


<!-- Contents Start -->
<div id="contents_sub">
  <div class="content_area">
    <div class="subtitbox02">
      <h1 id="ltitle">결제내역 확인</h1>
    </div>
    <div class="contents_sub"
         style="width:1200px !important;min-height: 1300px;height:100%;margin: 0 auto;padding-top:50px;">
      <div class="reser_area">

        <div class="resergrp" style="width: 100%;">
          <div id="btno1_div" class="detail_list roomIntro">
            <div class="info_ntb_box">
              <div style="width: 700px; margin: 0 auto;text-align: center;">
                <h1 class="pay_h1">예약 취소가 완료되었습니다.</h1>
                <p class="pay_p">이용해주셔서 감사합니다!</p>
                <a class="section_cont_text_btn section_cont_text_btn qna_list_btn pay_button" href="index.do" style="background:#555;">메인 페이지로 이동</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Content End -->

    <!-- Content End -->
  </div>
  <!-- contents End -->

  <!-- container End -->


  <!-- Footer Start -->
  <%@ include file="./template/footer.jsp" %>


  <script src="./js/footer.js"></script>

  </body>
</html>
