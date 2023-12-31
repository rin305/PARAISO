<%@page import="java.util.List"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
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
<script>
    $(function(){
    	$('#rese_chk_btn').on('click',function(){
    		
    		if ($('#name_input_text').val() === ''){
    			$('#name_caution').show();
    			$('#name_input_text').focus();
    			return false;
    		}
    		
    		else if ($('#phone_input_text').val() === ''){
                $('#phone_input_text').focus();
                $('#newpwchk_caution').show();
                return false;
            }
            
    
    		
    		$('#frm').submit();
    	})
    })
</script>
</head>
<body>
<!-- header -->
<jsp:include page="/template/header.jsp"></jsp:include>

<!--//header -->

<%
request.setCharacterEncoding("UTF-8");
%>


<!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="mtitle">예약 상세</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/faci_top.png">
    </div>
</div>
<!-- //서브상단이미지 -->


<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area" style="width: 800px;">
        <div class="subtitbox02">
            <h1 id="ltitle">결제</h1>
        </div>
        <div id="rese_chk">
            <form id="frm" action="pay_proc.do" method="get">
                <input type="hidden" name="rsv_num" value="${param.rsv_num}">
                <input type="hidden" name="mem_id" value="${param.mem_id}">
                <input type="hidden" name="pay_price" value="${param.pay_price}">
                <input type="hidden" name="room_num" value="${param.room_num}">
                <table cellpadding="0" cellspacing="0" class="view_tbt">
                    <caption>기본뷰</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody id="rese_chk_table">
                    <tr>
                        <th>예약 번호</th><!-- 예약 번호 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                            </div>
                            <div>
                                ${param.rsv_num}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>예약자 성명</th><!-- 성명 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                ${param.rsv_name}
                            </div>
                        </td>
                    </tr><tr>
                        <th>방 번호</th><!-- 방 번호 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                ${param.room_num}
                            </div>

                            
                        </td>
                    </tr><tr>
                        <th>방 타입</th><!-- 방 타입 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                ${param.room_type}
                            </div>

                            
                        </td>
                    </tr><tr>
                        <th>예약 금액</th><!-- 예약 금액 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                ${param.pay_price}
                            </div>

                            
                        </td>
                    </tr></tbody>


                    <!--                    예약 취소               -->
                    <tbody id="rese_cancel_table" style="display: none;">

                    <tr>
                        <th>예약번호</th><!-- 예약번호 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th>예약정보</th><!-- 예약정보 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                <span>
                                    예약정보 관련된 내용들 <br>
                                    예약정보 관련된 내용들 <br>
                                    예약정보 관련된 내용들 <br>
                                    2023.02.25 <br>
                                </span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th>결제 금액</th><!-- 결제 금액 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                500,000원
                            </div>
                        </td>
                    </tr>

                    </tbody>
                </table>
            </form>
            <div class="info_cont_left">
            
                <button type="submit" class="section_cont_text_btn section_cont_text_btn qna_list_btn" style="max-width: 150px;" id="rese_chk_btn">결제 확인</button>
                <button class="section_cont_text_btn section_cont_text_btn qna_list_btn" style="background:#555;" id="rese_cancel_btn" onclick="window.history.back()">뒤로 가기</button>
            </div>
        </div>
    </div>
    <!-- Content End -->

    <!-- Content End -->
</div>
<!-- contents End -->

<!-- container End -->


<!-- Footer Start -->

    
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

    <meta charset="UTF-8">

<div class="copy" style="padding: 0px">
    <button id="ft_btn_close" class="btn_top radius03">TOP</button>
</div>

<!-- footer 최하단 박스-->
<%@include file="./template/footer.jsp" %>

<a href="#" class="resevr_icon">
    <span class="reser_box_bg"></span>
    <span class="rese_btn_grp">
                    <span class="calendar_icon">
                    </span>
                    <span class="resevr_txt">온라인 예약하기</span>
                </span>
</a>



<!-- Footer End -->
<!-- btn_top 적용되는 거 -->
<!--<script type="text/javascript">-->
<!--    $(document).ready(function() {-->
<!--        $('#ft_btn_close').bind('click', function() {-->
<!--            $('html, body').stop().animate({scrollTop:'0'}, 600)-->
<!--        });-->
<!--    }); -->
<!--</script>   -->

<script src="./js/footer.js"></script>


</body>
</html>