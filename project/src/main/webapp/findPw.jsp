<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--     <script language="JavaScript" src="findCheck.js"></script> -->
    <title>비밀번호 찾기</title>
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
           padding-top:5px;
            font:12px;
            text-align:center;
            width: 900px;
            height: 120px;
            display: flex;
            justify-content: center;
            align-items: center;
            
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
        background:rgb(86, 97, 120);
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
        width: 220px;
        border-radius:4px;
        border:1px solid #ccc;
        height:36px; 
        font-size:16px;
        color:#666;
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
        .img_bar{
       	width:900px;
       	height:110px;
       	margin:auto;
       	display:block;
       	padding-top:50px;
        }
    </style>
    <!-- jquery cdn -->
   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script type="text/javascript">
    $(function(){
    	$("input[name=mem_id]").blur(CheckId);
        $("input[name=mem_name]").blur(CheckName);
        $("input[name=mem_email]").blur(CheckEmail);
        $(".findForm").submit(function(){
            //함수이름을 적고 call() 이라고 부르면 this 를 바꿔서 부를 수 있다
            var judge1 = CheckId.call(document.querySelector("input[name=mem_id]"));
            var judge2 = CheckName.call(document.querySelector("input[name=mem_name]"));
            var judge3 = CheckEmail.call(document.querySelector("input[name=mem_email]"));

            return judge1 && judge2 && judge3;
        });  
    	
    
            var index=0;

            //1. 처음 페이지를 제외하고 모두 숨김 처리
            // $(".page:gt(0)").hide();
            // $(".percent").css("width","25%");
            move(index); //첫 페이지이기 때문에 줄이거나 늘일필요 X

            //2. 다음 버튼을 누르면 다음 페이지가 나오도록 구현
            $(".next-btn").not(":last").click(function(){
                index++;
                move(index);
                // move(++index);
            });
            //3. 이전 버튼을 누르면 이전 페이지가 나오도록 구현
            $(".prev-btn").not(":first").click(function(){
                index--;
                move(index);
            });
            function move(index){
                $(".page").hide(); //페이지 숨기기
                $(".page").eq(index).show(); //페이지 나오기

            }
            //이름 정규표현식
            function CheckId(){
             //this==이름 입력창
            var regex = /^[a-z][a-z0-9]{7,19}$/;
            var mem_id =$(this).val();

            var judge = regex.test(mem_id);
            if(judge){
                $(this).next().next("span").css("color","green")
                $(this).next().next("span").text("")
                return true;
            }else{
                $(this).next().next("span").css("color","red")
                $(this).next().next("span").text("아이디를 다시 확인해주세요.")
                return false; 
            }
             
            }; 
            //전화번호 정규표현식
            function CheckName(){
             //this==전화번호 입력창
            var regex = /^[가-힣]{2,7}$/;
            var mem_name =$(this).val();

            var judge = regex.test(mem_name);
            if(judge){
                $(this).next().next("span").css("color","green")
                $(this).next().next("span").text("")
                return true;
            }else{
                $(this).next().next("span").css("color","red")
                $(this).next().next("span").text("이름을 다시 확인해주세요.");
                return false;
            } 
            }; 
            //이메일 정규표현식
            function CheckEmail(){
             //this==이메일 입력창
            var regex = /[a-zA-z][a-zA-Z0-9@]{9,49}/;
            var mem_email =$(this).val();

            var judge = regex.test(mem_email);
            if(judge){
                $(this).next().next("span").css("color","green")
                $(this).next().next("span").text("")
                return true;
            }else{
                $(this).next().next("span").css("color","red")
                $(this).next().next("span").text("이메일주소를 다시 확인해주세요");
                return false;
            } 
            }; 
    });
    </script>
</head>
<body>
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="title">비밀번호 찾기</h1><!-- 타이틀 -->
    </div>
    <div class="s_topimg">
        <img src="./image/room_top.png"/>
    </div>
</div>
<form class="findForm" name="findForm" action="emailsendpw.do" method="post">
    <div class="info-container">
    <!-- 	<div class="percent"></div> --><!-- 퍼센트바 -->
        	<h2 class="info_cont_title center">비밀번호를 잊으셨나요?</h2>
        	<p class="info_cont_text center">가입 시 입력한 정보를 입력해주세요. 임시 비밀번호가 이메일로 전송됩니다.</p>
        <div class="page">
        	<img class="img_bar" src="./image/testimg1.png">
        	<div class="box">
        		<div class="input-box">
        		<span class="bold">아이디</span>
	     		<input type="text" id="mem_id" name="mem_id" required autocomplete="off" class="form-input" placeholder="아이디를 입력해주세요">
        		<br>
        		 <span></span>
        		</div>
        	</div>
        	<div class="row center">
            	<button type="button" class="btn prev-btn">이전</button>
            	<button type="button" class="btn next-btn">다음</button>
        	</div>
        </div>
         <div class="page">
        	<img class="img_bar" src="./image/testimg2.png">
        	<div class="box">
        		<div class="input-box">
        	<span class="bold">이름</span>
	     	<input type="text" id="mem_name" name="mem_name" required autocomplete="off" class="form-input" placeholder="이름을 입력해주세요">
	     	<br>
			<span></span>
        	</div>
        	</div>
        	<div class="row center">
            	<button type="button" class="btn prev-btn">이전</button>
            	<button type="button" class="btn next-btn">다음</button>
        	</div>
        </div>
         <div class="page">
        	<img class="img_bar" src="./image/testimg3.png">
        	<div class="box">
        		<div class="input-box">
        	<span class="bold">이메일</span>
	     	<input type="email" id="mem_email" name="mem_email" required autocomplete="off" class="form-input" placeholder="이메일을 입력해주세요">
        	<br>
			<span></span>
        	</div>
        	</div>
        	<div class="row center">
            	<button type="button" class="btn prev-btn last-btn">이전</button>
            	<button type="button" class="btn next-btn last-btn last">다음</button>
            	<button type="submit" class="btn btn-submit">비밀번호 찾기</button>
        	</div>
        </div>
        
    </div>
 </form>
</body><%-- 
<jsp:include page="/jsp/template/footer.jsp"></jsp:include> --%>