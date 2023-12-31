<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
        <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
   <style>
 	.notselect{
 	border:none;
 	color:#777;
 	}
 	.i_addr{
 	position:relative;
 	margin:2px;
 	margin-bottom:6px;
 	padding:0px 4px;
 	background:#fff;
 	border:1px solid #E1E1E1;
 	vertical-align:middle;
 	color:#777;
 	height: 31px;
 	font-size: 13px;
 	}
 	.i_addr2{
 	position:relative;
 	margin:2px;
 	margin-top:4px;
 	padding:0px 4px;
 	background:#fff;
 	border:1px solid #E1E1E1;
 	vertical-align:middle;
 	color:#777;
 	height: 31px;
 	font-size: 13px;
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!-- <link rel="stylesheet" type="text/css" href="../css/test.css"> -->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
	.center{
		text-align:center;
	}
	</style>
    <script type="text/javascript">
        $(function(){
            //정규표현식 검사를 합쳐서 구현
            $("input[name=mem_name]").blur(regexCheckName);
            $("input[name=mem_phone]").blur(regexCheckPhone);
            $("input[name=mem_email]").blur(regexCheckEmail);

        	var judgeObject = {
        			name:false,
        			phone:false,
        			email:false
        	};
        	
        	$(".frm").submit(function(){
                return judgeObject.name && judgeObject.phone && judgeObject.email;
			})
			
            //이름 정규표현식
            function regexCheckName(){
                //this==이름 입력창
                var regex = /^[가-힣]{2,7}$/;
                var mem_name =$(this).val();

                var judge = regex.test(mem_name);
                if(judge){
                    $(this).next("span").css("color","green")
                    $(this).next("span").text("")
                    judgeObject.name = true;
                }else{
                    $(this).next("span").css("color","red")
                    $(this).next("span").text("한글 2-7자 이내만 가능합니다.");
                    judgeObject.name  = false;
                } 
            }; 
          //전화번호 정규표현식
            function regexCheckPhone(){
                //this==전화번호 입력창
                var regex = /^[0][1][0][1-9][0-9]{7}$/;
                var Phone =$(this).val();

                var judge = regex.test(Phone);
                if(judge){
                    $(this).next("span").css("color","green")
                    $(this).next("span").text("")
                    judgeObject.phone = true;
                }else{
                    $(this).next("span").css("color","red")
                    $(this).next("span").text("숫자 11자리를 입력하세요");
                    judgeObject.phone  =false;
                } 
            }; 
            //이메일 정규표현식
            function regexCheckEmail(){
                //this==이메일 입력창
                var regex =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                var Email = $(this).val();

                var judge = regex.test(Email);
                if(judge){
                    $(this).next("span").css("color","green")
                    $(this).next("span").text("")
                    judgeObject.email =true;
                }else{
                    $(this).next("span").css("color","red")
                    $(this).next("span").text("이메일주소를 다시 확인하세요");
                    judgeObject.email=false;
                } 
            }; 


        });
    </script>
</head>
<body>
<!-- 서브상단이미지 -->
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
			<a class="nav-link" 
			 href="<%=request.getContextPath() %>/memberInfo.do">회원정보
					수정</a></li>
			<li class="nav-item">
			<a class="nav-link"
				href="<%=request.getContextPath() %>/changePw.jsp">비밀번호
					변경</a></li>
			<li class="nav-item">
			<a class="nav-link"
				href="<%=request.getContextPath()%>/reservationinfo.do">예약내역</a></li>
			<li class="nav-item">
			<a class="nav-link"
				href="<%=request.getContextPath() %>/memberDelete.jsp">회원탈퇴</a></li>
		</ul>
		<br><br>
    <form id="frm" action="memberUpdate.do" method="post" onsubmit="return confirm('프로필 변경 사항을 적용하시겠습니까?');">
      <input type="hidden" name="eegbcode" value="KOR">
      <input type="hidden" name="bmbeonho" value="0000">
      <table cellpadding="0" cellspacing="0" class="view_tbt">
        <caption>기본뷰</caption>
        <colgroup>
          <col width="20%">
          <col width="80%">
        </colgroup>
        <tbody>
        <th style="padding:20px;">
        <object data="./image/circle-user-regular.svg" width='100' height='100' filter="#50586b"></object>

        </th>
        <td>
        <div style="font-size:20px; color:black;"><b>${memdto.mem_name}</b>님, 환영합니다.</div></td>
	   
	        <tr>
	          <th>이름</th><!-- 성명 -->
	          <td>
	            <div class="ibox" style="display: flex; align-items: center;">
	              <input name="mem_name" id="mem_name" type="text" class="i_text" data-check="required"
	                     style="width:250px" value="${memdto.mem_name}"
	                     />
	                     <span></span>
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <th>성별</th><!-- 성명 -->
	          <td>
	            <div class="ibox" style="display: flex; align-items: center;">
	            <select class="i_text" name="mem_gender">
		            <c:if test="${memdto.mem_gender=='여성'}">
		            	<option value="여성" selected>여성</option>
		            	<option value="남성">남성</option>
		            </c:if>
		            <c:if test="${memdto.mem_gender=='남성'}">
		            	<option value="여성">여성</option>
		            	<option value="남성" selected>남성</option>
		            </c:if>
	            </select>
	            </div>
	          </td>
	        </tr> 
	        <tr>
	          <th>생년월일</th><!-- 성명 -->
	          <td>
	            <div class="ibox" style="display: flex; align-items: center;">
	              <input name="mem_birth" type="date" class="i_text" data-check="required"
	                     style="width:250px" value="${memdto.mem_birth}"/>
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <th>이메일</th><!-- 성명 -->
	          <td>
	            <div class="ibox" style="display: flex; align-items: center;">
	              <input name="mem_email" id="mem_email" type="text" class="i_text" data-check="required"
	                     style="width:250px" value="${memdto.mem_email}"
	                     />
	                <span></span>
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <th>전화번호</th><!-- 성명 -->
	          <td>
	            <div class="ibox" style="display: flex; align-items: center;">
	              <input name="mem_phone" id="mem_phone" type="text" class="i_text" data-check="required"
	                     style="width:250px" value="${memdto.mem_phone}"
	                     />
	                     <span></span>
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <th>우편번호</th><!-- 성명 -->
	          <td>
	            <div class="ibox" style="display: flex; align-items: center;">
	              <input name="mem_zip" id="mem_zip" type="text" class="i_text zip" data-check="required"
	                     style="width:100px" value="${memdto.mem_zip}" readonly />
	                     &nbsp;
                  <!-- 지도 API 활용 -->
                  <input type="button" style="border-radius:8px;" onclick="findAddress()" class="section_cont_text_btn register_list_btn" value="우편번호 찾기">
               
	            </div>
	          </td>
	        </tr>
	        <tr>
                <th>주소</th><!-- 상세 주소 -->
                <td>
                 <div class="ibox" style="display: flex; align-items: center;">
                    <input name="mem_addr" id="mem_addr" type="text" class="i_addr addr" data-check="required"
                        style="width:250px" value="${memdto.mem_addr}" placeholder="주소를 입력해주세요"/>
                 </div>
				<div class="ibox" style="display: flex; align-items: center;">
                    <input name="mem_addr2" id="mem_addr2" type="text" class="i_addr2 addr" data-check="required"
                          style="width:400px" value="${memdto.mem_addr2}" placeholder="상세주소를 입력해주세요"/>
                 </div>
                 </td>
            </tr>
	        <tr>
	          <th>회원등급</th><!-- 성명 -->
	          <td>
	            <div class="ibox" style="display: flex; align-items: center;">
	              <input name="mem_grade" type="text" class="notselect" data-check="required"
	                     style="width:250px" value="${memdto.mem_grade}" readonly/>
	            </div>
	          </td>
	        </tr>
	        <tr>
	          <th>회원가입일</th><!-- 성명 -->
	          <td>
	            <div class="ibox" style="display: flex; align-items: center;">
	              <input name="mem_date" type="date" class="notselect" data-check="required"
	                     style="width:250px" value="${memdto.mem_date}" readonly/>
	            </div>
	          </td>
	        </tr>
        </tbody>
      </table>
   
    <div class="info_cont_left">
      <button class="section_cont_text_btn section_cont_text_btn qna_list_btn"
      type="submit" style="border-radius:8px; margin-right:0px;"
      >정보수정</button>
       <a class="section_cont_text_btn section_cont_text_btn qna_list_btn" style="background:#555; border-radius:8px;"
         onclick="history.back();">이전페이지</a>
    </div>
     </form>
  </div>
</div>
<script src="./js/footer.js" ></script>
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

<%-- <% if(request.getParameter("error") != null){ %>
	<script>
			window.alert("정보 수정 중 오류가 발생하였습니다.");
			location.href = '/ParaisoResort/index.do';
		</script>	
<%} %> --%>
<c:if test="${param.error ne null}">
	<script>
		window.alert("로그인 후 이용해주세요.");
		location.href = '/ParaisoResort/login.do';
	</script>
</c:if>

</body>
</html>
