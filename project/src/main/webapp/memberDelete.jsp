<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/template/header.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 탈퇴 안내</title>
   <style>
 .info_cont_title{
        position:relative;
        top:30px;
        padding:30px;
        }
        
        .info_cont_text{
        position:relative;
        padding:10px;
        font-size:18px;
        font-weight:355;
        color:#333;
        }
       
        .box{
           /*  padding:80px ,40px, 20px; */
           padding-top:25px;
            font:12px;
            text-align:center;
            width: 900px;
            height: 120px;
            justify-content: center;
            align-items: center;
            word-break:break-all;
            margin:auto;
            top:80px;
        }  
        .input-box{
            width: 300px;
            display: inline-block;
        }
        
        .last{
           display: none;
        }
        
        .prev-btn{
        color:gray; 
        background:#F6F6F6;
        position:relative;
        /* top:880px;
  		left:430px; */
        }
        .next-btn{
        color:white; 
        background:#b9a06f;
        }
        
        .btn-submit{
        color:white; 
        background:#363636;
        }
        .btn{
        width:130px;
        box-shadow: none;
        margin:10px;
        bottom:100px;
        border:none;
        border-radius: 13px;
        height:45px;
        position:relative;
        font-size:15px;
        }
        .find-btn{
        top:0px;
        width:80px;
        color:white;
        background:#000030;
        height:40px;
        }
        .find-btn:hover{
        background:#00001E;
        }
        .next-btn:hover{
        background:#B29762;
        }
        .prev-btn:hover{
          color: #161D2D !important;
  		background-color:#DDDDDD;
        }
        .btn-submit:hover{
        color: #white !important;
  		background-color:black;
        }
        .center{
        text-align:center;
        }
        .row{
        padding-top:100px;
        }
        .info_cont_txt{
        position:relative;
        }
        
        .form-input{
        width: 220px;
        border-radius:4px;
        border:1px solid #ccc;
        height:36px; 
        font-size:16px;
        color:#666;
        padding-left:10px;
        }
       .form-input:focus{
        outline: 1.5px solid black;
		border-radius :4px;
        }
       .warning{
      /*  bottom:35px; */
       margin-bottom:7px;
       margin-left:5px;
       }
        .input-msg{
        font-size:25px;
        margin-left:auto;
        margin-right:auto;
        text-align:10px;
        color:#353535;
        }
        .info_input_box{
        position:relative;
        top:20px;
        }
        .bold{
        font-weight:600;
        padding-right:20px;
        font-size:18px;
        }
        .field{
        padding:10px;
        }
		.buttons{
		position:relative;
		top:100px;
		}
		.star{
		color:red;
		}
</style>
<style>
.nav-list{
text-align:center;
}
.nav-item{
display:inline-block;
font-size:18px;
margin:20px;
padding:10px;
}
.nav-item:hover{
transform: scale(1.05);
}
.active{
font-weight:500;
}

</style>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="../css/reset.css">
    <link rel="stylesheet" type="text/css" href="../css/common.css">
    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script type="text/javascript">

    </script>
</head>
<body>
<div class="sub_topgrp">
  <div class="subtitbox">
    <h1 id="mtitle">로그인/회원가입</h1>
  </div>
  <div class="s_topimg">
    <img src="./image/faci_top.png"/>
  </div>
</div>
<!-- Contents Start -->
<div id="contents_sub">
  <div class="content_area" style="width: 800px;">
    <div class="subtitbox02">
      <h1 id="ltitle">마이 페이지</h1>
    </div>
		<ul class="nav-list">
			<li class="nav-item">
			<a class="nav-link " 
			 href="<%=request.getContextPath() %>/memberInfo.do">회원정보
					수정</a></li>
			<li class="nav-item active">
			<a class="nav-link"
				href="<%=request.getContextPath() %>/changePw.jsp">비밀번호
					변경</a></li>
			<li class="nav-item">
			<a class="nav-link"
				href="<%=request.getContextPath()%>/reservationinfo.do">예약내역</a></li>
			<li class="nav-item active">
			<a class="nav-link"
				href="<%=request.getContextPath() %>/memberDelete.jsp">회원탈퇴</a></li>
		</ul>
		<br><br>
        <form action="delete.do" method="post" onsubmit="return confirm('탈퇴하시겠습니까?')">
        <table cellpadding="0" cellspacing="0" class="view_tbt">
        <caption>기본뷰</caption>
        <colgroup>
          <col width="20%">
          <col width="80%">
        </colgroup>
        <tbody>
        
        <!-- 회원탈퇴 주의문구표기 -->
        <div class="info_memo_box withdrawal">
          <p class="info_memo_txt pageTxt" data-page="kor_priv05"><p><span style="font-size: medium;"><b>탈퇴 시 유의사항</b></span></p>
          <ul style="list-style-type: circle;">
            <li><span style="font-size: small;">회원 탈퇴 전 반드시 확인 바랍니다.</span></li>
            <br>
            <li><span style="font-size: small;"><span>* 파라이소 리조트 회원 탈퇴 시 회원이 보유하고 있던 포인트는 모두 소멸되며, 복구가 불가능합니다.</span></span></li>
            <li><span style="font-size: small;">* 파라이소 리조트 회원 탈퇴 후 재가입하더라도 탈퇴 전의 회원 등급, 회원 정보, 포인트 등은 복구되지 않습니다.</span></li>
            <li><span style="font-size: small;"><span>* 파라이소 리조트 회원 탈퇴하더라도 작성하신 문의, 후기글은 삭제되지 않습니다.</span></span></li>
            <li><span style="font-size: small;"></span></li>
          </ul></p>
        </div>
        <br>
        <br>

        <tr>
          <th>비밀번호</th><!-- 비밀번호 -->
          <td>
           <div class="ibox" style="display: flex; align-items: center;">
                <input type="password" name="userPw" class="i_text"/>
                <div class="register_list_caution warning">
         			<c:if test="${param.error ne null}">
         					<span id="newpwchk_caution">! 비밀번호가 일치하지 않습니다.</span>
					</c:if>
            </div>
            </div>
            
            </td>
        </tr>

        </tbody>
      </table>
      <div class="info_cont_left">
      <button class="section_cont_text_btn section_cont_text_btn qna_list_btn" type="submit" style="border:none;border-radius:8px;">회원탈퇴</button>
      <button class="section_cont_text_btn section_cont_text_btn qna_list_btn" style="background:#555; border-radius:8px;"
         onclick="history.back();">이전페이지</button>
    </div>
   
    </form>
        </div>
    </div>