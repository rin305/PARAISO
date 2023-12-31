<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
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
           padding-top:30px;
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
        width:300px;
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
		
	
</style>
<script type="text/javascript">
</script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- <script language="JavaScript" src="loginCheck.js?ver=1"></script> -->
<link rel="stylesheet" type="text/css">
<div class="sub_topgrp">
	<div class="subtitbox">
		<h1 id="title">로그인</h1>
	</div>
	<div class="s_topimg">
		<img src="./image/room_top.png" />
	</div>
</div>
<h2 class="info_cont_title center">마이페이지</h2>
<div class="buttons center">
	<button class="btn btn-submit" onclick="location.href='<%=request.getContextPath()%>/memberInfo.do'">
		회원정보 수정
	</button>
	<button class="btn btn-submit" onclick="location.href='<%=request.getContextPath()%>/changePw.jsp'">
		비밀번호 수정
	</button>
	<button class="btn btn-submit" onclick="location.href='<%=request.getContextPath()%>/memberDelete.jsp'">
		회원 탈퇴
	</button>
</div>





<%-- <jsp:include page="/jsp/template/footer.jsp"></jsp:include> --%>