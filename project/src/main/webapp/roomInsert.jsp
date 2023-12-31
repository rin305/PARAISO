<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	request.setCharacterEncoding("UTF-8");
		System.out.println("request.getContextPath()=>"+request.getContextPath());
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script language="JavaScript" src="./js/prototype.js?ver=412"></script>
<script language="JavaScript" src="./js/registerCheck.js?ver=10"></script>
<title>회원가입</title>
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
        .zip{
        width: 150px;
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
		.addr{
		width:330px;
		}
		#namemsg{
		position:relative;
		margin-left:-50px;
		}


</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 회원가입 폼 나오는 공간 -->
<body >


<!-- 회원 정보입력 영역 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="title">회원가입</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/room_top.png"/>
    </div>
</div>
<form name="regForm" class="regForm" action="roomInsert.do" method="post"> 
<h2 class="info_cont_title center">회원정보 입력</h2>
	<div class="box">
		<div class="field">
			<label class="bold">방 번호</label>
				<input type="text"  class="form-input" name="room_num" id="room_num"  required autocomplete="off">
		 		<br>
	 			<span id="idmsg"></span>
		 </div>
		 <div class="field">
			<label class="bold">방 타입</label>
				<input type="text"  class="form-input" name="room_type" id="room_type"  required autocomplete="off">
		 		<br>
	 			<span id="idmsg"></span>
		 </div>
		 <div class="field">
			<label class="bold">방 등급</label>
				<input type="text"  class="form-input" name="room_grade" id="mem_id"  required autocomplete="off">
		 		<br>
	 			<span id="idmsg"></span>
		 </div>
		 <div class="field">
			<label class="bold">방 가격</label>
				<input type="text"  class="form-input" name="room_price" id="room_price"  required autocomplete="off">
		 		<br>
	 			<span id="idmsg"></span>
		 </div>
		 <div class="field">
			<label class="bold">기준 인원</label>
				<input type="text"  class="form-input" name="room_person" id="room_person"  required autocomplete="off">
		 		<br>
	 			<span id="idmsg"></span>
		 </div>
		 <div class="field">
			<label class="bold">성수기 가격</label>
				<input type="text"  class="form-input" name="peakseason" id="peakseason" required autocomplete="off">
		 		<br>
	 			<span id="idmsg"></span>
		 </div>
		 <div class="field">
			<label class="bold">비성수기 가격</label>
				<input type="text"  class="form-input" name="offseason" id="offseason" required autocomplete="off">
		 		<br>
	 			<span id="idmsg"></span>
		 </div>
	 	<div class="buttons">
	      <a href="index.do"><button type="button" class="btn prev-btn">이전</button></a>
	      <button type="submit" class="btn" >방 등록하기</button>
		</div>
	</div><!-- box -->
</form>
 <script type="text/javascript">
 function findAddress() {
     new daum.Postcode({
         oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 //document.getElementById("sample6_extraAddress").value = extraAddr;
             
             } else {
                 //document.getElementById("sample6_extraAddress").value = '';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById("mem_zip").value = data.zonecode;
             document.getElementById("mem_addr").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("mem_addr2").focus();
         }
     }).open();
 }
    
</script>


</body>

