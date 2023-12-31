// tab 버튼 엘리먼트 정의
const infoBtn = document.querySelector("#page_tab_info");
const floorBtn = document.querySelector("#page_tab_floor");

// content_tab 엘리먼트 정의
const infoCon = document.querySelector("#ny_info");
const floorCon = document.querySelector("#ny_floor");

// infoBtn 클릭시 tab에 INFORMATION이 보이게
infoBtn.addEventListener("click", () => {

    // 버튼 클릭 시 현재 활성화된 tab content를 INFORMATION으로 변경
    infoCon.style.display = "block";
    floorCon.style.display = "none";

    // 버튼 클릭 시 현재 활성화된 tab을 INFORMATION으로 변경
    floorBtn.classList.remove("tab_on");
    infoBtn.classList.add("tab_on");
});

// floorBtn 클릭시 tab에 FLOOR가 보이게
floorBtn.addEventListener("click", () => {

    // 버튼 클릭 시 현재 활성화된 tab content를 FLOOR로 변경
    infoCon.style.display = "none";
    floorCon.style.display = "block";

    // 버튼 클릭 시 현재 활성화된 tab을 FLOOR으로 변경
    floorBtn.classList.add("tab_on");
    infoBtn.classList.remove("tab_on");
});



//slider 엘리먼트 정의
const small_slider1 = document.querySelector("#small_slide_1");
const small_slider2 = document.querySelector("#small_slide_2");
const big_pic = document.querySelector("#sub_slider_big_pic");
const small_left = document.querySelector(".slide_btn_left");
const small_right = document.querySelector(".slide_btn_right");
// 현재 활성화 되어 있는 사진의 번호
let picNum = 1;

// slider의 작은 사진 클릭 시
small_slider1.addEventListener("click", () => {
    // 현재 활성화된 사진이 2번일 경우만
    if(picNum === 1) {
    } else {
        // 버튼 클릭 시 활성화되어 있는 큰 사진을 1번 사진으로 변경
        big_pic.src = "./image/info_big.png";

        // 버튼 클릭 시 현재 활성화된 사진을 1번 사진으로 변경
        small_slider1.classList.add("active");
        small_slider2.classList.remove("active");
        picNum = 1;
    }
});

// slider의 작은 사진 클릭 시
small_slider2.addEventListener("click", () => {
    // 현재 활성화된 사진이 1번일 경우만
    if(picNum === 2) {
    } else {
        // 버튼 클릭 시 활성화되어 있는 큰 사진을 2번 사진으로 변경
        big_pic.src = "./image/info_big22.png";

        // 버튼 클릭 시 현재 활성화된 사진을 2번 사진으로 변경
        small_slider2.classList.add("active");
        small_slider1.classList.remove("active");
        picNum = 2;
    }
});

// left버튼 클릭시
small_left.addEventListener("click", () => {
    // 현재 활성화된 사진이 1번일 경우 2번으로 옮겨줌 (2번 -> 1번 / 1번 -> 2번)
    if(picNum === 1) {
        // 버튼 클릭 시 활성화되어 있는 큰 사진을 2번 사진으로 변경
        big_pic.src = "./image/info_big22.png";

        // 버튼 클릭 시 현재 활성화된 사진을 2번 사진으로 변경
        small_slider2.classList.add("active");
        small_slider1.classList.remove("active");
        picNum = 2;
    } else {
        // 버튼 클릭 시 활성화되어 있는 큰 사진을 1번 사진으로 변경
        big_pic.src = "./image/info_big.png";

        // 버튼 클릭 시 현재 활성화된 사진을 1번 사진으로 변경
        small_slider1.classList.add("active");
        small_slider2.classList.remove("active");
        picNum = 1;
    }
});


// right버튼 클릭시
small_right.addEventListener("click", () => {
    // 현재 활성화된 사진이 2번일 경우 1번으로 옮겨줌 (1번 -> 2번 / 2번 -> 1번)
    if(picNum === 2) {
        // 버튼 클릭 시 활성화되어 있는 큰 사진을 1번 사진으로 변경
        big_pic.src = "./image/info_big.png";

        // 버튼 클릭 시 현재 활성화된 사진을 1번 사진으로 변경
        small_slider1.classList.add("active");
        small_slider2.classList.remove("active");
        picNum = 1;
    } else {
        // 버튼 클릭 시 활성화되어 있는 큰 사진을 2번 사진으로 변경
        big_pic.src = "./image/info_big22.png";

        // 버튼 클릭 시 현재 활성화된 사진을 2번 사진으로 변경
        small_slider2.classList.add("active");
        small_slider1.classList.remove("active");
        picNum = 2;
    }
});
