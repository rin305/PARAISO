<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>PARAISO 리조트</title>

    <!-- CSS Import -->
    <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <!-- Google 지도 출력 JS -->
    <script type="module" src="./js/loca.js?ver=1"></script>
    
    <!-- 플러그인 -->
    
</head>

<body>


<jsp:include page="/template/header.jsp"></jsp:include>

        <div id="dropMenuBg"></div>
        
        
        
<!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="mtitle">리조트 안내</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/info1.png"/>
    </div>
</div>
<!-- //서브상단이미지 -->

<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area">
        <div class="subtitbox02">
            <h1 id="ltitle">오시는 길</h1>
        </div>


        <!-- 	<td> -->
        <div class="map_grp">
            <div id="map" style="height: 500px; border: 1px #ddd solid;"></div>
            <div class="map_btn">
                <a class="google_map_btn active" onclick="location.reload();">
                    <span class="google_icon">&nbsp;</span>구글 지도
                </a>
            </div>
        </div>


        <br/><br/>


        <div style="padding: 50px 20px 50px 0px; border: 1px solid #ddd;">
            <table class="tb_loca tb_loca01">
                <thead>
                <tr>
                    <th><span class="item01">&nbsp;</span>주소&amp;연락처</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <h4>주소</h4>
                        <p class="바탕글"><span>서울 강남구 테헤란로1길 10 세경빌딩</span></p>
                        <p>&nbsp;</p>
                        <h4>연락처</h4>
                        <p class="바탕글">예약 : 02-538-3644</p>
                        <p class="바탕글">프론트 :&nbsp;<span>02-538-3644</span></p>
                        <p class="바탕글">이메일 :&nbsp;<span>almostparaiso@gmail.com</span></p>
                        <p class="바탕글"><br/><br/></p>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <h2 class="tb_loca_tit">자동차로 오시는길</h2>
        <table class="tb_loca02">
            <thead>
            <tr>
                <th style="text-align: left;">자동차 이용시</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>서울 &rarr; 강남구 &rarr; 테헤란로 1길 10 &rarr; 세경빌딩</td>
            </tr>
            </tbody>
            <thead>
            <tr>
                <th style="text-align: left;">네비게이션 이용시</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>해당 주소로 검색하시기 바랍니다. (서울 강남구 테헤란로1길 10 세경빌딩)</td>
            </tr>
            </tbody>
        </table>
        <h2 class="tb_loca_tit">대중교통으로 오시는 길</h2>
        <table class="tb_loca02">
            <thead>
            <tr>
                <th style="text-align: left;">택시 이용시</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>세경빌딩 (예상 요금 약 30,000원)</td>
            </tr>
            </tbody>
        </table>


        <!-- 탭 시작 -->

        <!-- 탭 끝 -->

    </div>
    <!-- Content End -->
</div>
<!-- contents End -->
        
    <script  src=
                "https://maps.googleapis.com/maps/api/js?key=AIzaSyDWeO8mFVKTHBDnk17NctzN1ts3ijxsHBQ&callback=initMap&libraries=places,geometry&solution_channel=GMP_QB_locatorplus_v6_cA"
        sync defer
></script><!-- 이거 줄 수정하면 지도 안보임 -->

<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
<script src="./js/index.js?ver=1"></script>

</body>
</html>