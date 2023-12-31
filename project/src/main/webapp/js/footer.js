/**
 * 
 */
 
 // 버튼 클릭 시 맨 위로 이동
const $btn_top = document.querySelector(".btn_top");

$btn_top.onclick = () => {
  window.scrollTo({ top: 0, behavior: "smooth" });  
}