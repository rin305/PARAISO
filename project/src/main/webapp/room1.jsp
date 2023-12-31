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
<!--     <script src="./js/index.js"></script> -->
    <link type="text/css" href="./css/basic.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- 플러그인 -->

</head>

<body>
<jsp:include page="/template/header.jsp"></jsp:include>

        <div id="dropMenuBg"></div>



<!-- 서브상단이미지 -->
<div class="sub_topgrp">
    <div class="subtitbox">
        <h1 id="mtitle">객실안내</h1>
    </div>
    <div class="s_topimg">
        <img src="./image/room_top.png"/>
    </div>
</div>
<!-- //서브상단이미지 -->


<!-- Contents Start -->
<div id="contents_sub">
    <div class="content_area">
        <div class="subtitbox02">
            <h1 id="ltitle">스위트룸</h1>
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
                <img src="./image/room1_big1.jpg" alt="이미지슬라이드큰이미지" id="sub_slider_big_pic"/>
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
                        <img src="./image/room1_small1.jpg" alt="이미지슬라이드작은이미지">
                        <span class="hover_bg"></span>
                    </li>

                    <li id="small_slide_2">
                        <img src="./image/room1_small2.jpg" alt="이미지슬라이드작은이미지">
                        <span class="hover_bg"></span>
                    </li>

                    <li id="small_slide_3">
                        <img src="./image/room1_small3.jpg" alt="이미지슬라이드작은이미지">
                        <span class="hover_bg"></span>
                    </li>

                    <li id="small_slide_4">
                        <img src="./image/room1_small4.jpg" alt="이미지슬라이드작은이미지">
                        <span class="hover_bg"></span>
                    </li>

                    <li id="small_slide_5">
                        <img src="./image/room1_small5.jpg" alt="이미지슬라이드작은이미지">
                        <span class="hover_bg"></span>
                    </li>
                </ul>
            </div>
            <!--//썸네일 그룹 -->
        </div>
        <!-- 슬라이드 End -->


        <!-- 	<td> -->
        <div class="info_text_grp">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <div class="info_cont_box">
                <div class="info_cont_tbox">
                    <div class="info_cont_left">
                        <h2 class="info_cont_title">스위트룸</h2>
                        <p class="info_cont_txt">합리적인 가족 여행을 위한 스위트 객실</p>
                    </div>
                </div>
                <p>&nbsp;&nbsp;</p>
                <div class="info_ntb_box">
                    <table class="info_ntb">
                        <colgroup>
                            <col width="15%"/>
                            <col width="35%"/>
                            <col width="15%"/>
                            <col width="35%"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th class="info_ntb_th">체크인</th>
                            <td class="info_ntb_td">15:00</td>
                            <th class="info_ntb_th">체크아웃</th>
                            <td class="info_ntb_td">11:00</td>
                        </tr>
                        <tr>
                            <th class="info_ntb_th">
                                <p><span style="font-size: medium;">기준인원 /</span></p>
                                <p><span style="font-size: medium;">투숙정원</span></p>
                            </th>
                            <td class="info_ntb_td">4인 / 4인</td>
                            <th class="info_ntb_th">최대인원</th>
                            <td class="info_ntb_td">6인</td>
                        </tr>
                        <tr>
                            <th class="info_ntb_th">타입</th>
                            <td class="info_ntb_td">양실2 + 거실1 + 화장실2</td>
                            <th class="info_ntb_th">사이즈</th>
                            <td class="info_ntb_td">102㎡</td>
                        </tr>
                        <tr>
                            <th class="info_ntb_th">전망</th>
                            <td class="info_ntb_td">오션뷰</td>
                            <th class="info_ntb_th">정상가</th>
                            <td class="info_ntb_td">680,000원</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <h2 class="info_cont_main_tit">Amenities</h2>
                <ul class="info_cont_ulbox">
                    <li class="info_cont_li info_cont_li01">
                        <div class="info_cont_timg"><img src="./image/Amenities1.png" alt=""/></div>
                        <h2 class="info_cont_tit">전자제품</h2>
                        <div class="info_cont_txtbox">
                            <p class="info_cont_txt">- TV</p>
                            <p class="info_cont_txt">- 냉장고</p>
                            <p class="info_cont_txt">- 전기포트</p>
                            <p class="info_cont_txt">- 헤어드라이기</p>
                            <p class="info_cont_txt">- 전자레인지</p>
                            <p class="info_cont_txt">- 스타일러</p>
                        </div>
                    </li>
                    <li class="info_cont_li info_cont_li01">
                        <div class="info_cont_timg"><img src="./image/Amenities2.png" alt=""/></div>
                        <h2 class="info_cont_tit">가구</h2>
                        <div class="info_cont_txtbox">
                            <p class="info_cont_txt">- 식탁 1개</p>
                            <p class="info_cont_txt">- 의자 4개</p>
                            <p class="info_cont_txt">- 테이블</p>
                            <p class="info_cont_txt">- 화장대</p>
                        </div>
                    </li>
                    <li class="info_cont_li info_cont_li01">
                        <div class="info_cont_timg"><img src="./image/Amenities3.png" alt=""/></div>
                        <h2 class="info_cont_tit">시설</h2>
                        <div class="info_cont_txtbox">
                            <p class="info_cont_txt">- 무료 와이파이</p>
                            <p class="info_cont_txt">- 각종 OTT 서비스 제공</br>(넷플릭스, TVING, 웨이브, 디즈니플러스)</p>
                            <p class="info_cont_txt">- 다리미</p>
                            <p class="info_cont_txt">- 아기욕조</p>
                        </div>
                    </li>
                    <li class="info_cont_li info_cont_li01">
                        <div class="info_cont_timg"><img src="./image/Amenities4.png" alt=""/></div>
                        <h2 class="info_cont_tit">욕실</h2>
                        <div class="info_cont_txtbox">
                            <p class="info_cont_txt">- 샴푸</p>
                            <p class="info_cont_txt">- 린스</p>
                            <p class="info_cont_txt">- 바디워시</p>
                            <p class="info_cont_txt">- 클렌징폼</p>
                            <p class="info_cont_txt">- 클렌징타월</p>
                            <p class="info_cont_txt">- 타월</p>
                            <p class="info_cont_txt">- 칫솔</p>
                            <p class="info_cont_txt">- 치약</p>
                            <p class="info_cont_txt">- 면봉</p>
                            <p class="info_cont_txt">- 화장솜</p>
                        </div>
                    </li>
                </ul>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <p>&nbsp;</p>
                <div class="con_box_guide">
                    <h3 class="con_tit">※ 안내사항</h3>
                    <div class="con_box_tbox">
                        <p class="con_box_txt"><span style="font-size: medium;">&middot; 이용요금은 VAT포함입니다.</span></p>
                        <p class="con_box_txt"><span style="font-size: medium;">&middot; 투숙 정원 외 인원 추가는 최대 2명까지 가능하며, 1명당 1박 10,000원의 별도 요금이 추가됩니다.</span>
                        </p>
                        <p class="con_box_txt"><span style="font-size: medium;">&middot; 입실시간은 18시, 퇴실시간은 13시입니다.</span>
                        </p>
                        <p class="con_box_txt"><span style="font-size: medium;">&middot; 예약금은 예약 당일 이틀전까지만 100% 환불 가능하며, 예약일 하루 전 취소시에는 50%의 수수료를 차감한 금액이 환불됩니다.</span>
                        </p>
                        <p class="con_box_txt"><span style="font-size: medium;">&middot; 예약일 당일에는 환불 불가합니다.</span>
                        </p>
                        <p class="con_box_txt"><span style="font-size: medium;">&middot; 객실의 모든 시설물 훼손 시 당사는 손해배상을 청구할 수 있습니다.</span>
                        </p>
                        <p class="con_box_txt"><span style="font-size: medium;">&middot; 예약전화 : 02) 123 - 4567</span></p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<script src="./js/room1.js?ver=1"></script>
<script>AOS.init();</script>
<jsp:include page="/template/footer.jsp"></jsp:include>
<script src="./js/footer.js?ver=1"></script>
</body>
</html>
        