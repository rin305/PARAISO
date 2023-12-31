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
    <title>PARAISO 리조트</title>

    <!-- CSS Import -->
    <link type="text/css" href="./css/basic.css?ver=1" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
</head>

<body>
<jsp:include page="/template/header.jsp"></jsp:include>

        <div id="dropMenuBg"></div>
<style>
.center{
 text-align:center;
  position:relative;
  
}

   .btn{
        width:60px;
        box-shadow: none;
        margin:10px;
        bottom:100px;
        border:none;
        border-radius: 8px;
        height:40px;
        position:relative;
        font-size:15px;
        }
        
         .btn_edit:hover{
         background-color:#ED0000;
		color: #white !important;
		transition:0.5s;
        }
        
       .btn_edit{
       background-color:#A50000;
       	color:white;
        }
        
        .buttons{
      position:relative;
      top:100px;
      }
	
</style>
</head>
<!-- 서브상단이미지 -->
<div class="sub_topgrp">
  <div class="subtitbox">
    <h1 id="mtitle">관리자</h1>
  </div>
  <div class="s_topimg">
    <img src="./image/faci_top.png"/>
  </div>
</div>

<head>
<title>룸가격수정</title>
</head>

<body>
<div id="contents_sub">
  <div class="content_area">
    <div class="subtitbox02">
		 <h1 id="ltitle">방가격 수정</h1>
	</div>
	
	<div class="contents_sub"
         style="width:1200px !important;min-height: 1300px;height:100%;margin: 0 auto;padding-top:50px;">
      <div class="reser_area">

        <div class="resergrp" style="width:1100px; margin: 0 auto;">
          <div id="btno1_div" class="detail_list roomIntro">
            <div class="info_ntb_box">
              <table class="info_ntb">
                <colgroup>
                  <col width="25%"/>
                  <col width="25%"/>
                  <col width="25%"/>
                  <col width="25%"/>
                </colgroup>
                <thead>
                
                <span style="border-bottom:1px solid black;">
                    <strong>EDIT</strong>
                    <span class="divider">|</span>
                            수정</span>
                        
<form method="post" name="roomupdate" action="/ParaisoResort/roomPro.do">

<tr class="text">
    <td class="info_ntb_th" style="height:10px; text-align:center; color:black; font-size:18px;border-top:1.5px solid black; border-bottom:1px solid black; font-weight:500;">방 타입</td>
    <td class="info_ntb_th" style="height:10px; text-align:center; color:black; font-size:18px;border-top:1.5px solid black; border-bottom:1px solid black; font-weight:500;"><strong>성수기</strong></td>
	<td class="info_ntb_th" style="height:10px; text-align:center; color:black; font-size:18px;border-top:1.5px solid black; border-bottom:1px solid black; font-weight:500;"><strong>비성수기</strong></td>
	<td class="info_ntb_th" style="height:10px; text-align:center; color:black; font-size:18px;border-top:1.5px solid black; border-bottom:1px solid black; font-weight:500;"><strong>가격수정</strong></td>
   </tr>
   </thead>
	<!-- style="border-bottom:1px solid black; -->
	<tbody>
	<tr style="border-bottom:1px solid black; align-items:center;">
    <td>
    	<input  class="center" type="text" name="room_type" value="${roomdto.room_type}"
    	  style=" height:35px; text-align:center; left:78px; position:relative; border:none; font-size:15px; font-weight:400; background-color:#eee; border-radius:5px; width:100px;" readonly > 
        <input  class="center" type="hidden" name="room_type" value="${roomdto.room_type}" >
	    </td>
	     <td>
		     <!-- <input type="text" vaule="가격수정" placeholder="60,000" > -->
		    <%--  <input type="number" name="peakseason" value="<%=peakseason%>"> --%>
		   
		   <input  class="center" type="number" step="1000" name="peakseason" value="${roomdto.peakseason}" style="left:28px; text-align:center; height:25px; font-size:15px; border:none; ">
		   
	   	</td>
	   	
	     <td class="info_ntb_td qna_list_padding" style="border-bottom:1px solid black;">
	      <%-- <input type="number" name="offseason" value="<%=roomdto.getOffseason()%>" > --%>
	   <input  class="center" type="number" step="1000" name="offseason" value="${roomdto.offseason}" style="font-size:15px; border:none; text-align:center; "> 
	     
	     </td>
	     <td class="info_ntb_td qna_list_padding center buttons" style="border-bottom:1px solid black;">
	      <input type="submit" value="등록" class="btn btn_edit" onclick="return confirm('해당 가격으로 수정하시겠습니까?');">
	     </td>
     </tr>
	 </tbody>
</table>    
</form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>


<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>


