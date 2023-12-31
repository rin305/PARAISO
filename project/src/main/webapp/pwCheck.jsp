<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
//searchWord.js=>IdCheck.jsp?mem_id='kkk'&timestamp=?
//xhrObject->xml형태로 받을 수 있도록 하고 싶다.(태그+문자열)
    //추가
    response.setContentType("text/xml;charset=utf-8");
   String outString="";//xhr객체에게 전달할 내용을 담을 변수선언 
	
   String idKey=(String)session.getAttribute("idKey");
    String currentPw=request.getParameter("currentPw");
   
    System.out.println("pwCheck의 idKey=>"+idKey+", currentPw=>"+currentPw);
    
    //->member->MemberDAO객체필요=>loginCheck()호출
    MemberDAO memdao=new MemberDAO();
    MemberDTO memdto=memdao.getPerson(idKey);
    boolean check = currentPw.equals(memdto.getMem_pw());
    System.out.println("pwCheck.jsp의 check="+check);
%>

<body>

<%
   if(check==false){//비밀번호가 일치하지 않는다면
	 outString="<font color='red'>&nbsp;&nbsp;&nbsp;정확한 비밀번호를 입력해주세요.</font>";
   }
  //xhr객체가 받을 수 있도록 전송
 out.println(outString);
  System.out.println(outString);//콘솔에 출력(디버깅)  
%> 
<%-- <c:if test="${check==0}">
		<font color="red">이미 존재하는 아이디입니다.</font>
</c:if>
<c:if test="${check==1}">
		<font color="green">멋진 아이디군요!</font>
</c:if> --%>
</body>
</html>













