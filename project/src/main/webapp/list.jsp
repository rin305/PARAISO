<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/template/header.jsp"></jsp:include>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지 게시판</title>
        <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
      <!-- 플러그인 -->
  <style>
		select {
			border: none;
		}
		
		option {
			border: none;
		}
		
		.notice_style {
			height: 1px;
			text-align: center;
			color: black;
			font-size: 16px;
			border-top: 1.5px solid black;
			border-bottom: 1.5px solid #eee;
			font-weight: 500;
			padding: 15px;
			background-color: #fafafa;
		}
		
		.notice_td {
			left: 28px;
			text-align: center;
			height: 40px;
			font-size: 15px;
			border: none;
		}
		
		.notice_hover{
			transition:all 0.5s;
		}
		.notice_hover:hover{
		 background: #eee;
		}

        .btn-edit{
        color:white; 
        background:#363636;
        }
        
        .btn{
        width:100px;
        box-shadow: none;
        margin:10px;
        bottom:100px;
        border:none;
        border-radius: 13px;
        height:45px;
        position:relative;
        font-size:15px;
        top:10px;
        }
		
        .btn-edit:hover{
        color: #white !important;
  		background-color:black;
        }
	
</style>    
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 구글 폰트 cdn -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  
  
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  
  <!-- CSS Import -->
  <link type="text/css" href="./css/basic.css?ver=1" rel="stylesheet"/>
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	
</head>
<body>

<!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="mtitle">커뮤니티</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/faci_top.png"/>
    </div>
</div>

<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area">
        <div class="subtitbox02">
            <h1 id="ltitle">공지사항/이벤트</h1>
        </div>

        <!-- 	<td> -->
        <div class="info_text_grp">
            <div class="info_cont_box">
                <div class="info_cont_tbox">
					<div class="info_cont_left">
					<c:if test="${admincheck==true}">
						<button class="btn btn-edit">
						<a href="writeForm.do">글쓰기</a></button></c:if>
					</div>
				<form name="search" action="/ParaisoResort/list.do">
					<div class="srch_box" style="padding: 0;">
					<fieldset class="chk_box">
						<span class="sea_ibox">
							<select name="search" style="width:100px; left:10px;padding-left:8px; padding-right:8px; padding-bottom:5px; ">
								<option value="notice_subject">제목</option>
       							<option value="notice_subject_notice_content">제목+본문</option>
							</select>
						</span> 
						<span class="sea_ibox">
							<input name="searchtext" id="gskeyword" value="" type="text" class="i_text" placeholder="제목, 내용으로 검색" style="width: 180px;">
								<button type="submit" id="searchBtn" class="sea_btn" style="border:none;">
									<img src="./image/txt_srch.png" alt="search" align="absmiddle">
								</button>
						</span>
					</fieldset>
					</div>
				</form>
			</div>
                <!-- 데이터의 유무 -->
                <p>&nbsp;&nbsp;</p>
                <c:if test="${pgList.count > 0}">
                <div class="info_ntb_box">
                    <table class="info_ntb">
                    <center>
                        <colgroup>
                            <col width="12%"/>
                            <col width="73%" />
                            <col width="15%"/>
                        </colgroup>
                        <thead>
                        <span>
                    <strong>NOTICE / EVENT</strong>
                    <span class="divider">|</span>
                            게시물 수 : ${pgList.count}</span>
                        <tr>
                            <th class=" notice_style">No.</th>
                            <th class=" notice_style">제목</th>
                            <th class=" notice_style">작성일</th>
                        </tr>
                        </thead>
                        <center>
                        <c:set var="number" value="${pgList.number}"/>
					    <c:forEach var="article" items="${articleList}">
					   <tr height="30" class="notice_hover">
                       <!-- 하나씩 감소하면서 출력하는 게시물번호 -->
								    <td class="notice_td" align="center"   >
								    	<c:out value="${number}"/>
								    	<c:set var="number" value="${number-1}"/>
								    </td>
								    <td class="notice_td" style="left:10px;" align="center" >
									  <!-- 답변글인 경우 먼저 답변이미지를 부착시키는 코드 -->
								      <a href="content.do?notice_num=${article.notice_num}&pageNum=${pgList.currentPage}">
								           ${article.notice_subject}</a> 
								       </td>
								    <td align="center" class="notice_td" width="150">
								   		 <fmt:formatDate value="${article.notice_time}"
								   		 							timeStyle="medium"
								   		 							pattern="yy.MM.dd" />
								    </td>
								  </tr>
								  </center>
								  </c:forEach>
								</table>
									                                                  
                </div>
                </c:if>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
            <ul class="pageing paginate paginate_regular">
            		<c:if test="${pgList.startPage > pgList.blockSize}">
            		<li>
            		 <a href="/ParaisoResort/QnaList.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}"
            		 class="arrow_prev arrow pre pagebtn"></a>
                   </c:if>
                  
                   <c:forEach var="i" begin="${pgList.startPage}" end="${pgList.endPage}">
     				<a href="/ParaisoResort/list.do?pageNum=${i}&search=${search}&searchtext=${searchtext}">
     				<c:if test="${pgList.currentPage==i}">
     				<font color="black"><b>[${i}]</b></font>
     				</c:if>
     			<c:if test="${pgList.currentPage!=i}"> 
     						${i}
     			</c:if>
    					</a>
			</c:forEach>
			<li>
               <c:if test="${pgList.endPage <pgList.pageCount}">
      	<a href="/ParaisoResort/list.do?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}"
    			class="arrow_next arrow next pagebtn"></a>
 			</c:if>  
 			</li>
                </ul>
                <p>&nbsp;</p>

            </div>
        </div>


        <!-- 탭 시작 -->

        <!-- 탭 끝 -->

    </div>
    <!-- Content End -->
</div>
<!-- contents End -->

<!-- container End -->



<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>
        
