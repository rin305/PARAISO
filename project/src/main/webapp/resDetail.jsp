<%@page import="java.util.Date"%>
<%@page import="model.ReservationDTO"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <script>
  $('ready', function(){
	  $('#pay_button').on('click', function(){
		  $('#res_detail_form').attr('action', 'pay.do');
		  $('#res_detail_form').submit();
	  })
	  $('#res_cancel_button').on('click', function(){
		  $('#res_detail_form').attr('action','res_cancel.do');
		  $('#res_detail_form').submit();
	  })
  })
  
  </script>
  <!-- 플러그인 -->
<%
ReservationDTO resDetail=(ReservationDTO)request.getAttribute("resDetail");
%>

</head>
<!-- header -->
<!-- 로고 -->
<!--//header -->
<jsp:include page="/template/header.jsp"></jsp:include>

<!-- 서브상단이미지 -->
<div class="sub_topgrp">
  <div class="subtitbox">
    <h1 id="mtitle">예약내역 관리</h1>
  </div>
  <div class="s_topimg">
    <img src="./image/faci_top.png"/>
  </div>
</div>
<!-- //서브상단이미지 -->


<!-- Contents Start -->
  <div class="content_area">
    <div class="subtitbox02">
      <h1 id="ltitle">예약내역 확인</h1>
    </div>
    <div class="contents_sub"
         style="width:1200px !important;min-height: 1300px;height:100%;margin: 0 auto;padding-top:50px;">
      <div class="reser_area">

        <div class="resergrp" style="width: 100%;">
        <form name="res_detail_form" id="res_detail_form" action="pay.do" method="post">
        <input type="hidden" name="rsv_num" value="<%=resDetail.getRsv_num()%>">
        <input type="hidden" name="pay_price" value="<%=resDetail.getRsv_price()%>">
        <input type="hidden" name="rsv_name" value="<%=resDetail.getRsv_name() %>">
        <input type="hidden" name="room_type" value="<%=resDetail.getRoom_type()%>">
        <input type="hidden" name="room_num" value="<%=resDetail.getRoom_num() %>">
        
          <div id="btno1_div" class="detail_list roomIntro">
            <div class="info_ntb_box">
              <table class="info_ntb" style="border-top: none;">
                <colgroup>
                  <col width="50%"/>
                  <col width="50%"/>
                </colgroup>
                <tbody>
                <tr>
                  <th class="payments_th">예약번호</th>
                  <th class="payments_td"><%=resDetail.getRsv_num() %></th>
                </tr>
                <tr>
                  <th class="payments_th">예약자명</th>
                  <th class="payments_td"><%=resDetail.getRsv_name() %></th>
                </tr>
                <tr>
                  <th class="payments_th">객실타입 [객실번호]</th>
                  <th class="payments_td"><%=resDetail.getRoom_type() %> [<%=resDetail.getRoom_num() %>]</th>
                </tr>
                <tr>
                  <th class="payments_th">체크인</th>
                  <th class="payments_td"><%=LocalDate.parse(resDetail.getRsv_start().substring(0, 10))%></th>
                </tr>
                <tr>
                  <th class="payments_th">체크아웃</th>
                  <th class="payments_td"><%=LocalDate.parse(resDetail.getRsv_end().substring(0, 10))%></th>
                </tr>
                <tr>
                  <th class="payments_th">인원</th>
                  <th class="payments_td"><%=resDetail.getRsv_person() %></th>
                </tr>
                <tr>
                  <th class="payments_th">결제 금액</th>
                  <th class="payments_td"><fmt:formatNumber value="<%=resDetail.getRsv_price()%>" pattern="#,###" /></th>
                </tr>
                </tbody>
              </table>
              <div style="text-align: center;">
              <%
              String rsv_cancel=resDetail.getRsv_cancel();
              String pay_num=resDetail.getPay_num();
              %>
                <%if (pay_num.equals("1")){ %>
                <button type="button" id="pay_button" class="section_cont_text_btn section_cont_text_btn payments_button">결제하기</button>
                <%} %>
                <%if("0".equals(rsv_cancel) && LocalDate.parse(resDetail.getRsv_start().substring(0, 10)).isAfter(LocalDate.now())) {%>
				<button type="button" id="res_cancel_button" class="section_cont_text_btn section_cont_text_btn payments_button">예약취소</button>
				<%}%>
                <button type="button" onclick="window.history.back()" class="section_cont_text_btn section_cont_text_btn payments_button">뒤로가기</button>
              </div>
            </div>
          </div>
          </form>
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


  <!-- Footer End -->
  <!-- btn_top 적용되는 거 -->
  <!--<script type="text/javascript">-->
  <!--  $(document).ready(function() {-->
  <!--      $('#ft_btn_close').bind('click', function() {-->
  <!--          $('html, body').stop().animate({scrollTop:'0'}, 600)-->
  <!--      });-->
  <!--  }); -->
  <!--</script> -->

  <script src="./js/footer.js"></script>

  </body>
</html>
