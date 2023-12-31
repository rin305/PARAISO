<%@page import="java.io.Console"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.ReservationDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<!DOCTYPE html>
<html lang="ko">

<head>

	<%
	boolean loginCheck =(Boolean)request.getAttribute("loginCheck");
	if(!loginCheck){
		response.sendRedirect("login.do");
	}
	%>
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
    <script>
    $(function(){
    	const now = new Date();
        const threeMonthsAgo = new Date(now.getFullYear(), now.getMonth() - 3, now.getDate());
        const threeMonthsLater = new Date(now.getFullYear(), now.getMonth() + 3, now.getDate());
        
        
        var threeMonthsAgoDateFormat = threeMonthsAgo.getFullYear() + '-' + 
        String(threeMonthsAgo.getMonth() + 1).padStart(2, '0') + '-' + 
        String(threeMonthsAgo.getDate()).padStart(2, '0');
        
        var threeMonthsLaterDateFormat = threeMonthsLater.getFullYear() + '-' + 
        String(threeMonthsLater.getMonth() + 1).padStart(2, '0') + '-' + 
        String(threeMonthsLater.getDate()).padStart(2, '0');
        
        
        
    	var urlParams = new URLSearchParams(window.location.search);
        var sdate = urlParams.get('sdate');
        var edate = urlParams.get('edate');

        if(sdate == null){
            $('#sdate').val(threeMonthsAgoDateFormat);
        } else {
        	$('#sdate').val(sdate);
        }
        if(edate == null){
        	$('#edate').val(threeMonthsLaterDateFormat);
        } else {
        	$('#edate').val(edate);
        }
    	
    	$('#res_search_button').click(function(){
    		var startDate = $('#sdate').val();
            var endDate = $('#edate').val();
            var currentUrl = window.location.href;
            var urlWithoutParams = currentUrl.split('?')[0];
            var newUrl = urlWithoutParams + "?sdate=" + startDate + "&edate=" + endDate;
            window.location.href = newUrl;
            
            
        $(".section_cont_text_btn section_cont_text_btn sales_list_btn").click(function() {
                var rsv_num = $(this).attr('#data-rsv-num'); // rsv_price 값을 동적으로 설정하는 방법에 따라 값이 달라질 수 있음
                $("#rsv_num_input").val(rsv_num); // hidden input 요소의 값을 업데이트
                $('#res_info_form').submit();
              });
    	})
    })
    </script>
</head>
<%
List<ReservationDTO> resInfo=(List<ReservationDTO>)request.getAttribute("resInfo");
/* System.out.println("resInfo.jsp의 resInfo=>"+resInfo.get(0).getRsv_cancel()); */
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
            <h1 id="ltitle">예약정보 페이지</h1>
        </div>
        <div class="contents_sub"
             style="width:1200px !important;min-height: 1300px;height:100%;margin: 0 auto;padding-top:50px;">
            <div class="reser_area">

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
                                <span class="last_word">

                        <button type="button" class="search_button" id="res_search_button">검색</button>
                          </span>
                            </div>
                        </div>
                        <div class="info_ntb_box">
                        <form id="res_info_form" action="res_detail.do" method="get">
                            <table class="info_ntb">
                                <colgroup>
                                    <col width="10%"/>
                                    <col width="15%"/>
                                    <col width="10%"/>
                                    <col width="10%"/>
                                    <col width="15%"/>
                                    <col width="15%"/>
                                    <col width="15%"/>
                                    <col width="15%"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th class="info_ntb_th qna_list_padding">예약번호</th>
                                    <th class="info_ntb_th qna_list_padding">예약자명</th>
                                    <th class="info_ntb_th qna_list_padding">인원 수</th>
                                    <th class="info_ntb_th qna_list_padding">룸타입</th>
                                    <th class="info_ntb_th qna_list_padding">체크인</th>
                                    <th class="info_ntb_th qna_list_padding">체크아웃</th>
                                    <th class="info_ntb_th qna_list_padding">금액</th>
                                    <th class="info_ntb_th qna_list_padding">상세정보</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%for(int i = 0 ; i < resInfo.size() ; i++){ 
                                if("0".equals(resInfo.get(i).getRsv_cancel())){
                                %>
                                 <tr>
                                    <th class="info_ntb_td qna_list_padding"><%=resInfo.get(i).getRsv_num()%></th>
                                    <td class="info_ntb_td qna_list_padding"><%=resInfo.get(i).getRsv_name()%></td>
                                    <th class="info_ntb_td qna_list_padding"><%=resInfo.get(i).getRsv_person()%></th>
                                    <th class="info_ntb_td qna_list_padding"><%=resInfo.get(i).getRoom_type()%></th>
                                    <th class="info_ntb_td qna_list_padding"><%=LocalDate.parse(resInfo.get(i).getRsv_start().substring(0, 10))%></th>
                                    <th class="info_ntb_td qna_list_padding"><%=LocalDate.parse(resInfo.get(i).getRsv_end().substring(0, 10))%></th>
                                    <th class="info_ntb_td qna_list_padding"><fmt:formatNumber value="<%=resInfo.get(i).getRsv_price()%>" pattern="#,###" /></th>
                                    <th class="info_ntb_td qna_list_padding"><button type="submit" name="rsv_num" class="section_cont_text_btn section_cont_text_btn sales_list_btn"
                                    value="<%=resInfo.get(i).getRsv_num()%>">확인</button></th>
                                </tr>
                                <%} %>
                                <%}//for문 종료 %>
                                </tbody>
                            </table>
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
<%@ include file="/template/footer.jsp" %>


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
