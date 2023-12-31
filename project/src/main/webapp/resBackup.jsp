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
    	
    	 $('#name_caution').hide();
    	 $('#newpwchk_caution').hide();
    	 $('#name_input_text').blur(function() {
    		    // 입력한 값이 없다면
    		    if ($(this).val() === '') {
    		      // caution 메시지 출력
    		      $('#name_caution').show();
    		    } else {
    		      // caution 메시지 감추기
    		      $('#name_caution').hide();
    		    }
    		  });

    		  // 연락처 input 태그 focus out 이벤트 처리
    		  $('#phone_input_text').blur(function() {
    		    // 입력한 값이 없다면
    		    if ($(this).val() === '') {
    		      // caution 메시지 출력
    		      $('#newpwchk_caution').show();
    		    } else {
    		      // caution 메시지 감추기
    		      $('#newpwchk_caution').hide();
    		    }
    		  });
    	
    })

</script>
</head>
<jsp:include page="/template/header.jsp"></jsp:include>
<body>

<!-- header -->
<!-- 로고 -->

<!--//header -->


<!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="mtitle">예약</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/faci_top.png"/>
    </div>
</div>
<!-- //서브상단이미지 -->


<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area" style="width: 800px;">
        <div class="subtitbox02">
            <h1 id="ltitle">예약 확인</h1>
        </div>
        <div id="rese_chk">
            <form id="frm" action="res_proc.do">
                <input type="hidden" name="eegbcode" value="KOR">
                <input type="hidden" name="bmbeonho" value="0000">
                <input type="hidden" name="room_num" value="${param.room_num}">
                <input type="hidden" name="rsv_start" value="${param.sdate}">
                <input type="hidden" name="rsv_end" value="${param.edate}">
                <input type="hidden" name="rsv_price" value="${param.rsv_price}">
                <input type="hidden" name="rsv_person" value="${param.rsv_person}">
               <!--  String mem_id=request.getParameter("mem_id");
        String rsv_name=request.getParameter("rsv_name");
        String room_num=request.getParameter("room_num");
        String rsv_start=request.getParameter("rsv_start");
        String rsv_end=request.getParameter("rsv_end");
        String rsv_price=request.getParameter("rsv_price");
        String rsv_person=request.getParameter("rsv_person");
        String rsv_phone=request.getParameter("rsv_phone"); -->
                <table cellpadding="0" cellspacing="0" class="view_tbt">
                    <caption>기본뷰</caption>
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>

                    <!--                default - 예약 확인
                                        예약 확인 완료 시 (예약 확인 비활성화, 예약 취소 화면으로 전환)
                    (#rese_chk_table -> display: none; #rese_chk_btn -> display: none;
                    / #rese_cancel_table -> display: block; #rese_cancel_btn -> display: block;)
                    -->

                    <!--                    예약 확인               -->
                    <tbody id="rese_chk_table">

                  <!--   <tr>
                        <th>예약번호</th>예약번호
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                <input name="rese_num" type="text" class="i_text" data-check="required"
                                       style="width:250px" value=""/>
                            </div>
                        </td>
                    </tr> -->

                    <tr>
                        <th>성명</th><!-- 성명 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                <input name="rsv_name" id="name_input_text" type="text" class="i_text" data-check="required"
                                       style="width:250px" value=""/>
                            </div>

                            <div class="register_list_caution">
                                <span id="name_caution">! 이름은 필수정보입니다</span>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <th>연락처</th><!-- 연락처 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                <input name="rsv_phone" id="phone_input_text" type="text" class="i_text" data-check="required"
                                       style="width:250px" value=""/>
                            </div>

                            <div class="register_list_caution">
                                <span id="newpwchk_caution">! 연락처는 필수정보입니다</span>
                            </div>
                        </td>
                    </tr>

                    </tbody>


                    <!--                    예약 취소               -->
                    <tbody id="rese_cancel_table" style="display: none;">

                    <tr>
                        <th>예약번호</th><!-- 예약번호 -->
                        <td>
                            <div class="ibox" style="display: flex; align-items: center;">
                                <input name="rese_num" type="text" class="i_text" data-check="required"
                                       style="width:250px" value=""/>
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
                <a class="section_cont_text_btn section_cont_text_btn qna_list_btn" href="#" style="max-width: 150px;"
                   id="rese_chk_btn">예약 확인</a>
                <a class="section_cont_text_btn section_cont_text_btn qna_list_btn" href="index.jsp"
                   style="background:#555;" id="rese_cancel_btn">예약 취소</a>
            </div>
        </div>
    </div>
    <!-- Content End -->

    <!-- Content End -->
</div>
<!-- contents End -->

<!-- container End -->


<!-- Footer Start -->
<%@ include file="./template/footer.jsp"%>


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