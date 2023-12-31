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
    <title>PARAISO</title>

    <!-- CSS Import -->
<!--     <script src="./js/index.js"></script> -->
    <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    
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
            <h1 id="ltitle">리조트 소개</h1>
        </div>

        <!-- 슬라이드 Start -->
        <!-- 슬라이드 사용 여부 / 환경설정에서 수정가능 -->
        <div class="sub_slide_area">
            <!-- 슬라이드 큰이미지 -->
            <div class="sub_slide_big">
                <!-- 슬라이드 큰 이미지 버튼 -->
                <div class="slide_btn_area">
                    <a class="slide_big_btn_left"></a>
                    <a class="slide_big_btn_right"></a>
                </div>
                <img src="./image/info_big.png" alt="이미지슬라이드큰이미지" id="sub_slider_big_pic"/>
            </div>


            <!-- 썸네일 그룹 -->
            <div class="s_slider_grp">
                <!-- 슬라이드 버튼 -->
                <div>
                    <a class="slide_btn_left"></a>
                    <a class="slide_btn_right"></a>
                </div>
                <!-- 썸네일 -->
                <ul class="sub_slide_small" style="overflow: hidden;">
                    <li class="active" id="small_slide_1">
                        <img src="./image/info_small1.png" alt="이미지슬라이드작은이미지">
                        <span class="hover_bg"></span>
                    </li>

                    <li id="small_slide_2">
                        <img src="./image/info_small2.png" alt="이미지슬라이드작은이미지">
                        <span class="hover_bg"></span>
                    </li>
                </ul>
            </div>
            <!--//썸네일 그룹 -->
        </div>
        <!-- 슬라이드 End -->


        <!-- 	<td> -->
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <table class="tb_infor">
            <colgroup>
                <col width="30%"/>
                <col width="70%"/>
            </colgroup>
            <tbody>
            <tr>
                <th>
                    <p>WELCOME TO</p>
                    <p>THE PARAISO RESORT</p>
                </th>
                <td>
                    <h3 class="infor_txt01">PARAISO리조트 홈페이지를 방문해주신 고객 여러분 감사합니다.</h3>
                    <p>&nbsp;</p>
                    <p>저희 PARAISO는 맑은 공기와 여유와 즐거움을 간직하고 있으며,</p>
                    <p>전 객실을 이용하시는 고객여러분의 편의를 최우선으로 늘 최적의 서비스를 제공하고 있습니다.</p>
                    <p>특히 호텔내에 최고의 부대시설을 갖추고 있어 여행길이 편리하도록 도와드립니다.</p>
                    <p>고객여러분께 최적의 서비스를 제공하는 저희 PARAISO와 즐거운 여행이 되시길 바랍니다.</p>
                    <p>감사합니다.</p>
                    <p>&nbsp;</p>
                    <table class="tb_infor">
                        <tbody>
                        <tr>
                            <td><img style="width: 100%;" src="./image/tb_infor1.jpg" alt=""/></td>
                            <td style="width: 20px;">&nbsp;</td>
                            <td><img style="width: 100%;" src="./image/tb_infor2.jpg" alt=""/></td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            </tbody>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>


        <!-- 탭 시작 -->

        <div class="page_tab">
            <ul>
                <li class="tab_btn tab_on" data-btno="1" id="page_tab_info" style="cursor: pointer;"><a>INFORMATION</a></li>
                <li class="tab_btn " data-btno="2" id="page_tab_floor" style="cursor: pointer;"><a>FLOOR</a></li>
            </ul>
        </div>
        <div id="content_tab">
            <div class="tab_ny" data-btno="1" id="ny_info">
                <div class="hotel_info_box">
                    <table class="hotel_info_tb">
                        <colgroup>
                            <col width="15%"/>
                            <col width="85%"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th class="hotel_info_th">주소</th>
                            <td class="hotel_info_td"><span>서울 강남구 테헤란로1길 10 세경빌딩</span></td>
                        </tr>
                        <tr>
                            <th class="hotel_info_th">연락처</th>
                            <td class="hotel_info_td">02-538-3644</td>
                        </tr>
                        <tr>
                            <th class="hotel_info_th">객실수</th>
                            <td class="hotel_info_td">총 62실 (49㎡ 54실, 102㎡ 8실)</td>
                        </tr>
                        <tr>
                            <th class="hotel_info_th">주요시설</th>
                            <td class="hotel_info_td">레스토랑 / 편의점  / 수영장  </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="tab_ny" data-btno="2" id="ny_floor" style="display: none;">

            <div class="hotel_info_box">
                <table class="hotel_info_tb">
                    <colgroup>
                        <col width="15%"/>
                        <col width="85%"/>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="hotel_info_th">3F</th>
                        <td class="hotel_info_td">객실</td>
                    </tr>
                    <tr>
                        <th class="hotel_info_th">2F</th>
                        <td class="hotel_info_td">객실</td>
                    </tr>
                    <tr>
                        <th class="hotel_info_th">1F</th>
                        <td class="hotel_info_td">레스토랑</td>
                    </tr>
                    <tr>
                        <th class="hotel_info_th">로비층</th>
                        <td class="hotel_info_td">편의점, 수영장</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <!-- 탭 끝 -->

</div>

<script src="./js/info.js?ver=1"></script>
<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>
        
        
        