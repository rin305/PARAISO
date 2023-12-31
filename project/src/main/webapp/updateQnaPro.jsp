<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="model.*"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<c:if test="${check==1}">
  	<meta http-equiv="Refresh" content="0;url=/ParaisoResort/QnaList.do?pageNum=${pageNum}">
  	</c:if>
  	<c:if test="${check==0}">
   <script>
           alert("로그인 후 이용해주세요");
           history.back();
   </script>
   </c:if>

   