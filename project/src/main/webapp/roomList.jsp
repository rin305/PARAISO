<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.ReservationDTO"%>
<%@page import="java.util.List"%>
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
    <link type="text/css" href="./css/list.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- 플러그인 -->
    <script>
    $(function(){
    	var today = new Date();
    	var tomorrow = new Date(today.getTime() + 24 * 60 * 60 * 1000);
    	var todayDateFormat = today.getFullYear() + '-' + 
    	                      String(today.getMonth() + 1).padStart(2, '0') + '-' + 
    	                      String(today.getDate()).padStart(2, '0');
    	var tomorrowDateFormat = tomorrow.getFullYear() + '-' + 
    	                         String(tomorrow.getMonth() + 1).padStart(2, '0') + '-' + 
    	                         String(tomorrow.getDate()).padStart(2, '0');

    	var urlParams = new URLSearchParams(window.location.search);
    	var sdate = urlParams.get('sdate');
    	var edate = urlParams.get('edate');

    	if (sdate == null) {
    	  $('#sdate').val(todayDateFormat);
    	} else {
    	  $('#sdate').val(sdate);
    	}

    	if (edate == null) {
    	  $('#edate').val(tomorrowDateFormat);
    	} else {
    	  $('#edate').val(edate);
    	}
    	
    	$(".gsres").click(function() {
            var rsv_price = $(this).attr('data-rsv-price'); // rsv_price 값을 동적으로 설정하는 방법에 따라 값이 달라질 수 있음
            $("#rsv_price_input").val(rsv_price); // hidden input 요소의 값을 업데이트
          });
    	
    	$('#res_search_button').click(function() {
            var person = $('#adult_select').val();
            var startDate = $('#sdate').val();
            var endDate = $('#edate').val();
            var currentUrl = window.location.href;
            var urlWithoutParams = currentUrl.split('?')[0];
            var newUrl = urlWithoutParams + "?person=" + person + "&sdate=" + startDate + "&edate=" + endDate;
            window.location.href = newUrl;
          });
        })
    </script>
</head>
<%
List<ReservationDTO> roomList=(List<ReservationDTO>)request.getAttribute("list");
%>
<body>

<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>
<!--//header -->


<!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
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
            <h1 id="ltitle">예약 페이지</h1>
        </div>
        <div class="contents_sub"
             style="width:1200px !important;min-height: 1300px;height:100%;margin: 0 auto;padding-top:50px;">
            <div class="reser_area">
            <form id="frm" action="res.do" method="get">
                <div class="resergrp" style="width: 900px; margin: 0 auto;">
                    <div id="btno1_div" class="detail_list roomIntro">
                        <div class="detail_date_grp" style="width: 430px; margin: 0 auto;">
                            <div class="date_grp cal_bg" style="margin-bottom: 20px;">
                               예약기간
                        <span class="date_select">
                            <input type="date" id="sdate" name="sdate" data-title="시작일">
                        </span>
                                <span>~</span>
                                <span class="date_select">
                            <input type="date" id="edate" name="edate" data-title="마감일">
                        </span>
                        <span class="date_select">
                            <select id="adult_select" name="rsv_person">
	                        <option value="1" selected="selected">1명</option>
	                        <option value="2">2명</option>
	                        <option value="3">3명</option>
	                        <option value="4">4명</option>
	                        <option value="5">5명</option>
	                        <option value="6">6명</option>
                    </select>
                        </span>
                                <span class="last_word">
                        <button type="button" class="rsv_search_button" id="res_search_button">검색</button>
                        
                          </span>

                            </div>
                        </div>
                        <div id="res_container">
                <input type="hidden" name="rsv_price" id="rsv_price_input" value="">
            <ul id="room_list">
                <!-- <li></li> -->
                <%for(int i=0; i<roomList.size(); i++){ %>
                <li class="gslist">
                    <div class="img_div">
                        <img src="./image/room<%=roomList.get(i).getRoom_num()%>_big1.jpg" class="list_room_image">
                    </div>
                    <div class="text_div">
                        <h1 class="gsname"><%=roomList.get(i).getRoom_type()%></h1>
                        <div class="gsperson">최대 인원 <%=roomList.get(i).getRoom_person()%>명</div>
                        <div class="gsprice"><%=roomList.get(i).getRoom_price()%>원</div>
                        <div class="gs_btn_div">
                            <button type="button" class="gsdetail" onclick="window.location.href='<%=request.getContextPath()%>/room<%=roomList.get(i).getRoom_num()%>.jsp'">자세히 보기</button><button type="submit" class="gsres" name="room_num" value="<%=roomList.get(i).getRoom_num()%>"
                            data-rsv-price="<%=roomList.get(i).getRoom_price()%>">예약하기
                            
                            </button>
                        </div>
                    </div>
                </li>
                <%}%>
        </ul>
        </form>
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


<!-- Footer End -->
<!-- btn_top 적용되는 거 -->
<!--<script type="text/javascript">-->
<!--    $(document).ready(function() {-->
<!--        $('#ft_btn_close').bind('click', function() {-->
<!--            $('html, body').stop().animate({scrollTop:'0'}, 600)-->
<!--        });-->
<!--    }); -->
<!--</script>   -->

<script src="./js/footer.js" ></script>

</body>
</html>
