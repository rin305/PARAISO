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
        big_pic.src = "./image/add2_big1.jpg";

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
        big_pic.src = "./image/add2_big2.jpg";

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
        big_pic.src = "./image/add2_big2.jpg";

        // 버튼 클릭 시 현재 활성화된 사진을 2번 사진으로 변경
        small_slider2.classList.add("active");
        small_slider1.classList.remove("active");
        picNum = 2;
    } else {
        // 버튼 클릭 시 활성화되어 있는 큰 사진을 1번 사진으로 변경
        big_pic.src = "./image/add2_big1.jpg";

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
        big_pic.src = "./image/add2_big1.jpg";

        // 버튼 클릭 시 현재 활성화된 사진을 1번 사진으로 변경
        small_slider1.classList.add("active");
        small_slider2.classList.remove("active");
        picNum = 1;
    } else {
        // 버튼 클릭 시 활성화되어 있는 큰 사진을 2번 사진으로 변경
        big_pic.src = "./image/add2_big2.jpg";

        // 버튼 클릭 시 현재 활성화된 사진을 2번 사진으로 변경
        small_slider2.classList.add("active");
        small_slider1.classList.remove("active");
        picNum = 2;
    }
});

