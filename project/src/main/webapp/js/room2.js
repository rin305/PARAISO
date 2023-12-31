//slider 엘리먼트 정의 (사진 개수가 많아져 배열로 정의)
const slider_array = [document.querySelector("#small_slide_1"), document.querySelector("#small_slide_2"), document.querySelector("#small_slide_3"), document.querySelector("#small_slide_4")]
const big_pic = document.querySelector("#sub_slider_big_pic");
const small_left = document.querySelector(".slide_btn_left");
const small_right = document.querySelector(".slide_btn_right");
// 현재 활성화 되어 있는 사진의 번호
let picNum = 0;

// slider의 작은 사진 클릭 시 배열로 정의
slider_array.forEach(function(small_slider, index) {
    slider_array[index].addEventListener("click", () => {
        // 현재 표시되어 있는 index와 다를 경우에만 동작
        if(picNum === index) {
        } else {
            // src값으로 찾을 pic_num 정의
            let pic_num = index+1;
            // 큰 사진 변경
            big_pic.src = `./image/room2_big${pic_num}.jpg`;

            // 버튼 클릭 시 현재 활성화된 사진을 클릭한 index값으로 변경, 기존 active된 사진 active 제거
            slider_array[picNum].classList.remove("active");
            small_slider.classList.add("active");
            // 현재 active된 사진의 index값 picNum에 정의
            picNum = index;
        }
    });
});

// left버튼 클릭 시
small_left.addEventListener("click", () => {
    // picNum이 0일 경우 picNum을 3으로 넘겨주어 처리
    if(picNum === 0) {
        // 큰 사진 변경
        big_pic.src = `./image/room2_big4.jpg`;

        // 버튼 클릭 시 picNum을 3로 변경하며 해당 사진 활성화
        slider_array[picNum].classList.remove("active");
        slider_array[3].classList.add("active");
        picNum = 3;
    } else {
        // 큰 사진 변경
        big_pic.src = `./image/room2_big${picNum}.jpg`;

        // 버튼 클릭 시 왼쪽에 정렬된 사진을 활성화
        slider_array[picNum].classList.remove("active");
        slider_array[picNum - 1].classList.add("active");
        picNum--;
    }
});

// right버튼 클릭 시
small_right.addEventListener("click", () => {
    // picNum이 3일 경우 picNum을 0으로 넘겨주어 처리
    if(picNum === 3) {
        // 큰 사진 변경
        big_pic.src = `./image/room2_big1.jpg`;

        // 버튼 클릭 시 picNum을 3으로 변경하며 해당 사진 활성화
        slider_array[picNum].classList.remove("active");
        slider_array[0].classList.add("active");
        picNum = 0;
    } else {
        // src값으로 찾을 pic_num 정의
        let pic_num = picNum + 2;
        // 큰 사진 변경
        big_pic.src = `./image/room2_big${pic_num}.jpg`;

        // 버튼 클릭 시 오른쪽에 정렬된 사진을 활성화
        slider_array[picNum].classList.remove("active");
        slider_array[picNum + 1].classList.add("active");
        picNum++;
    }
});

// 버튼 클릭 시 맨 위로 이동