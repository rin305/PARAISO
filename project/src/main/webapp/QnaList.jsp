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
    <title>문의 게시판</title>
        <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
      <!-- 플러그인 -->
  <style>
    select {
      border: none;
      
    }
    option{
    border:none;
    }
    
		.qna_style {
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
		
		.qna_td {
			left: 28px;
			text-align: center;
			height: 40px;
			font-size: 15px;
			border: none;
		}
		
		.qna_hover{
			transition:all 0.5s;
		}
		.qna_hover:hover{
		 background: #e1e1e1;
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
		.mng{
		background: #eee;
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
  <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
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
            <h1 id="ltitle">문의하기</h1>
        </div>

        <!-- 	<td> -->
        <div class="info_text_grp">
            <div class="info_cont_box">
                <div class="info_cont_tbox">
					<div class="info_cont_left">
						<button class="btn btn-edit">
						<a href="QnaWriteForm.do">문의하기</a></button>
					</div>
				<form name="search" >
					<div class="srch_box" style="padding: 0;">
					<fieldset class="chk_box">
						<span class="sea_ibox">
							<select name="qna_type" style="width:100px; left:10px;padding-left:8px; padding-right:8px; padding-bottom:5px; " placeholder="문의 유형">
								<option value="">문의 유형</option>
								<option value="결제문의">결제문의</option>
								<option value="이용문의">이용문의</option>
								<option value="시설문의">시설문의</option>
								<option value="건의사항">건의사항</option>
								<option value="기타">기타</option>
							</select>
						</span>
						<span class="sea_ibox">
							<select name="search" style="width:100px; left:10px;padding-left:8px; padding-right:8px; padding-bottom:5px; ">
								<option value="qna_subject">제목</option>
								<option value="qna_subject_qna_content">제목+본문</option>
							</select>
						</span> 
						<span class="sea_ibox">
							<input name="searchtext" id="gskeyword" value="" type="text" class="i_text" placeholder="제목, 내용으로 검색" style="width: 180px;">
								<button type="submit" id="searchBtn" style="border:none;" class="sea_btn">
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
                            <col width="9%"/>
                            <col width="10%" />
                            <col width="49%"/>
                            <col width="7%"/>
                            <col width="7%"/>
                            <col width="8%"/>
                        </colgroup>
                        <thead>
                        <span>
                    <strong>Q&A</strong>
                    <span class="divider">|</span>
                            게시물 수 : ${pgList.count}</span>
                        <tr>
                            <th class="qna_style">No.</th>
                            <th class="qna_style">문의유형</th>
                            <th class="qna_style">제목</th>
                            <th class="qna_style">작성자</th>
                            <th class="qna_style">작성일</th>
                            <th class="qna_style">조회수</th>
                        </tr>
                        </thead>
                        <center>
                        <c:set var="number" value="${pgList.number}"/>
					    <c:forEach var="article" items="${articleList}">
					    <c:if test="${article.qna_writer ne '관리자'}">
					   		<tr height="30" class="qna_hover">
					   		</c:if>
					   		<c:if test="${article.qna_writer eq '관리자'}">
					   		<tr height="30" class="qna_hover mng">
					   		</c:if>
                       <!-- 하나씩 감소하면서 출력하는 게시물번호 -->
								    <td class="qna_td" align="center"  style="text-align:center" width="50" >
								    	<c:out value="${number}"/>
								    	<c:set var="number" value="${number-1}"/>
								    </td>
								    <td class="qna_td" align="center" width="5">
								    	${article.qna_type}
								    </td>
								    <td class="qna_td" align="center" style="cursor:pointer;">
									  <!-- 답변글인 경우 먼저 답변이미지를 부착시키는 코드 -->
									 <c:if test="${article.qna_re_level > 0 }">
										 <c:forEach begin="1" end="${article.qna_re_level}">
										 &nbsp;&nbsp;
										 </c:forEach>
									  		RE :
										</c:if>
									  	<a href="QnaContent.do?qna_num=${article.qna_num}&pageNum=${pgList.currentPage}">
								           ${article.qna_subject}</a>
								    </td>
								       <td class="qna_td"  align="center"  width="150">
								       	${article.qna_writer} 
								       </td>
								    <td class="qna_td"  align="center"  width="150">
								   		 <fmt:formatDate value="${article.qna_date}"
								   		 							timeStyle="medium"
								   		 							pattern="yy.MM.dd" />
								    </td>
								    <td class="qna_td" >${article.qna_readcount}</td>
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
            		 <a href="/ParaisoResort/QnaList.do?pageNum=${pgList.startPage-pgList.blockSize}&qna_type=${qna_type}&search=${search}&searchtext=${searchtext}"
            		 class="arrow_prev arrow pre pagebtn"></a>
                   </c:if>
                  
                   <c:forEach var="i" begin="${pgList.startPage}" end="${pgList.endPage}">
     				<a href="/ParaisoResort/QnaList.do?pageNum=${i}&qna_type=${qna_type}&search=${search}&searchtext=${searchtext}">
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
      	<a href="/ParaisoResort/QnaList.do?pageNum=${pgList.startPage+pgList.blockSize}&qna_type=${qna_type}&search=${search}&searchtext=${searchtext}"
    			class="arrow_next arrow next pagebtn"></a>
 			</c:if>  
 			</li>
                </ul>
                <p>&nbsp;</p>
            </div>
        </div>
    </div>
</div>



<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>
        