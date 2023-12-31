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
  <title>파라이소 리조트</title>

  <!-- CSS Import -->
  <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

  <!-- 플러그인 -->

</head>

<body>

<!-- 서브상단이미지 -->
<div class="sub_topgrp">
  <div class="subtitbox">
    <h1 id="mtitle">관리자</h1>
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
      <h1 id="ltitle">객실관리 페이지</h1>
    </div>
    <div class="contents_sub"
         style="width:1200px !important;min-height: 1300px;height:100%;margin: 0 auto;padding-top:50px;">
      <div class="reser_area">

        <div class="resergrp" style="width: 900px; margin: 0 auto;">
          <div id="btno1_div" class="detail_list roomIntro">
            <div class="info_ntb_box">
              <table class="info_ntb">
                <colgroup>
                  <col width="30%"/>
                  <col width="40%"/>
                  <col width="30%"/>
                </colgroup>
                <thead>
                <tr>
                  <th class="info_ntb_th qna_list_padding">룸 타입</th>
                  <th class="info_ntb_th qna_list_padding">방 가격</th>
                  <th class="info_ntb_th qna_list_padding"></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <th class="info_ntb_td qna_list_padding">디럭스</th>
                  <td class="info_ntb_td qna_list_padding" style="text-align: center;">420,000</td>
                  <th class="info_ntb_td qna_list_padding"><button class="section_cont_text_btn section_cont_text_btn sales_list_btn">수정</button></th>
                </tr>
                <tr>
                  <th class="info_ntb_td qna_list_padding">스위트</th>
                  <td class="info_ntb_td qna_list_padding" style="text-align: center;">1,230,000</td>
                  <th class="info_ntb_td qna_list_padding"><button class="section_cont_text_btn section_cont_text_btn sales_list_btn">수정</button></th>
                </tr>
                <tr>
                  <th class="info_ntb_td qna_list_padding">스탠다드</th>
                  <td class="info_ntb_td qna_list_padding" style="text-align: center;">340,000</td>
                  <th class="info_ntb_td qna_list_padding"><button class="section_cont_text_btn section_cont_text_btn sales_list_btn">수정</button></th>
                </tr>
                <tr>
                  <th class="info_ntb_td qna_list_padding">프리미엄</th>
                  <td class="info_ntb_td qna_list_padding" style="text-align: center;">570,000</td>
                  <th class="info_ntb_td qna_list_padding"><button class="section_cont_text_btn section_cont_text_btn sales_list_btn">수정</button></th>
                </tr>
                </tbody>
              </table>
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
  <%@ include file="/template/footer.jsp" %>


  <!-- Footer End -->
  <!-- btn_top 적용되는 거 -->
  <!--<script type="text/javascript">-->
  <!--	$(document).ready(function() {-->
  <!--		$('#ft_btn_close').bind('click', function() {-->
  <!--			$('html, body').stop().animate({scrollTop:'0'}, 600)-->
  <!--		});-->
  <!--	});	-->
  <!--</script>	-->

 <script src="./js/footer.js" ></script>

  </body>
</html>
