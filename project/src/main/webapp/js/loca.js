// 구글 맵 추가 코드
let map;

function initMap() {
    // 구글 지도 중심 위치 등록
    const myLatlng = new google.maps.LatLng(37.498976291567104,127.02816511165675);
    // 구글 지도 생성
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 17,
        scrollwheel: false,
        center: myLatlng,
    });
    // marker에 추가적으로 보여질 안내 문구 등록
    const contentString ='<b>PARAISO 리조트</b><br/><div class="wrap" style="display:flex; flex-direction:row;align-items: center; "><BR><p>주식회사 PARAISO</p><p style="font-size:10px; margin:0 6px">|</p><p>서울 강남구 테헤란로1길 10 세경빌딩</p><p style="font-size:10px; margin:0 6px">|</p><p>대표이사 : PARAISO</p><p style="font-size:10px; margin:0 6px">|</p><p>사업자번호 : 02-538-3644</p><BR></div><BR><div class="wrap02" style="display:flex; flex-direction:row;align-items: center; "><BR><p>예약실 : 02-538-3644</p><p style="font-size:10px; margin:0 6px">|</p><p>프론트 : 02-538-3644</p><p style="font-size:10px; margin:0 6px">|</p><p>이메일 : almostparaiso@gmail.com</p><p style="font-size:10px; margin:0 6px">|</p><p>FAX : 02-538-3644</p><BR></div><BR>ⓒ 2023 PARAISO. ALL RIGHTS RESERVED.<BR><BR><BR><BR><BR><BR>';
    const infowindow = new google.maps.InfoWindow({content: contentString});
    // 현재 지도 해당 위치에 marker 추가
    const marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
    });
    // marker 클릭 시 보여질 안내문구 출력
    marker.addListener("click", () => {
        infowindow.open({
            anchor: marker,
            map,
        });
    });
}

window.initMap = initMap;


// 버튼 클릭 시 맨 위로 이동
/*
const $btn_top = document.querySelector(".btn_top");

$btn_top.onclick = () => {
    window.scrollTo({ top: 0, behavior: "smooth" });
}
*/