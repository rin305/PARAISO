<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
%>    
<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <meta name="format-detection" content="telephone=no, address=no, email=no">
  <meta name="mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script language="JavaScript" src="./js/prototype.js"></script>
<script language="JavaScript" src="./js/pwCheck.js?ver=1"></script>
  <title>비밀번호 변경</title>
<style>
    h1{
       font-weight: 500;
       color: #343b6a;
       font-size: 20px;
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
  <!-- CSS Import -->
  <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

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
			<li class="nav-item">
			<a class="nav-link"
				href="<%=request.getContextPath() %>/memberDelete.jsp">회원탈퇴</a></li>
		</ul>
		<br><br>
    <form id="frm" name="frm" class="changeForm" action="changepw.do" method="post">
      <input type="hidden" name="eegbcode" value="KOR">
      <input type="hidden" name="bmbeonho" value="0000">
      <table cellpadding="0" cellspacing="0" class="view_tbt">
        <caption>기본뷰</caption>
        <colgroup>
          <col width="20%">
          <col width="80%">
        </colgroup>
        <tbody>

        <tr>
          <th>현재 비밀번호</th>
          <td>
            <div class="ibox" style="display: flex; align-items: center;">
              <input name="currentPw" id="currentPw" type="password" class="i_text" required autocomplete="off"
                     style="width:250px" onblur="curPwCheck(frm.currentPw.value)">
               <span id="curpwmsg"></span>
            </div>
          </td>
        </tr>

        <tr>
          <th>새 비밀번호</th>
          <td>
            <div class="ibox" style="display: flex; align-items: center;">
              <input name="newPw" id="newPw" type="password" class="i_text" required autocomplete="off"
                     style="width:250px" onblur="newPwCheck(frm.newPw.value)">
               <span id="newpwmsg"></span>
            </div>
          </td>
        </tr>

        <tr>
          <th>새 비밀번호 확인</th>
          <td>
            <div class="ibox" style="display: flex; align-items: center;">
              <input name="newPw2" id="newPw2" type="password" class="i_text" required autocomplete="off"
                     style="width:250px" onkeyup="newPwReCheck(frm.newPw2.value)">
              <span id="newpwcheckmsg"></span>
            </div>
          </td>
        </tr>
        </tbody>
      </table>
    
    <div class="info_cont_left">
      <button type="submit" class="section_cont_text_btn section_cont_text_btn qna_list_btn" style="max-width: 150px;border-radius:8px;">비밀번호 변경</button>
      <a class="section_cont_text_btn section_cont_text_btn qna_list_btn" style="background:#555; border-radius:8px;"
         onclick="history.back();">이전페이지</a>
    </div>
    </form>
  </div>
</div>
</head>
<c:if test="${param.error ne null}">
	<script>
		window.alert("회원 로그인 후 이용 바랍니다.");
		location.href = '/ParaisoResort/index.do';
	</script>
</c:if>

<script src="./js/footer.js" ></script>

</body>
</html>
